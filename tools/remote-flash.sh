#!/bin/sh

ADDR=1

# switch into bootloader
python ./examples/pymodbus3.x/mainmode-switch.py $ADDR

sleep .5
echo "sending"
# flash over rs485 wires
./modbus-flash $ADDR ../main.hex

echo "send"

sleep .5

# switch back to main
python ./examples/pymodbus3.x/bootmode-switch.py $ADDR

