#!/bin/bash

# http://eleccelerator.com/fusecalc/fusecalc.php?chip=attiny85
#
# Low Fuse 0xE2: Int. RC Osc. 8MHz; Start-up time PWRDWN/RESET: 6CK/14CK+64ms;[CKSEL=0010 SUT=10]; default value
# High Fuse 0xDD: Brown-out detection level at VCC=2,7V;[BODLEVEL=101]; Serial program downloading (SPI) enable
# Extended Fuse 0xFE: Self Programming enable

FUSE_FLAGS='-U lfuse:w:0xE2:m -U hfuse:w:0xDD:m -U efuse:w:0xFE:m'

#arduino uploader
#avrdude -c usbasp -P usb -p attiny85 $FUSE_FLAGS -U flash:w:boot.hex -e -D -v -U eeprom:w:boot.eep -B3
#with help of arduino
avrdude -V -pattiny85 -cstk500v1 -P/dev/ttyACM0 -b19200 -U flash:w:main.hex -U eeprom:w:boot.eep $FUSE_FLAGS

#"/home/petrsimek/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17/bin/avrdude" "-C/home/petrsimek/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17/etc/avrdude.conf" -v -V -pattiny85 -cstk500v1 -P/dev/ttyACM0 -b19200 "-Uflash:w:/tmp/arduino/sketches/09C16EF7E8B837B8BE1DDDADBC3CE920/Blink_attiny.ino.hex:i"

