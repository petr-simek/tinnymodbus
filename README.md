# TINNYMODBUS (ModBus tiny multi-sensor module)

TinnyModBus is a very small 11x26mm reconfigurable atmel attiny85 mcu based micro-module that speaks modbus over rs485 two wires. It collects measurements locally from large variety of implemented sensors. It can be reprogrammed right on its own rs485 via it's own bootloader.

> **Note**: This project is based on the original [tinnymodbus](https://github.com/cbalint13/tinnymodbus) by cbalint13, with additional sensors support and ESPHome integration.

![Logo](https://github.com/cbalint13/tinnymodbus/raw/master/docs/tinnymodbus-pcb.png)

> Main specs

  - Size is only **11x26 mm** including **screw sockets**
  - Can speak **modbus** with several sensors attached, uses a max487 to communicate
  - Have it's own **500mA** budget, **ESD** protected **rs485** lines, and **reverse-polarity** protection
  - Can read attached sensor data over **1wire**, **i2c**, **spi**, but also could do **gpio** or **adc**
  - Has its own **bootloader** that speaks modbus and can be reprogrammed right on rs485 wires
  - Internal IC metrics like Vcc voltage and SOIC8 temperature are available
  - It is designed to cost less than **2 USD**

> Wiring of TinnyModBus module

Use 4 wires (ideal twisted):

  - 2x @ 12/24V remote power
  - 2x @ A,B rs485

Connects sensors:

  - i2c (any from **/devs** drivers)
  - 1wire (up to 32 18DS20 temperature sensors)
  - or can do **gpio** or **adc**
  - multiple **i2c & 1w** sensors can be **simultaneously** wired

> Supported Sensors

  **1-Wire Sensors:**
  - DS18B20 - Temperature sensor (up to 32 devices)

  **I2C Sensors:**
  - BH1750 - Light intensity sensor (Lux)
  - SHT31 - Temperature and humidity sensor
  - BMP280 - Temperature and pressure sensor
  - BME280 - Temperature, pressure and humidity sensor
  - SCD41 - CO2, temperature and humidity sensor


  ```
  >~~~~~~~~~~~~>---  GND   --->|-|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|SCK|>-----  SCK  ----> i2c/SCK sensor(s)
  >~~~ <1.2km ~>--- 12/24V --->|+|   TINNY MODULE   |DAT|>-----  DAT  ----> 1wire/DAT or i2c/SDA sensor(s)
  >~~~~~~~~~~~~>---   A    --->|A|                  |+5V|>-----  +5V  ----> 500mA max for sensors(s)
  >~~~~~~~~~~~~>---   B    --->|B|__________________|GND|>-----  GND  ----> ground
  ```

ModBus detailed register description are in [MODBUS.md](MODBUS.md).

Schematic, Printed Circuit Board, 3D layout are available on [CircuitMaker](https://workspace.circuitmaker.com/Projects/Details/Cristian-Balint/TinnyModbus), but can be also checked in **docs** folder.

Docs & usage scenario examples are in ```tools/examples/``` folder.

> ESPHome Integration

**Note:** ESPHome integration is currently work in progress.

ESPHome configuration for controlling and flashing TinnyModBus devices is available in ```tools/esphome/``` folder.

Features:
- Normal Modbus RTU communication at 38400 baud for sensor data reading
- Remote firmware flashing over RS485 with automatic mode switching
- Button controls in Home Assistant for easy operation
- Supports all implemented sensors (BH1750, SHT31, BMP280, BME280, SCD41, DS18B20)

See [tools/esphome/README.md](tools/esphome/README.md) for complete installation and usage instructions.

> BUILD

See [tools/docker](tools/docker) folder for easy build receipt.


![SCH](https://github.com/cbalint13/tinnymodbus/raw/master/docs/tinnymodbus-sch.png)
![PHOTO](https://github.com/cbalint13/tinnymodbus/raw/master/docs/tinnymodbus-photo.png)
