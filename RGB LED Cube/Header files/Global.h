/*
 * Global.h
 *
 * Created: 18.01.2018 12:40:26
 *  Author: Adam
 */ 


#ifndef GLOBAL_H_
#define GLOBAL_H_

#include <avr/io.h>

typedef struct CubeData
{
	uint8_t red[64];
	uint8_t green[64];
	uint8_t blue[64];
}CubeData;

volatile CubeData cubeData;



#endif /* GLOBAL_H_ */