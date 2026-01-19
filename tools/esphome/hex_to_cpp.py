#!/usr/bin/env python3

import sys
import os

def parse_intel_hex(hex_file):
    """Parse Intel HEX file and return data array and base address."""
    data = []
    base_address = None
    current_addr = 0
    
    with open(hex_file, 'r') as f:
        for line in f:
            line = line.strip()
            if not line.startswith(':'):
                continue
            
            byte_count = int(line[1:3], 16)
            address = int(line[3:7], 16)
            record_type = int(line[7:9], 16)
            
            if address < current_addr:
                break
            
            current_addr = address
            
            if base_address is None:
                base_address = address
            
            if record_type == 0x00:
                for i in range(byte_count):
                    byte_val = int(line[9 + i*2:11 + i*2], 16)
                    data.append(byte_val)
            elif record_type > 0x01:
                print(f"Warning: Only IHEX8 fully supported, got type {record_type}")
                break
    
    return data, base_address

def generate_cpp_file(data, base_address, output_file):
    """Generate C++ file with firmware data."""
    with open(output_file, 'w') as f:
        f.write('#include "modbus_flasher.h"\n\n')
        f.write('const uint8_t firmware_hex_data[] = {\n')
        
        for i in range(0, len(data), 16):
            chunk = data[i:i+16]
            hex_values = ', '.join(f'0x{b:02x}' for b in chunk)
            f.write(f'  {hex_values}')
            if i + 16 < len(data):
                f.write(',')
            f.write('\n')
        
        f.write('};\n\n')
        f.write(f'const size_t firmware_hex_size = {len(data)};\n')
        f.write(f'const uint16_t firmware_base_address = 0x{base_address:04x};\n')
    
    print(f'Generated {output_file}')
    print(f'  Data size: {len(data)} bytes')
    print(f'  Base address: 0x{base_address:04x}')

def main():
    if len(sys.argv) != 2:
        print(f'Usage: {sys.argv[0]} <firmware.hex>')
        print(f'')
        print(f'Converts Intel HEX file to C++ array for ESPHome.')
        print(f'Output will be written to firmware_data.cpp')
        sys.exit(1)
    
    hex_file = sys.argv[1]
    
    if not os.path.exists(hex_file):
        print(f'Error: File {hex_file} not found')
        sys.exit(1)
    
    print(f'Parsing {hex_file}...')
    data, base_address = parse_intel_hex(hex_file)
    
    if not data:
        print('Error: No data found in hex file')
        sys.exit(1)
    
    output_file = 'firmware_data.cpp'
    generate_cpp_file(data, base_address, output_file)
    
    print(f'\nSuccess! Now copy {output_file} to your ESPHome config directory.')

if __name__ == '__main__':
    main()
