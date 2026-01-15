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

  scd41.h (SCD41 CO2, temperature and humidity sensor)

*/

#ifndef _SCD41_H
#define _SCD41_H


#include <avr/io.h>
#include <avr/interrupt.h>


#define SCD41_ADDR 0x62

#define SCD41_CO2  0x00
#define SCD41_TEMP 0x01
#define SCD41_HUMI 0x02

#define SCD41_DEFAULT_ADDR 0x62
#define SCD41_START_PERIODIC_MEASUREMENT 0x21B1
#define SCD41_READ_MEASUREMENT 0xEC05
#define SCD41_STOP_PERIODIC_MEASUREMENT 0x3F86
#define SCD41_SET_TEMPERATURE_OFFSET 0x241D
#define SCD41_GET_TEMPERATURE_OFFSET 0x2318
#define SCD41_SET_SENSOR_ALTITUDE 0x2427
#define SCD41_GET_SENSOR_ALTITUDE 0x2322
#define SCD41_SET_AMBIENT_PRESSURE 0xE000
#define SCD41_PERFORM_FORCED_RECALIBRATION 0x362F
#define SCD41_SET_AUTOMATIC_SELF_CALIBRATION 0x2416
#define SCD41_GET_AUTOMATIC_SELF_CALIBRATION 0x2313
#define SCD41_START_LOW_POWER_PERIODIC_MEASUREMENT 0x21AC
#define SCD41_GET_DATA_READY_STATUS 0xE4B8
#define SCD41_PERSIST_SETTINGS 0x3615
#define SCD41_GET_SERIAL_NUMBER 0x3682
#define SCD41_PERFORM_SELF_TEST 0x3639
#define SCD41_PERFORM_FACTORY_RESET 0x3632
#define SCD41_REINIT 0x3646

int32_t scd41ReadValue( uint8_t TYPE );
void scd41ReadSerial( uint8_t *sn );
void scd41StartMeasurement( void );
void scd41StopMeasurement( void );
void scd41SetAmbientPressure( uint16_t pressure );
uint16_t scd41PerformForcedCalibration( uint16_t co2_reference );



#endif
