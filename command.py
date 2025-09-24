# command.py
import serial
import serial.tools.list_ports
import time
import atexit
import threading

# Global serial connection
ser = None
# Track currently loaded filament in AMS (1-4 or None)
current_ams_filament = None
# Flag to control continuous filament pushing
keep_pushing = False
push_thread = None





def load_filament(num, delay=15):
    """
    Turn motors ON, unload filament, move axes, load the target filament,
    then turn motors OFF.
    """
    global ser, current_ams_filament
    if ser is None or not ser.is_open:
        print("Serial port not connected!")
        return False

    try:
        # --- Motors ON ---
        ser.write(b'M17\n')
        print("Motors enabled.")
        time.sleep(0.5)

        # Step 1: Unload filament (home/rest position)
        gcode = 'G1 X0 Y0 Z0 E0 F300\n'
        ser.write(gcode.encode())
        print("Unloading all filaments to home position...")
        time.sleep(8)

        # Step 2: Move to target filament position
        if num == 4:
            gcode = 'G1 X485 F300\n'
        elif num == 2:
            gcode = 'G1 Y485 F300\n'
        elif num == 3:
            gcode = 'G1 Z485 F300\n'
        elif num == 1:
            gcode = 'G1 E485 F300\n'
        else:
            print(f"Invalid filament number: {num}")
            return False

        ser.write(gcode.encode())
        time.sleep(delay)
        current_ams_filament = num
        print(f"Filament {num} loaded successfully in AMS.")

        # --- Motors OFF ---
        ser.write(b'M18\n')
        print("Motors disabled.")
        return True

    except serial.SerialException as err:
        print(f"Error sending command: {err}")
        return False

def get_current_filament():
    """Return the currently loaded filament in AMS"""
    return current_ams_filament

def list_serial_ports():
    ports = serial.tools.list_ports.comports()
    for port in ports:
        print(f"Found: {port.device} - {port.description}")
    return [p.device for p in ports]

def test_connection():
    global ser
    if ser is None or not ser.is_open:
        print("Serial port not connected!")
        return False
    try:
        ser.write(b'M105\n')  # harmless temperature query
        ser.write(b'M302 S0\n')  # allow cold extrude
        time.sleep(0.5)
        if ser.in_waiting > 0:
            _ = ser.readline().decode('utf-8', errors='ignore').strip()
            return True
        return False
    except serial.SerialException as e:
        print(f"Error during connection test: {e}")
        return False

def connect_serial(port):
    global ser, current_ams_filament
    
    if ser and ser.is_open:
        try:
            ser.close()
            time.sleep(1)
        except:
            pass
    try:

        #
        ser = serial.Serial(port, 115200, timeout=15)
        ser.flush()
        time.sleep(2)
        print(f"Connected to AMS board on port {port}")
        # Zero out positions
        ser.write(b'G92 X0 Y0 Z0 E0\n')
        time.sleep(1)
        #gcode = b'G1 X485 F1500\n'
        #ser.write(gcode)
        time.sleep(10) # Wait for filament 1 to load
        ser.write(b'M18\n')
        ser.write(b'M84\n')


        
        print("Motors disabled.")
        current_ams_filament = None  # Reset on connection
        return ser
    except serial.SerialException as e:
        print(f"Failed to connect to {port}: {e}")
        print("Available ports:")
        list_serial_ports()
        return None

def disconnect_serial():
    global ser, current_ams_filament, keep_pushing
    

    if ser and ser.is_open:
        try:
            ser.close()
            print("Serial connection closed")
        except:
            pass
    ser = None
    current_ams_filament = None

atexit.register(disconnect_serial)