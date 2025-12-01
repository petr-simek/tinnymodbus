#!/usr/bin/python
"""#!/home/stif/.platformio/penv/bin/python"""



"""
  sensors-read.py (Query all sensors values)
"""

import sys
import logging

from pymodbus.client.mixin import ModbusClientMixin
from pymodbus.client import ModbusSerialClient as ModbusClient



logging.basicConfig()
log = logging.getLogger()
log.setLevel(logging.INFO)

client = ModbusClient(port='/dev/ttyUSB0', baudrate=38400, timeout=1.5)
# client = ModbusClient( port='/dev/ttyUSB0', baudrate=19200, timeout=1.5)
#client = ModbusClient(method='rtu', port='/dev/ttyUSB0', baudrate=9600, timeout=1.5)
client.connect()

idslave = 1

if len(sys.argv) == 2:
  try:
    idslave = int(sys.argv[1])
  except:
    print ("usage: %s [idslave]" % sys.argv[0])
    sys.exit(-1)

print ("0x03 0x0000\n")
result  = client.read_holding_registers(address=0x0000, count=0x01, device_id=idslave)
decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT16, registers=result.registers)
print (decoder, " running mode\n")
print ("")

print ("0x03 0x0001\n")
result  = client.read_holding_registers(address=0x0002, count=0x01, device_id=idslave)
decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT16, registers=result.registers)
print (decoder, " address\n")

print ("0x03 0x0001\n")
result  = client.read_holding_registers(address=0x0001, count=0x02, device_id=idslave)
decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT32, registers=result.registers)
print (''.join(chr((decoder>>8*(4-byte-1))&0xFF) for byte in range(4)) , " software version \n")

print ("")
# print ("")

# print ("0x03 0x0003\n")
# result  = client.read_holding_registers(address=0x0003, count=0x02, device_id=idslave)
# decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT32, registers=result.registers)
# print ("%.2f V (internal)\n" % decoder)
#
# print ("")
#
# print ("0x03 0x0004\n")
# result  = client.read_holding_registers(address=0x0004, count=0x02, device_id=idslave)
# decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT32, registers=result.registers)
# print ("%.2f C (internal)\n" % decoder)
# print ("")
#
# # print ("0x03 0x0012\n")
# # result  = client.read_holding_registers(address=0x0012, count=0x02, slave=idslave)
# # decoder = BinaryPayloadDecoder.fromRegisters(result.registers, byteorder=Endian.BIG, wordorder=Endian.BIG)
# # print ("%.2f °C (offset)\n" % decoder.decode_32bit_float())
#
# # print ("")
#
# # print ("0x03 0x0022\n")
# # result  = client.read_holding_registers(address=0x0022, count=0x02, slave=idslave)
# # decoder = BinaryPayloadDecoder.fromRegisters(result.registers, byteorder=Endian.BIG, wordorder=Endian.BIG)
# # print ("%.2f %%RH (offset)\n" % decoder.decode_32bit_float())
#
#
# print ("")
#
# print ("0x03 0x0002\n")
# result  = client.read_holding_registers(address=0x0002, count=0x01, device_id=idslave)
# decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT16, registers=result.registers)
# print (decoder, " slave address\n")

print ("")
# try:
#
#   print ("0x04 0x0000\n")
#   result  = client.read_input_registers(address=0x0000, count=0x01, device_id=idslave)
#   decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT16, registers=result.registers)
#   print (decoder, " maximum devices \n")
#
#   print ("")
#
#   print ("0x04 0x0001\n")
#   result  = client.read_input_registers(address=0x0001, count=0x01, device_id=idslave)
#   value = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT16, registers=result.registers)
#   print (value, " devices found\n")
#
#   # iterate sensors
#   for idx in range(0, value):
#
#     print ("  id: %i 0x04 0x%04x" % (idx, 0x0100+idx))
#     result  = client.read_input_registers(address=0x0100+idx, count=0x04, device_id=idslave)
#     decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.UINT64, registers=result.registers)
#     print ("  %08x" % decoder)
#
#     print ("  id: %i 0x04 0x%04x" % (idx, 0x0200+idx))
#     result  = client.read_input_registers(address=0x0200+idx, count=0x02, device_id=idslave)
#     decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.FLOAT32, registers=result.registers)
#     print (" ", decoder, " Celsius\n")
#
#   print ("")
# except:
#
#   print ("No 1-wire found.")


#
# try:
#
#   print ("")
#
#   print ("0x04 0x1220\n")
#   result  = client.read_input_registers(address=0x1220, count=0x02, device_id=idslave)
#   decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.FLOAT32, registers=result.registers)
#   print (" " ,decoder, " VI lux (bh1750)" )
#
# except:
#
#   print ("No BH1750 found.")

try:
  print ("")


  print ("0x04 0x1240\n")
  result  = client.read_input_registers(address=0x1240, count=0x02, device_id=idslave)
  # Debug: print raw registers
  print (f"  Raw registers: 0x{result.registers[0]:04X} 0x{result.registers[1]:04X}")
  # Decode as big-endian (word order: big-endian, byte order: big-endian)
  decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT32, registers=result.registers)
  print (f"  Raw value: {decoder}")
  print (" %.2f °C (bme280)" % (decoder/100.0))

  print ("")

  print ("0x04 0x1241\n")
  result  = client.read_input_registers(address=0x1241, count=0x02, device_id=idslave)
  # Debug: print raw registers
  print (f"  Raw registers: 0x{result.registers[0]:04X} 0x{result.registers[1]:04X}")
  decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT32, registers=result.registers)
  print (f"  Raw value: {decoder}")
  print (" %.2f hPa (bme280)" % (decoder/100.0))

  print ("")

  print ("0x04 0x1242\n")
  result  = client.read_input_registers(address=0x1242, count=0x02, device_id=idslave)
  # Debug: print raw registers
  print (f"  Raw registers: 0x{result.registers[0]:04X} 0x{result.registers[1]:04X}")
  decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT32, registers=result.registers)
  print (f"  Raw value: {decoder}")
  print (" %.2f %%RH (bme280)" % (decoder/100.0))

  print ("")

except:

  print ("No BME280 found.")


# try:
#   print ("")
#
#   print ("0x04 0x1230\n")
#   result  = client.read_input_registers(address=0x1230, count=0x02, device_id=idslave)
#   decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT32, registers=result.registers)
#   #val = float(decoder.decode_32bit_int())
#   #print (" %.2f °C (bme280)" % (val/100))
#   print (" %.2f °C (bmp280)" % decoder)
#
#   print ("")
#
#   print ("0x04 0x1231\n")
#   result  = client.read_input_registers(address=0x1231, count=0x02, device_id=idslave)
#   decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT32, registers=result.registers)
#   #val = float(decoder.decode_32bit_int())
#   #print (" %.2f hPa (bme280)" % (val/100))
#   print (" %.2f hPa (bmp280)" % decoder)
#
#
#   print ("")
#
# except:
#
#   print ("No BMP280 found.")
client.close()