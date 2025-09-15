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
        bambuapi.connect_printer(ip, access_code, serial)
    else:
        ip = input('Enter printer IP address: ')
        access_code = input('Enter access code: ')
        serial = input('Enter serial number: ')
    ## Save data to file
    with open('printer_info.txt', 'w') as f:
        f.write(f'{ip}\n{access_code}\n{serial}\n')

    # Create printer object    
    printer = bambuapi.connect_printer(ip, access_code, serial)

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
    for i in range (5):
        printer.turn_light_off()
        time.sleep(0.05)
        printer.turn_light_on()
        time.sleep(0.05)
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