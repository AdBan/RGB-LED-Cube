/*
 * Multiplexing.h
 *
 * Created: 16.01.2018 15:42:42
 *  Author: Adam
 */ 


#ifndef MULTIPLEXING_H_
#define MULTIPLEXING_H_

#include <avr/io.h>
#include "../Header files/Display.h"
#include "../Header files/SPI.h"

#define DDR_ANODES DDRD
#define PORT_ANODES PORTD
#define A0 (1 << PD0)
#define A1 (1 << PD1)
#define A2 (1 << PD2)
#define A3 (1 << PD3)
#define A4 (1 << PD4)
#define A5 (1 << PD5)
#define A6 (1 << PD6)
#define A7 (1 << PD7)
#define LEVELS_AMOUNT 8

void AnodesInit(void);
void TransmitCubeData();

#endif /* MULTIPLEXING_H_ */