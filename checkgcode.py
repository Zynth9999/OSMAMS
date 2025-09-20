import os
import re

# Detect lines like:  M400 U1 ; C3S   or   M400 U1 ; C2E
PAUSE_PATTERN = re.compile(r'^M400\s+U1.*;\s*C(\d)([SE])', re.IGNORECASE)

def check_pauses(file_path, table):
    with open(file_path, "r") as file:
        for raw in file:
            line = raw.strip()
            if not line or line.startswith(";"):
                continue
            m = PAUSE_PATTERN.search(line)
            if m:
                num = int(m.group(1))       # filament 1–4
                phase = m.group(2).upper()  # S or E
                table.append((num, phase))

def get_pause_table():
    folder = os.getcwd()
    pause_table = []
    for filename in os.listdir(folder):
        if filename.lower().endswith(".gcode"):
            check_pauses(os.path.join(folder, filename), pause_table)
    return pause_table
