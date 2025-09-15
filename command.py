import serial
import serial.tools.list_ports
import time

# Global variable for serial connection
ser = None

def load_filament(num):
    global ser
    if ser is None or not ser.is_open:
        print("Serial port not connected!")
        return False
    
    try:
        if num == 1:
            ser.write(b'G1 X65\n')
            ser.write(b'G1 Y0\n')
        elif num == 2:
            ser.write(b'G1 Y65\n')
            ser.write(b'G1 X0\n')
        else:
            ser.write(b'G1 X-65 Y-65\n')
        return True
    except serial.SerialException as e:
        print(f"Error sending command: {e}")
        return False

def list_serial_ports():
    """List available serial ports for diagnostics"""
    ports = serial.tools.list_ports.comports()
    for port in ports:
        print(f"Found: {port.device} - {port.description}")
    return [port.device for port in ports]

def test_connection():
    """Test if the serial connection is alive"""
    global ser
    if ser is None or not ser.is_open:
        print("Serial port not connected!")
        return False
    try:
        # Send a simple G-code command that won't move anything
        ser.write(b'M105\n')  # Get temperature report
        time.sleep(0.5)
        if ser.in_waiting > 0:
            response = ser.readline().decode('utf-8').strip()
            
            return True  # Any response means connection is working
        return False
    except serial.SerialException as e:
        print(f"Error during connection test: {e}")
        return False

def connect_serial(port):
    global ser
    
    # Close existing connection if any
    if ser is not None and ser.is_open:
        try:
            ser.close()
            time.sleep(1)  # Wait for port to be released
        except:
            pass
    
    try:
        ser = serial.Serial(port, 115200, timeout=5)
        ser.flush()
        time.sleep(2)  # Wait for connection to stabilize
        print(f"Connected to AMS board on port {port}")
        return ser
    except serial.SerialException as e:
        print(f"Failed to connect to {port}: {e}")
        print("Available ports:")
        list_serial_ports()
        return None

def disconnect_serial():
    """Properly close the serial connection"""
    global ser
    if ser is not None and ser.is_open:
        try:
            ser.close()
            print("Serial connection closed")
        except:
            pass
    ser = None

# Add cleanup for proper program exit
import atexit
atexit.register(disconnect_serial)