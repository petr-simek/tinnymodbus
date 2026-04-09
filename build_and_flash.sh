#!/bin/bash

# Default configurations
PORT="/dev/ttyUSB0"
ADDR="4"
FORCE_BUILD=0

# Display usage if requested
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo "Usage: ./build_and_flash.sh [MODBUS_ID] [SERIAL_PORT] [--force]"
    echo "Example: ./build_and_flash.sh 4 /dev/ttyACM0"
    echo "  --force  Force rebuild even if sources unchanged"
    exit 0
fi

if [ "$1" != "" ] && [ "$1" != "--force" ]; then
    ADDR="$1"
fi
if [ "$2" != "" ] && [ "$2" != "--force" ]; then
    PORT="$2"
fi
for arg in "$@"; do
    [ "$arg" == "--force" ] && FORCE_BUILD=1
done

# --- Check if sources changed since last build ---
HASH_FILE="build/.srchash"
src_hash() {
    find main.c boot.c crt1.S make.sh libs/ devs/ \( -name '*.c' -o -name '*.h' -o -name '*.S' -o -name 'make.sh' \) 2>/dev/null | sort | xargs cat 2>/dev/null | grep -v 'SWVers' | shasum -a 256 | awk '{print $1}'
}
CURRENT_HASH=$(src_hash)

NEED_BUILD=1
if [ "$FORCE_BUILD" -eq 0 ] && [ -f main.hex ] && [ -f "$HASH_FILE" ]; then
    SAVED_HASH=$(cat "$HASH_FILE")
    if [ "$CURRENT_HASH" == "$SAVED_HASH" ]; then
        NEED_BUILD=0
        echo "======================================"
        echo " Sources unchanged — skipping build    "
        echo "======================================"
    fi
fi

if [ "$NEED_BUILD" -eq 1 ]; then
    echo "======================================"
    echo " Building AVR firmware (via Docker)   "
    echo "======================================"
    docker run -it --rm -v "$PWD":/opt/src avr-last /bin/bash -c "cd /opt/src && ./make.sh"
    BUILD_STATUS=$?

    if [ $BUILD_STATUS -ne 0 ]; then
        echo "Build failed! Aborting."
        exit 1
    fi

    # save hash AFTER build (make.sh increments version in main.c)
    mkdir -p build
    echo "$CURRENT_HASH" > "$HASH_FILE"
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
