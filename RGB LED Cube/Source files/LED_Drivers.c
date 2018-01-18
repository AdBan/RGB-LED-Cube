/*
 * LED_Drivers.c
 *
 * Created: 16.01.2018 12:59:04
 *  Author: Adam
 */ 

#include "../Header files/Pinout.h"
#include "../Header files/LED_Drivers.h"


void LED_DriversInit(void)
{
	DDR_DRIVERS |= OE | LE;	//OE and LE as output
	ClearAll();				//clear all drivers from dump from programming before operating
}

void LED_DriversLatch(void)
{
	PORT_DRIVERS |= LE;
	PORT_DRIVERS &= ~LE;
}


void LED_DriversEnable(void)
{
	PORT_DRIVERS &= ~OE;
}

void LED_DriversDisable(void)
{
	PORT_DRIVERS |= OE;
}