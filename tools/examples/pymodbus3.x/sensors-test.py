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

# client = ModbusClient(port='/dev/ttyACM0', baudrate=38400, timeout= 0.2)
client = ModbusClient(port='/dev/ttyUSB0', baudrate=38400, timeout= 0.2)
# client = ModbusClient( port='/dev/ttyACM0', baudrate=19200, timeout=1.5)
# client = ModbusClient(method='rtu', port='/dev/ttyUSB0', baudrate=9600, timeout=1.5)
client.connect()

idslave = 1

if len(sys.argv) == 2:
  try:
    idslave = int(sys.argv[1])
  except:
    print ("usage: %s [idslave]" % sys.argv[0])
    sys.exit(-1)


for i in range(1,7):
    try:
        print ("0x03 0x0001\n")
        result  = client.read_holding_registers(address=0x0002, count=0x01, device_id=i)
        decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT16, registers=result.registers)
        print (decoder, " address\n")

        print ("0x03 0x0001\n")
        result  = client.read_holding_registers(address=0x0001, count=0x02, device_id=i)
        decoder = client.convert_from_registers(data_type=ModbusClientMixin.DATATYPE.INT32, registers=result.registers)
        print (''.join(chr((decoder>>8*(4-byte-1))&0xFF) for byte in range(4)) , " software version \n")
    except:
        print("address: %s error" % i)


client.close()