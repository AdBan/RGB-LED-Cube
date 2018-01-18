/*
 * SPI.c
 *
 * Created: 16.01.2018 12:02:45
 *  Author: Adam
 */ 

#include "../Header files/SPI.h"

void SPI_Init(void)
{
	DDR_SPI |= SS | MOSI | SCK;			//SS, MOSI and SCK as output
	DDR_SPI &= ~MISO;					//MISO as input
	
	SPCR |= (1 << SPE) | (1 << MSTR);	//enable SPI in master mode
	SPSR |= (SPI2X);					//double SPI speed to fosc/2
}

void SPI_MasterTransmit(uint8_t cData)
{
	SPDR = cData;
	while(!(SPSR & (1<<SPIF)));	//wait for transmission to be completed
}