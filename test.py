"""
test_load_filament.py
Manually test AMS filament loading positions.
Usage:
    python test_load_filament.py COM3       # Windows
    python3 test_load_filament.py /dev/ttyUSB0  # Linux
"""

import sys
import time
import command  # uses the updated command.py

def main():
    if len(sys.argv) < 2:
        print("Usage: python test_load_filament.py <serial_port>")
        sys.exit(1)

    port = sys.argv[1]

    # Connect to AMS board
    ser = command.connect_serial(port)
    if not ser:
        print("Failed to connect.")
        sys.exit(1)

    # Home all axes first
    print("Homing all axes to X0 Y0 Z0 E0...")
    ser.write(b'G1 X0 Y0 Z0 E0 F900\n')
    time.sleep(3)

    # Test each filament position
    num = input("Enter filament numbers to test (e.g., 1 2 3 4): ")
    num = int(num) if num.isdigit() else 0
    if 1 == 1:
        print(f"\n=== Testing filament {num} ===")
        ok = command.load_filament(num)
        if ok:
            print(f"Moved to filament {num} position.")
        else:
            print(f"Failed to move to filament {num}.")
        time.sleep(15)  # wait so you can observe

    # Return to origin
    print("\nReturning to origin (0,0,0,0)...")
    ser.write(b'G1 X0 Y0 Z0 E0 F900\n')
    time.sleep(30)

    command.disconnect_serial()
    print("Test complete.")

if __name__ == "__main__":
    main()
