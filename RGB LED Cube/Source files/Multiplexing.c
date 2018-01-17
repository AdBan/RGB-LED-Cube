/*
 * Multiplexing.c
 *
 * Created: 16.01.2018 15:42:27
 *  Author: Adam
 */ 

#include "../Header files/Multiplexing.h"

void AnodesInit(void)
{
	DDR_ANODES = 0xFF;	//all anodes as output
	PORT_ANODES = 0xFF; //disable all anodes
}


void TransmitCubeData(CubeData cubeData)
{
	for (int i = 0; i < LEVELS_AMOUNT; i++)
	{
		for (int j = 0; j < 8; j++)
			SPI_MasterTransmit(cubeData.blue[8*i + j]);
		for (int j = 0; j < 8; j++)
			SPI_MasterTransmit(cubeData.green[8*i + j]);
		for (int j = 0; j < 8; j++)
			SPI_MasterTransmit(cubeData.red[8*i + j]);
		
		PORT_ANODES = 0xFF;
		PORT_ANODES &= ~(1 << i);
		LED_DriversLatch();
		LED_DriversEnable();
	}
}