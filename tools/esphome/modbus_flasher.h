#pragma once

#include "esphome.h"
#include <vector>

extern const uint8_t firmware_hex_data[];
extern const size_t firmware_hex_size;
extern const uint16_t firmware_base_address;

class ModbusFlasher {
 public:
  ModbusFlasher(esphome::uart::UARTComponent *uart, uint8_t slave_id) 
    : uart_(uart), slave_id_(slave_id) {}

  bool flash_firmware() {
    if (firmware_hex_size == 0) {
      ESP_LOGE("flash", "No firmware data available!");
      return false;
    }

    ESP_LOGI("flash", "Starting flash: %d bytes @ 0x%04x", firmware_hex_size, firmware_base_address);

    uint16_t base_address = firmware_base_address;
    size_t offset = 0;

    for (size_t i = 0; i < firmware_hex_size; i++) {
      msg_buffer_[offset + 6] = firmware_hex_data[i];

      if (((i != 0) && ((i + 1) % 32 == 0)) || (i + 1 == firmware_hex_size)) {
        if (!send_data_packet(base_address, offset + 1)) {
          ESP_LOGE("flash", "Failed to send packet at address 0x%04x", base_address);
          return false;
        }

        for (int k = 0; k < 32; k++) {
          msg_buffer_[k + 6] = 0xff;
        }

        offset = 0;
        base_address += 32;

        delay(50);
      } else {
        offset++;
      }
    }

    ESP_LOGI("flash", "Flash completed successfully!");
    return true;
  }

 private:
  esphome::uart::UARTComponent *uart_;
  uint8_t slave_id_;
  uint8_t msg_buffer_[40] = {
    0x01, 0x10,
    0x00, 0x00,
    0x00, 0x10,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    0xff, 0xff
  };

  uint16_t calculate_crc(const uint8_t *buf, size_t len) {
    uint16_t crc = 0xFFFF;
    for (size_t pos = 0; pos < len; pos++) {
      crc ^= (uint16_t)buf[pos];
      for (int i = 8; i != 0; i--) {
        if ((crc & 0x0001) != 0) {
          crc >>= 1;
          crc ^= 0xA001;
        } else {
          crc >>= 1;
        }
      }
    }
    return crc;
  }

  bool send_data_packet(uint16_t base_address, size_t data_len) {
    msg_buffer_[0] = slave_id_;
    msg_buffer_[2] = (base_address & 0xFF00) >> 8;
    msg_buffer_[3] = (base_address & 0x00FF);

    uint16_t crc = calculate_crc(msg_buffer_, 38);
    msg_buffer_[38] = (crc & 0x00FF);
    msg_buffer_[39] = (crc & 0xFF00) >> 8;

    ESP_LOGD("flash", "TX @ 0x%04x: %02x %02x %02x %02x %02x %02x...", 
             base_address,
             msg_buffer_[0], msg_buffer_[1], msg_buffer_[2],
             msg_buffer_[3], msg_buffer_[4], msg_buffer_[5]);

    uart_->flush();
    uart_->write_array(msg_buffer_, 40);

    delay(100);

    uint8_t response[8];
    size_t bytes_read = 0;
    uint32_t start_time = millis();

    while (bytes_read < 8 && (millis() - start_time) < 1000) {
      if (uart_->available()) {
        uart_->read_byte(&response[bytes_read]);
        bytes_read++;
      }
      delay(1);
    }

    if (bytes_read < 8) {
      ESP_LOGE("flash", "Timeout waiting for response (got %d bytes)", bytes_read);
      return false;
    }

    ESP_LOGD("flash", "RX: %02x %02x %02x %02x %02x %02x [CRC: %02x%02x]",
             response[0], response[1], response[2], response[3],
             response[4], response[5], response[6], response[7]);

    if (response[0] != slave_id_ || response[1] != 0x10) {
      ESP_LOGE("flash", "Invalid response");
      return false;
    }

    return true;
  }
};
