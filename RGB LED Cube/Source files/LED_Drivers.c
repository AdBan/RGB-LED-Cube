/*
 * LED_Drivers.c
 *
 * Created: 16.01.2018 12:59:04
 *  Author: Adam
 */ 

#include "../Header files/LED_Drivers.h"


void LED_DriversInit(void)
{
	DDRC |= OE | LE;	//OE and LE as output
}

void LED_DriversLatch(void)
{
	PORTC |= LE;
}

void LED_DriversEnable(void)
{
	PORTC &= ~LE;
	PORTC &= ~OE;
}