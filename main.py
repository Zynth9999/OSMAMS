## Main.py

import command
import bambuapi
import time 
import datetime
import os
from colorama import Fore, Back, Style
import checkgcode

if __name__ == '__main__':
    if os.path.isfile('printer_info.txt'):
        with open('printer_info.txt', 'r') as f:
            lines = f.readlines()
            ip = lines[0].strip()
            access_code = lines[1].strip()
            serial = lines[2].strip()
            port = lines[3].strip()
        bambuapi.connect_printer(ip, access_code, serial)
    else:
        ip = input('Enter printer IP address: ')
        access_code = input('Enter access code: ')
        serial = input('Enter serial number: ')
        port = input('Enter serial port of the AMS board(e.g., COM3 or /dev/ttyUSB0): ')
    ## Save data to file
    with open('printer_info.txt', 'w') as f:
        f.write(f'{ip}\n{access_code}\n{serial}\n{port}\n')

    # Create printer object    
    printer = bambuapi.connect_printer(ip, access_code, serial)
    print(Fore.CYAN + 'Connecting to AMS...')
    ser_connection = command.connect_serial(port)
    if ser_connection is None:
        print("Failed to connect to AMS board. Please check:")
        print("1. Is the board connected via USB?")
        print("2. Is the correct COM port specified?")
        print("3. Is another program using the serial port?")
        # Let user choose from available ports
        available_ports = command.list_serial_ports()
        if available_ports:
            new_port = input(f"Choose a port {available_ports}: ")
            ser_connection = command.connect_serial(new_port)
            if ser_connection == None:
                print("Failed to connect to AMS board. Exiting...")
                exit()
            if ser_connection:
                port = new_port
    

    time.sleep(2)  # Wait for connection to establish

    # Try to connect to printer
    for attempt in range(6):
        status = printer.get_state()
        if status != 'UNKNOWN':
            break
        time.sleep(2)
        print(Fore.BLUE + f'Attempting connection, {attempt+1} | retrying...')
        if attempt == 5:
            print(Fore.RED + 'Failed to connect to printer, please check the IP address and access code.')
            exit()

    # Yay! Connected!
    print(Fore.GREEN + 'Connected to printer successfully!')
    print("Starting MQTT...")
    client = bambuapi.start_mqtt(printer)
    time.sleep(2)  # Wait for MQTT to stabilize
    # Print status
    status = printer.get_state()
    print(Fore.GREEN + f'Printer status: {status}')
    print(Style.RESET_ALL)
    if status == 'RUNNING':
        jobStatus = bambuapi.get_job_status(printer)
        print(
                    f'''Printer status: {jobStatus[0]}% | Layer {jobStatus[1]}/{jobStatus[2]} | Bed Temp: {jobStatus[3]}°C | Nozzle Temp: {jobStatus[4]}°C | Remaining Time: {jobStatus[5]} mins | Finish Time: {jobStatus[6]}
                    '''
                )
        
        # Get gcode file
        print(bambuapi.get_gcode_file(printer))

    # Blink light to indicate successful connection
    bambuapi.blink_error(printer, 5)
    bambuapi.blink_led(printer, 5)
    printer.turn_light_off()

    pause_table = checkgcode.get_pause_table()
    if pause_table:
        print(Fore.GREEN + 'Pauses detected in G-code files!')
        print(Fore.YELLOW + 'Pause Table:')
        print(Style.RESET_ALL)
        print(pause_table)
    else:
        print(Fore.RED + 'No pauses detected in G-code files :( Exiting...')
        print(Style.RESET_ALL)
    
    # One last ams board check
    if not command.test_connection():
        print(Fore.RED + 'Failed to communicate with AMS board. Please check the connection and COM port.')
        # Blink light rapidly to indicate error
        bambuapi.blink_error(printer, 10)
        print(Style.RESET_ALL)
        exit()

    # Main loop
    pause_index = 0 
    print(Fore.CYAN + 'Monitoring printer status, awaiting pauses/filament load commands...')
    print(Style.RESET_ALL)
    while True:
        # Keep track of remaining time and check AMS connection every layer change

        if status == 'RUNNING':
            new_jobStatus = bambuapi.get_job_status(printer)
            if new_jobStatus[1] != jobStatus[1]:  # Layer number changed
                jobStatus = new_jobStatus
                print(
                    f'''Printer status: Layer {jobStatus[1]}/{jobStatus[2]} | Bed Temp: {jobStatus[3]}°C | Nozzle Temp: {jobStatus[4]}°C | Remaining Time: {jobStatus[5]} mins |
                    '''
                )
                if not command.test_connection():
                    print(Fore.RED + 'Lost connection to AMS board. Attempting to reconnect...')
                    ser_connection = command.connect_serial(port)
                    if ser_connection:
                        print(Fore.GREEN + 'Reconnected to AMS board successfully!')
                    else:
                        print(Fore.RED + 'Failed to reconnect to AMS board. Please check the connection and COM port.')
                    print(Style.RESET_ALL)  
                    print(printer.get_state())
        if printer.get_state() == 'PAUSE':
            print(Back.YELLOW + 'Printer is paused. Checking for AMS command...')
            print(Style.RESET_ALL)
            if pause_index < len(pause_table):
                command_str = pause_table[pause_index]
                print(Fore.CYAN + f'Executing command: {command_str}')
                printer.set_nozzle_temperature(255) # Set nozzle to 255C to unload and load + purge filament
                if command_str == 'L1':
                    print(Fore.CYAN + 'Loading filament 1 (X axis)...')
                    # Blink light 2 times to indicate loading filament 1
                    bambuapi.blink_led(printer, 2)

                    bambuapi.unload_filament(printer)
                    time.sleep(15)  # Wait for unload to complete
                    command.load_filament(1)
                    time.sleep(15)  # Wait for AMS to process
                    bambuapi.load_filament(printer)
                    print(Fore.GREEN + 'Filament 1 loaded successfully!')
                elif command_str == 'L0':
                    print(Fore.CYAN + 'Loading filament 2 (Y axis)...')
                    # Blink light 3 times to indicate loading filament 2
                    bambuapi.blink_led(printer, 3)
                    bambuapi.unload_filament(printer)
                    time.sleep(15)  # Wait for unload to complete
                    command.load_filament(2)
                    time.sleep(15)  # Wait for AMS to process
                    bambuapi.load_filament(printer)
                    print(Fore.GREEN + 'Filament 2 loaded successfully!')
                else:
                    print(Fore.RED + f'Unknown command: {command_str}')
                    # Blink light rapidly to indicate error
                    bambuapi.blink_error(printer, 10)
                pause_index += 1
                time.sleep(2)  # Wait for AMS to process
                print(Fore.CYAN + 'Resuming print...')
                bambuapi.resume_print(printer)
                time.sleep(5)  # Give some time before next check
            else:
                print(Fore.RED + 'No more AMS commands left in the table. Please check your G-code files.')
                time.sleep(1)  # Wait before checking again