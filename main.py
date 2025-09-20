# main.py
import os
import time
from colorama import Fore, Back, Style

import command
import bambuapi
import checkgcode

if __name__ == "__main__":
    # --- Load or request printer connection details ---
    if os.path.isfile("printer_info.txt"):
        with open("printer_info.txt", "r") as f:
            ip, access_code, serial, port = [line.strip() for line in f.readlines()]
    else:
        print(Fore.CYAN + "Printer details not found. Please enter the following information:" + Style.RESET_ALL)
        ip = input("  Printer IP address: ")
        access_code = input("  Access code: ")
        serial = input("  Serial number: ")
        port = input("  AMS board serial port (e.g., COM3 or /dev/ttyUSB0): ")

    with open("printer_info.txt", "w") as f:
        f.write(f"{ip}\n{access_code}\n{serial}\n{port}\n")

    # --- Connect to printer and AMS board ---
    printer = bambuapi.connect_printer(ip, access_code, serial)
    print(Fore.CYAN + "Connecting to AMS board..." + Style.RESET_ALL)
    ser_connection = command.connect_serial(port)

    if ser_connection is None:
        print(Fore.RED + "Failed to connect to AMS board. Please check the USB connection and COM port." + Style.RESET_ALL)
        available_ports = command.list_serial_ports()
        if available_ports:
            new_port = input(f"Available ports detected {available_ports}. Choose one: ")
            ser_connection = command.connect_serial(new_port)
            if ser_connection:
                port = new_port
            else:
                print(Fore.RED + "Unable to connect to AMS board. Exiting." + Style.RESET_ALL)
                exit()

    time.sleep(2)

    # --- Verify printer connection ---
    for attempt in range(6):
        status = printer.get_state()
        if status != "UNKNOWN":
            break
        time.sleep(2)
        print(Fore.BLUE + f"Attempt {attempt + 1}/6: waiting for printer response..." + Style.RESET_ALL)
        if attempt == 5:
            print(Fore.RED + "Failed to connect to printer. Please check the IP address and access code." + Style.RESET_ALL)
            exit()

    print(Fore.GREEN + "Printer connected successfully." + Style.RESET_ALL)
    print("Starting MQTT client...")
    client = bambuapi.start_mqtt(printer)
    time.sleep(2)

    status = printer.get_state()
    print(Fore.GREEN + f"Printer status: {status}" + Style.RESET_ALL)

    # --- Parse G-code for AMS commands ---
    pause_table = checkgcode.get_pause_table()
    if pause_table:
        print(Fore.GREEN + "Detected AMS commands in G-code files." + Style.RESET_ALL)
        print(Fore.YELLOW + "Command table (filament, phase):" + Style.RESET_ALL)
        print(pause_table)
    else:
        print(Fore.RED + "No AMS commands found in G-code files. Exiting." + Style.RESET_ALL)
        exit()

    if not command.test_connection():
        print(Fore.RED + "Failed to communicate with AMS board. Please check the connection." + Style.RESET_ALL)
        bambuapi.blink_error(printer, 10)
        exit()

    # --- Main monitoring loop ---
    pause_index = 0
    print(Fore.CYAN + "Monitoring printer. Waiting for filament commands..." + Style.RESET_ALL)

    while True:
        # Keepalive printer ams board
        command.test_connection()
        
        # Check printer state and control filament pushing
        printer_state = printer.get_state()
        
        if printer_state == "RUNNING":
            # Start pushing filament continuously while printer is running
            command.start_filament_push()
            
            jobStatus = bambuapi.get_job_status(printer)
            print(
                f"Progress {jobStatus[0]}% | Layer {jobStatus[1]}/{jobStatus[2]} | "
                f"Bed {jobStatus[3]}°C | Nozzle {jobStatus[4]}°C | Remaining {jobStatus[5]} mins"
            )
            time.sleep(30)
        else:
            # Stop pushing filament when printer is not running
            command.stop_filament_push()

        if printer_state == "PAUSE" and pause_index < len(pause_table):
            filament_num, phase = pause_table[pause_index]
            print(Back.YELLOW + f"Printer paused: Filament {filament_num} Phase {phase}" + Style.RESET_ALL)

            if phase == 'S':
                # Get current filament from AMS and printer
                ams_filament = command.get_current_filament()
                
                print(f"AMS loaded: {ams_filament}, Printer loaded: ")
                
                # Unload current filament from printer
                bambuapi.unload_filament(printer)
                time.sleep(45)
                
                # Load new filament from AMS to printer
                if ams_filament != filament_num:
                    command.load_filament(filament_num)
                    time.sleep(15)
                
                # Load filament into printer with specified parameters
                if bambuapi.load_filament(printer, filament_num, 
                                         prime_volume=45, 
                                         flow_ratio=0.95, 
                                         max_volumetric_speed=8):
                    print(Fore.GREEN + f"Filament {filament_num} loaded with specified parameters." + Style.RESET_ALL)
                else:
                    print(Fore.RED + f"Failed to load filament {filament_num}." + Style.RESET_ALL)

            elif phase == 'E':
                bambuapi.unload_filament(printer)
                print(Fore.GREEN + f"Filament {filament_num} unloaded." + Style.RESET_ALL)

            pause_index += 1
            time.sleep(2)
            bambuapi.resume_print(printer)
            print(Fore.CYAN + "Resuming print..." + Style.RESET_ALL)