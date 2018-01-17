/*
 * RGB LED Cube.c
 *
 * Created: 16.01.2018 11:57:36
 * Author : Adam
 */ 

#include "Header files/SPI.h"
#include "Header files/LED_Drivers.h"
#include "Header files/Display.h"
#include "Header files/Multiplexing.h"

int main(void)
{
	LED_DriversInit();
	SPI_Init();
	AnodesInit();
	ClearAll(); //clear all drivers from dump from programming before operating
	
	while(1)
	{
		RedAll();
		GreenEdges();
	}
}

