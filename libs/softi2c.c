/*
  softi2c.c

  Pulls in the SoftI2CMaster v2.1.9 implementation via softi2c.h config,
  and adds project-specific high-level I2C helper functions.
*/

#include "softi2c.h"

// Include SoftI2CMaster.h again — this time USE_SOFT_I2C_MASTER_H_AS_PLAIN_INCLUDE
// is NOT defined (softi2c.h already undef'd it), so we get the full implementation.
#include "SoftI2CMaster.h"

uint8_t i2c_read8(uint8_t i2caddr, uint8_t regaddr)
{
    i2c_start(i2caddr << 1);
    i2c_write(regaddr);

    i2c_rep_start((i2caddr << 1) | 0x1);
    uint8_t val = i2c_read(1);

    i2c_stop();

    return val;
}

uint16_t i2c_read16(uint8_t i2caddr, uint8_t regaddr)
{
    i2c_start(i2caddr << 1);
    i2c_write(regaddr);

    i2c_rep_start((i2caddr << 1) | 0x1);
    uint16_t val   = i2c_read(0);
    val |= (uint16_t)i2c_read(1) << 8;

    i2c_stop();

    return val;
}

void i2c_write8(uint8_t i2caddr, uint8_t regaddr, uint8_t regval)
{
    i2c_start(i2caddr << 1);

    i2c_write(regaddr);
    i2c_write(regval);

    i2c_stop();
}
