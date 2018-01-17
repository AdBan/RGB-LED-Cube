/*
 * Display.c
 *
 * Created: 16.01.2018 15:38:01
 *  Author: Adam
 */ 

#include "../Header files/Display.h"


void ClearAll(void)
{
	CubeData cubeData = {0};
	TransmitCubeData(cubeData);
}

void RedAll(void)
{
	CubeData cubeData = {0};
	memset(cubeData.red, 0xFF, 64);
	TransmitCubeData(cubeData);
}

void GreenAll(void)
{
	CubeData cubeData = {0};
	memset(cubeData.green, 0xFF, 64);
	TransmitCubeData(cubeData);
}

void BlueAll(void)
{
	CubeData cubeData = {0};
	memset(cubeData.blue, 0xFF, 64);
	TransmitCubeData(cubeData);
}

void RedEdges(void)
{
	CubeData cubeData = {0};
	
	for (int i = 0; i < 64; i++)
	{
		if (i == 0 || i == 7 || i == 56 || i == 63)
			cubeData.red[i] = 0xFF;
		else if (i < 8 || i > 56 || i % 8 == 0 || (i + 1) % 8 == 0)
			cubeData.red[i] = 0x81;
	}
	
	TransmitCubeData(cubeData);
}

void GreenEdges(void)
{
	CubeData cubeData = {0};
	
	for (int i = 0; i < 64; i++)
	{
		if (i == 0 || i == 7 || i == 56 || i == 63)
			cubeData.green[i] = 0xFF;
		else if (i < 8 || i > 56 || i % 8 == 0 || (i + 1) % 8 == 0)
			cubeData.green[i] = 0x81;
	}
	
	TransmitCubeData(cubeData);
}

void BlueEdges(void)
{
	CubeData cubeData = {0};
	
	for (int i = 0; i < 64; i++)
	{
		if (i == 0 || i == 7 || i == 56 || i == 63)
			cubeData.blue[i] = 0xFF;
		else if (i < 8 || i > 56 || i % 8 == 0 || (i + 1) % 8 == 0)
			cubeData.blue[i] = 0x81;
	}
	
	TransmitCubeData(cubeData);
}

void LED(CubeData *cubeData, uint8_t x, uint8_t y, uint8_t z, uint8_t r, uint8_t g, uint8_t b)
{
	if (x > 7 || y > 7 || z > 7 || r > 15 || g > 15 || b > 15)
		return;
		
	uint16_t whichLED = 64*z + 8*y + x;
	uint8_t whichByte = whichLED/8;
	uint8_t whichBit = whichLED % 8;
	
	if (r > 0)
		cubeData->red[whichByte] |= (1 << whichBit);
	else
		cubeData->red[whichByte] &= ~(1 << whichBit);
		
	if (g > 0)
		cubeData->green[whichByte] |= (1 << whichBit);
	else
		cubeData->green[whichByte] &= (1 << whichBit);
		
	if (b > 0)
		cubeData->blue[whichByte] |= (1 << whichBit);
	else
		cubeData->blue[whichBit] &= ~(1 << whichBit);
}