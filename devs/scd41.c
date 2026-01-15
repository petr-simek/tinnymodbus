/*********************************************************************
 * Software License Agreement (BSD License)
 *
 * Copyright (c) 2018, 2023
 *
 * Stefan Reichhard <s.reichhard@netMedia.pro>
 *
 * TinnyModbus
 *
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *   * Redistributions in binary form must reproduce the above
 *     copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided
 *     with the distribution.
 *
 *   * Neither the name of the copyright holders nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 *  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 *  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 *  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGE.
 *
 *********************************************************************/

/*

  scd41.c (SCD41 CO2, temperature and humidity sensor)

*/

#include <util/delay.h>

#include "scd41.h"

#include "crc8.h"
#include "softi2c.h"


void scd41StartMeasurement(void)
{
    i2c_init();
    i2c_start(SCD41_ADDR<<1);
    i2c_write(SCD41_START_PERIODIC_MEASUREMENT >> 8);
    i2c_write(SCD41_START_PERIODIC_MEASUREMENT & 0xFF);
    i2c_stop();
}


void scd41StopMeasurement(void)
{
    i2c_init();
    i2c_start(SCD41_ADDR<<1);
    i2c_write(SCD41_STOP_PERIODIC_MEASUREMENT >> 8);
    i2c_write(SCD41_STOP_PERIODIC_MEASUREMENT & 0xFF);
    i2c_stop();
    _delay_ms(500);
}


int32_t scd41ReadValue(uint8_t TYPE)
{
    uint8_t buffer[9];
    uint32_t V;

    i2c_init();

    i2c_start(SCD41_ADDR<<1);
    i2c_write(SCD41_READ_MEASUREMENT >> 8);
    i2c_write(SCD41_READ_MEASUREMENT & 0xFF);
    
    _delay_ms(1);
    
    i2c_rep_start((SCD41_ADDR<<1)|0x1);

    int8_t idx = 0;
    for(idx = 0; idx<8; idx++) {
        buffer[idx] = i2c_read(0);
    }
    buffer[++idx] = i2c_read(1);

    i2c_stop();

    uint16_t rawCO2 = 0;
    uint16_t rawTemperature = 0;
    uint16_t rawHumidity = 0;

    switch ( TYPE )
    {
      case SCD41_CO2:
        {
          rawCO2 = ((uint16_t) buffer[0] << 8) + buffer[1];
          V = rawCO2;
        }
        break;
      case SCD41_TEMP:
        {
          rawTemperature = ((uint16_t) buffer[3] << 8) + buffer[4];
          V = (-45 + 175 * (rawTemperature / 65536.0)) * 100;
        }
        break;
      case SCD41_HUMI:
        {
          rawHumidity = ((uint16_t) buffer[6] << 8) + buffer[7];
          V = (100 * (rawHumidity / 65536.0)) * 100;
        }
        break;
    }

  return V;
}


void scd41ReadSerial( uint8_t *sn )
{
    i2c_init();

    i2c_start(SCD41_ADDR<<1);

    i2c_write(SCD41_GET_SERIAL_NUMBER >> 8);
    i2c_write(SCD41_GET_SERIAL_NUMBER & 0xFF);

    _delay_ms(1);

    i2c_rep_start((SCD41_ADDR<<1)|0x1);

    sn[0] = i2c_read(0); 
    sn[1] = i2c_read(0); 
    i2c_read(0);
    sn[2] = i2c_read(0); 
    sn[3] = i2c_read(0); 
    i2c_read(0);
    sn[4] = i2c_read(0); 
    sn[5] = i2c_read(0); 
    i2c_read(1);

    i2c_stop();
}
