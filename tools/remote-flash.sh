#!/bin/sh

ADDR=1

# switch into bootloader
python3.11 ./examples/pymodbus3.x/mainmode-switch.py $ADDR

sleep .5

# flash over rs485 wires
./modbus-flash $ADDR ../main.hex

sleep .5

# switch back to main
python3.11 ./examples/pymodbus3.x/bootmode-switch.py $ADDR

