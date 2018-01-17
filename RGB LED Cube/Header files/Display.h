/*
 * Display.h
 *
 * Created: 16.01.2018 15:40:33
 *  Author: Adam
 */ 


#ifndef DISPLAY_H_
#define DISPLAY_H_

#include <avr/io.h>
#define F_CPU 8000000UL
#include <util/delay.h>
#include <string.h>
#include "../Header files/Multiplexing.h"
#include "../Header files/SPI.h"
#include "../Header files/LED_Drivers.h"

typedef struct CubeData
{
	uint8_t red[64];
	uint8_t green[64];
	uint8_t blue[64];
}CubeData;

void ClearAll(void);
void RedAll(void);
void GreenAll(void);
void BlueAll(void);
void RedEdges(void);
void GreenEdges(void);
void BlueEdges(void);
void LED(CubeData *cubeData, uint8_t x, uint8_t y, uint8_t z, uint8_t r, uint8_t g, uint8_t b);

#endif /* DISPLAY_H_ */