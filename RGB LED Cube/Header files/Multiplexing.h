/*
 * Multiplexing.h
 *
 * Created: 16.01.2018 15:42:42
 *  Author: Adam
 */ 


#ifndef MULTIPLEXING_H_
#define MULTIPLEXING_H_

#include <avr/io.h>
#include "../Header files/Global.h"
#include "../Header files/Pinout.h"
#include "../Header files/Display.h"
#include "../Header files/SPI.h"

void AnodesInit(void);
void TransmitCubeData();

#endif /* MULTIPLEXING_H_ */