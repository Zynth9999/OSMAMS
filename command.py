## Serial console to the 4.2.2 board running marlin
import serial

def load_filament(num):
    ## If filament num is 1 then move X axis 15mm
    ## If filament num is 2 then move Y axis 15mm
    ## Move all axes except the one being loaded back -15mm
    if num == 1:
        ser.write(b'G1 X15\n')
    elif num == 2:
        ser.write(b'G1 Y15\n')
    else:
        ser.write(b'G1 X-15 Y-15\n')

    return True

def connect_serial(port):
    global ser
    ser = serial.Serial(port, 115200, timeout=1)
    ser.flush()
    