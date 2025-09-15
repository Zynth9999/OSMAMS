import time
import bambulabs_api as bl
import datetime
from bambulabs_api import PrinterMQTTClient

def get_printer_status(printer):
    
    status = printer.get_state()
    return status

def connect_printer(ip, access_code, serial):
    printer = bl.Printer(ip, access_code, serial)
    printer.connect()
    time.sleep(2)  # Wait for connection to establish

    return printer


def disconnect_printer(printer):
    printer.disconnect()

def start_mqtt(printer):
    client = bl.Printer.mqtt_start(printer)
    while not bl.Printer.mqtt_client_connected(printer):
        time.sleep(1)
        print("Waiting for MQTT connection...")
    print("MQTT connected!")
    return client
    

def get_gcode_file(printer):
    gcode_file = printer.gcode_file()
    return gcode_file
def resume_print(printer):
    printer.resume_print()

def unload_filament(printer):
    printer.unload_filament_spool()

def load_filament(printer):
    printer.load_filament_spool()

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

