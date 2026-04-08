#!/bin/bash

# Default configurations
PORT="/dev/ttyUSB0"
ADDR="4"

# Display usage if requested
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo "Usage: ./build_and_flash.sh [MODBUS_ID] [SERIAL_PORT]"
    echo "Example: ./build_and_flash.sh 4 /dev/ttyACM0"
    exit 0
fi

if [ "$1" != "" ]; then
    ADDR="$1"
fi
if [ "$2" != "" ]; then
    PORT="$2"
fi

echo "======================================"
echo " Building AVR firmware (via Docker)   "
echo "======================================"
docker run -it --rm -v "$PWD":/opt/src avr-last /bin/bash -c "cd /opt/src && ./make.sh"
BUILD_STATUS=$?

if [ $BUILD_STATUS -ne 0 ]; then
    echo "Build failed! Aborting."
    exit 1
fi

echo ""
echo "======================================"
echo " Compiling modbus-flash utility       "
echo "======================================"
cd tools || exit 1
./make.sh
UTILITY_STATUS=$?

if [ $UTILITY_STATUS -ne 0 ]; then
    echo "Utility compile failed! Aborting."
    exit 1
fi

echo ""
echo "======================================"
echo " Flashing firmware to $PORT (ID: $ADDR) "
echo "======================================"
./remote-flash.sh "$ADDR" "$PORT"

cd ..
echo "Done!"
