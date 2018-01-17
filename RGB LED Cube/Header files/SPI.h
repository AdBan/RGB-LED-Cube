/*
 * SPI.h
 *
 * Created: 16.01.2018 12:04:39
 *  Author: Adam
 */ 


#ifndef SPI_H_
#define SPI_H_

#include <avr/io.h>

#define SS (1 << PB2)
#define MISO (1 << PB4)
#define MOSI (1 << PB3)
#define SCK (1 << PB5)

void SPI_Init(void);
void SPI_MasterTransmit(uint8_t cData);

#endif /* SPI_H_ */