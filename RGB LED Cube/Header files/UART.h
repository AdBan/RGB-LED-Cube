/*
 * UART.h
 *
 * Created: 17.01.2018 19:46:24
 *  Author: Adam
 */ 


#ifndef UART_H_
#define UART_H_

#include <avr/io.h>
#include "../Header files/Global.h"
#include "../Header files/Pinout.h"

#define BAUDRATE250K 0x04


void UART_Init(unsigned int UBRR);
void UART_Transmit(uint8_t data);
uint8_t UART_Receive(void);


#endif /* UART_H_ */