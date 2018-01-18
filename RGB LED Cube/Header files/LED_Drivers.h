/*
 * LED_Drivers.h
 *
 * Created: 16.01.2018 12:13:35
 *  Author: Adam
 */ 


#ifndef LED_DRIVERS_H_
#define LED_DRIVERS_H_

#include <avr/io.h>
#include "../Header files/Pinout.h"
#include "../Header files/Display.h"

void LED_DriversInit(void);
void LED_DriversLatch(void);
void LED_DriversEnable(void);
void LED_DriversDisable(void);

#endif /* LED_DRIVERS_H_ */