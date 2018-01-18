/*
 * SPI.h
 *
 * Created: 16.01.2018 12:04:39
 *  Author: Adam
 */ 


#ifndef SPI_H_
#define SPI_H_

#include <avr/io.h>
#include "../Header files/Pinout.h"
#include "../Header files/LED_Drivers.h"

void SPI_Init(void);
void SPI_MasterTransmit(uint8_t cData);

#endif /* SPI_H_ */