/*
 * LED_Drivers.h
 *
 * Created: 16.01.2018 12:13:35
 *  Author: Adam
 */ 


#ifndef LED_DRIVERS_H_
#define LED_DRIVERS_H_

#include <avr/io.h>

#define OE (1 << PC4)		//output enable pin
#define LE (1 << PC5)		//latch enable pin
#define DRIVERS_AMOUNT 24	//amount of drivers in cascade

void LED_DriversInit(void);
void LED_DriversLatch(void);
void LED_DriversEnable(void);

#endif /* LED_DRIVERS_H_ */