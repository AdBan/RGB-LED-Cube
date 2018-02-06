/*
 * Multiplexing.c
 *
 * Created: 16.01.2018 15:42:27
 *  Author: Adam
 */ 

#include "../Header files/Multiplexing.h"

void AnodesInit(void)
{
	//anodes as outputs
	DDR_ANODES_H |= A2 | A3 | A4 | A5 | A6 | A7;
	DDR_ANODES_L |= A0 | A1;
	//disabled by default
	DisableAllLevels();
}

void EnableLevel(uint8_t level)
{
	if (level > 7)
		return;
	else if (level >= 2)
		PORT_ANODES_H &= ~(1 << level);
	else
		PORT_ANODES_L &= ~(1 << level);
}

void DisableLevel(uint8_t level)
{
	if (level > 7)
		return;
	else if (level >= 2)
		PORT_ANODES_H |= (1 << level);
	else
		PORT_ANODES_L |= (1 << level);
}

void DisableAllLevels(void)
{
	PORT_ANODES_H |= A2 | A3 | A4 | A5 | A6 | A7;
	PORT_ANODES_L |= A0 | A1;
}

void TransmitCubeData(CubeData cubeData)
{
	for (int i = 0; i < 8; i++)
	{
		for (int j = 0; j < 8; j++)
			SPI_MasterTransmit(cubeData.blue[8*i + j]);
		for (int j = 0; j < 8; j++)
			SPI_MasterTransmit(cubeData.green[8*i + j]);
		for (int j = 0; j < 8; j++)
			SPI_MasterTransmit(cubeData.red[8*i + j]);
		
		DisableAllLevels();
		LED_DriversDisable();
		_delay_us(2);		//this delay eliminates "ghost" effect of LED below desired LED (probably caused by switch-off timing parameters of IO pins)
		LED_DriversLatch();
		EnableLevel(i);
		LED_DriversEnable();
	}
}