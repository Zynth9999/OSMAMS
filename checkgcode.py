# gcode_pause_labeled.py
import os

PAUSE_COMMAND = "M400 U1"

def check_pauses(file_path, table):
    pause_count = 0
    with open(file_path, "r") as file:
        for line in file:
            line = line.strip()
            if not line or line.startswith(";"):
                continue
            if PAUSE_COMMAND in line:
                load_label = "L1" if pause_count % 2 == 0 else "L0"
                table.append(load_label)
                pause_count += 1



def get_pause_table():
    folder = os.getcwd()
    pause_table = []

    for filename in os.listdir(folder):
        if filename.lower().endswith(".gcode"):
            check_pauses(os.path.join(folder, filename), pause_table)

    return pause_table
