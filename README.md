
# OSMAMS

**Open Source Marlin (based) Automatic Material System**

OSMAMS is a command-line tool and open-source alternative to the AMS Lite system for the Bambu Lab A1 and A1 Mini series. It enables automatic material handling for 3D printers using Marlin-compatible boards and simple hardware setups.

## Overview

OSMAMS allows simultaneous printing with two filaments using two extruders. It’s designed to be mostly 3D-printed and requires minimal additional components:

* A Marlin-compatible board
* Two NEMA 17 stepper motors
* Power supply (PSU) for the board
* 3x Bowden tube

This makes it a versatile and cost-effective solution for dual-filament management on supported printers.

## Features

* Compatible with Bambu Lab A1 and A1 Mini printers
* Works with any Marlin board supporting two steppers on the X and Y axes
* Automatically swaps filament based on pauses
* Provides visual feedback through printer lights
* Lightweight and mostly 3D-printable

## Installation

1. Clone the repository:

```bash
git clone https://github.com/zynth9999/OSMAMS
cd OSMAMS
```

2. Required libraries should be installed on first run.

3. Change the filament profile in Bambu Studio
* Go into Bambu Studio and create a new filament profile, name it "Second Color" or something similar so it's easy to remember
* Go into the "Advanced" tab and at the end of the Filament start G-code and Filament end G-code, add `M400 U1`
* Paint what you want and Slice your place, export your gcode file to the directory of OSMAMS, when you run it, it should auto detect the gcode file.

## Usage

Run the main CLI tool:

```bash
python main.py
```

* On first run, you will enter your printer’s IP address, access code, and serial number. This information is saved for future use.
* The tool connects to the printer and displays real-time status.

## Hardware Requirements

* Marlin-compatible controller board
* Two NEMA 17 stepper motors
* Filament extruder arms and mounting parts (mostly 3D-printed)
* Power supply

## License

OSMAMS is open-source under the MIT License.


