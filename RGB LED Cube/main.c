/*
 * RGB LED Cube.c
 *
 * Created: 16.01.2018 11:57:36
 * Author : Adam
 */ 


#include "Header files/Global.h"
#include "Header files/Pinout.h"
#include "Header files/SPI.h"
#include "Header files/UART.h"
#include "Header files/LED_Drivers.h"
#include "Header files/Display.h"
#include "Header files/Multiplexing.h"

void setup(void)
{
	SPI_Init();
	UART_Init(BAUDRATE250K);
	AnodesInit();
	LED_DriversInit();
	DDR_ADDITIONAL |= LED1 | LED2;
	sei();
}

int main(void)
{
	setup();
	
	while(1)
	{
		TransmitCubeData(cubeData);		//display cubeData (data is received in UART interrupts)
	}
}

