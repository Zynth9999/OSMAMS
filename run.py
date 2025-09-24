# Check for dependencies
# colorama, bambulabs_api, pyserial
# pip install colorama bambulabs_api pyserial
import os
# Check if they are downloaded
def Checkdeps():
        try:
            import colorama
            import bambulabs_api
            import datetime
            import sys
            import os
            import re
            import serial
            import serial.tools.list_ports
            import time
            import atexit
            import threading
            print("All dependencies are installed.")
            # Run main.py
            os.system('python main.py')
        except ImportError as e:
            missing_module = str(e).split("'")[1]
            print(f"Missing module: {missing_module}. Installing...")
            os.system(f'pip install {missing_module}')
            Checkdeps()  # Retry after installation

if __name__ == "__main__":
    Checkdeps()
            