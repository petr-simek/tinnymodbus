# ESPHome Modbus Flasher

This implementation converts the functionality of Python/C++ tools for flashing over Modbus RTU into ESPHome.

## Features

- **Mode Switching**: Boot mode (9600 baud) ↔ Main mode (38400 baud)
- **Firmware Flashing**: Upload Intel HEX file via Modbus RTU
- **Home Assistant Control**: Buttons for all operations
- **Configurable Slave ID**: Set target Modbus device

## Installation

### 1. Prepare Firmware Data

Convert your `main.hex` file to C++ array:

```bash
cd tools/esphome
python3 hex_to_cpp.py ../../main.hex
```

This will create `firmware_data.cpp` file containing the firmware as a C++ array.

### 2. File Structure

Your ESPHome config directory must contain:

```
esphome/
├── modbus-flasher.yaml       # Main configuration
├── modbus_flasher.h          # Custom component
├── firmware_data.cpp         # Generated firmware (from step 1)
└── secrets.yaml              # WiFi passwords, API keys, etc.
```

### 3. Configure secrets.yaml

Create `secrets.yaml` with your credentials:

```yaml
wifi_ssid: "YourWiFi"
wifi_password: "password"
ap_password: "fallback-password"
api_key: "your-32-char-api-encryption-key"
ota_password: "ota-password"
```

### 4. Hardware Connection

Connect ESP32 to RS485 converter:

- **TX** (GPIO17) → RS485 TX/DI
- **RX** (GPIO16) → RS485 RX/RO
- **GND** → RS485 GND

If using different pins, modify in `modbus-flasher.yaml`:

```yaml
uart:
  tx_pin: GPIO17  # change as needed
  rx_pin: GPIO16  # change as needed
```

### 5. Compile and Upload

```bash
esphome compile modbus-flasher.yaml
esphome upload modbus-flasher.yaml
```

## Usage

### In Home Assistant

After uploading to ESP32, the following entities will appear:

#### Input Number
- **Modbus Slave ID**: Set target device ID (1-255)

#### Buttons
- **Switch to Boot Mode**: Switch device to bootloader mode
- **Switch to Main Mode**: Switch device back to main mode
- **Flash Firmware**: Execute complete flash sequence

#### Text Sensor
- **Flash Status**: Display current flashing status

### Flashing Procedure

1. **Set Slave ID** of the device you want to flash (default is 1)
2. **Press "Flash Firmware"** - this automatically:
   - Switches device to boot mode (38400 → 9600 baud)
   - Uploads firmware via Modbus
   - Switches device back to main mode (9600 → 38400 baud)

### Manual Mode Switching

If you only need to switch modes:
- **Switch to Boot Mode**: To enter bootloader mode
- **Switch to Main Mode**: To return to normal operation

## Firmware Updates

When you have a new `main.hex`:

1. Generate new `firmware_data.cpp`:
   ```bash
   python3 hex_to_cpp.py ../main.hex
   ```

2. Recompile and upload ESPHome:
   ```bash
   esphome upload modbus-flasher.yaml
   ```

3. New firmware is now embedded in ESP32 and ready to deploy to Modbus devices

## Technical Details

### Modbus Protocol

The component implements Modbus RTU protocol with the following parameters:

**Boot mode (bootloader):**
- Baudrate: 9600
- Function code: 0x10 (Write Multiple Registers)
- Data: 32 bytes per packet

**Main mode (application):**
- Baudrate: 38400
- Function code: 0x06 (Write Single Register)
- Switching: write to register 0x0000

### Mode Switching

- **To Boot**: Write value `0x0001` to register `0x0000` at 38400 baud
- **To Main**: Write value `0x0000` to register `0x0000` at 9600 baud

### Flash Sequence

1. Firmware is sent in 32-byte packets
2. Each packet contains:
   - Slave ID
   - Function code (0x10)
   - Starting address
   - Number of registers (16 = 32 bytes)
   - Data (32 bytes)
   - CRC16 (Modbus RTU)
3. After each packet, wait for response
4. Base address increments by 32 after each packet

## Troubleshooting

### Device Not Responding
- Check RS485 wiring
- Verify correct Slave ID
- Check if device is powered

### Flash Failed
- Ensure device is in boot mode
- Check RS485 signal quality
- Increase delay between packets in `modbus_flasher.h` (default 50ms)

### Wrong Baudrate
- Boot mode: 9600 baud
- Main mode: 38400 baud
- ESP automatically switches, but you can modify in YAML

## Notes

- Flashing can take several seconds to minutes (depends on firmware size)
- Device is unavailable during flashing
- Firmware is stored in ESP32 flash memory, so you can flash repeatedly without access to the original HEX file
- For larger firmware (>32 kB), a larger ESP32 with more flash memory may be needed
