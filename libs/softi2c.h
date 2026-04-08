/*
  softi2c.h

  Configuration wrapper for SoftI2CMaster library (v2.1.9)
  https://github.com/felias-fogg/SoftI2CMaster

  Pin and I2C bus configuration for TinnyModbus (ATtiny85).
*/

#ifndef SOFTI2C_H
#define SOFTI2C_H

#define SDA_PIN  PB4
#define SDA_PORT PORTB
#define SCL_PIN  PB2
#define SCL_PORT PORTB

#define I2C_FASTMODE 0
#define I2C_SLOWMODE 1
#ifndef I2C_PULLUP
#define I2C_PULLUP 1
#endif
#define I2C_NOINTERRUPT 1
#define I2C_TIMEOUT 100

#define USE_SOFT_I2C_MASTER_H_AS_PLAIN_INCLUDE
#include "SoftI2CMaster.h"
#undef USE_SOFT_I2C_MASTER_H_AS_PLAIN_INCLUDE

// high level functions
uint8_t i2c_read8(uint8_t i2caddr, uint8_t regaddr);
uint16_t i2c_read16(uint8_t i2caddr, uint8_t regaddr);
void i2c_write8(uint8_t i2caddr, uint8_t regaddr, uint8_t regval);

#endif

