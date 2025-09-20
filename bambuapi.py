import time
import bambulabs_api as bl
import datetime
from bambulabs_api import PrinterMQTTClient, mqtt_client

def get_printer_status(printer):
    
    status = printer.get_state()
    return status

def connect_printer(ip, access_code, serial):
    printer = bl.Printer(ip, access_code, serial)

    bl.PrinterMQTTClient.start(printer.mqtt_client)
    printer.connect()

    return printer


def disconnect_printer(printer):
    printer.disconnect()
    bl.PrinterMQTTClient.stop(printer.mqtt_client)

def start_mqtt(printer):
    client = bl.Printer.mqtt_start(printer)
    printer.mqtt_client.connect()

    while not bl.Printer.mqtt_client_connected(printer) or not printer.mqtt_client.is_connected():
        
        time.sleep(2.5)
        print("Waiting for MQTT connection...")
        
    print("MQTT connected!")
    print(printer.mqtt_client.info_get_version())
    return client
    

wipeandshake = """; === WIPE & SHAKE / PURGE SEQUENCE ===
; Initial purge & wipe sections
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0

; Additional wipe & shake after calibration
M106 P1 S178
M400 S7
G1 X0 F18000
G1 X-13.5 F3000
G1 X0 F18000
G1 X-13.5 F3000
G1 X0 F12000
G1 X-13.5 F3000
G1 X0 F12000
M400
M106 P1 S0
; End of wipe & shake sequence"""

def blink_led(printer, num):
    for i in range(num):
        printer.turn_light_off()
        time.sleep(0.25)
        printer.turn_light_on()
        time.sleep(0.25)
    printer.turn_light_off()

def blink_error(printer, num):
    for i in range(num):
        printer.turn_light_off()
        time.sleep(0.02)
        printer.turn_light_on()
        time.sleep(0.2)
    printer.turn_light_off()

def get_gcode_file(printer):
    gcode_file = printer.gcode_file()
    return gcode_file
def resume_print(printer):
    printer.mqtt_client.resume_print()

def unload_filament(printer, old_filament_e_feedrate=300):
    """
    Retract and remove filament from the hotend/Bowden tube.
    old_filament_e_feedrate: mm/min feedrate for the long retract
    """
    nozzle_temp = printer.get_nozzle_temperature()
    if nozzle_temp < 240:
        printer.set_nozzle_temperature(255)
        while printer.get_nozzle_temperature() < 240:
            time.sleep(1)  # wait for it to heat up

    gcode = f"""G1 X180 F18000
                G92 E0                     ; reset extruder position
                G1 E-5   F250              ; quick retract to relieve pressure
                G1 E-{old_filament_e_feedrate/10:.1f} F{old_filament_e_feedrate} ; long pull to fully remove
                G1 E-2   F150              ; slow final pull
             """
    printer.mqtt_client.send_gcode(gcode)

    


def load_filament(printer, prime_length=25, prime_fast=300, prime_slow=120):
    """
    Feed filament into the hotend and purge a little.
    prime_length: total mm to push in
    prime_fast: fast feedrate (mm/min)
    prime_slow: slow finishing feedrate (mm/min)
    """
    # Heat nozzle if needed
    nozzle_temp = printer.get_nozzle_temperature()
    if nozzle_temp < 240:
        printer.set_nozzle_temperature(255)
        while printer.get_nozzle_temperature() < 240:
            time.sleep(1)  # wait for it to heat up

    gcode = f"""
                G92 E0                    ; reset extruder position
                G1 E{prime_length - 5} F{prime_fast} ; fast feed to get filament to nozzle
                G1 E5 F{prime_slow}                 ; slow feed to prime/purge
             """
    printer.mqtt_client.send_gcode(gcode)
    # wipe and shake sequence to clean nozzle
    printer.mqtt_client.send_gcode(wipeandshake)



def get_job_status(printer):
    percentage = printer.get_percentage()
    layer_num = printer.current_layer_num()
    total_layer_num = printer.total_layer_num()
    bed_temperature = printer.get_bed_temperature()
    nozzle_temperature = printer.get_nozzle_temperature()
    remaining_time = printer.get_time()
    if remaining_time is not None:
        finish_time = datetime.datetime.now() + datetime.timedelta(
            minutes=int(remaining_time))
        finish_time_format = finish_time.strftime("%Y-%m-%d %H:%M:%S")
    else:
        finish_time_format = "NA"
    return percentage, layer_num, total_layer_num, bed_temperature, nozzle_temperature, remaining_time, finish_time_format

