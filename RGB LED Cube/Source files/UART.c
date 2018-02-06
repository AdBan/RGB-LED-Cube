/*
 * UART.c
 *
 * Created: 17.01.2018 19:46:32
 *  Author: Adam
 */ 

#include "../Header files/UART.h"

volatile uint8_t UART_iter = 0;
volatile CubeData UART_cubeData;

void UART_Init(unsigned int UBRR)
{
	UBRR0H = (uint8_t)(UBRR >> 8);
	UBRR0L = (uint8_t)UBRR;
	
	UCSR0B = (1 << RXEN0) | (1 << TXEN0) | (1 << RXCIE0);	//enable receiver and transmitter, interrupt on receive
	UCSR0C = (1 << USBS0) | (3 << UCSZ00);					//8 data bits, 2 stop bits
}

void UART_Transmit(uint8_t data)
{
	while (!(UCSR0A & (1 << UDRE0)));
	UDR0 = data;
}

uint8_t UART_Receive(void)
{
	while (!(UCSR0A & (1 << RXC0)));
	return UDR0;
}

ISR(USART_RX_vect)
{
	if (UART_iter < 64)
	{
		UART_cubeData.red[UART_iter] = UDR0;
		UART_iter++;
	}
	else if (UART_iter < 128)
	{
		UART_cubeData.green[UART_iter - 64] = UDR0;
		UART_iter++;
	}
	else if (UART_iter < 192)
	{
		UART_cubeData.blue[UART_iter - 128] = UDR0;
		UART_iter++;
	}
	
	if (UART_iter >= 192)
	{
		UART_iter = 0;
		cubeData = UART_cubeData;				//assign UART_cubeData to cubeData which will be displayed in main loop
		UART_cubeData = (const CubeData) {0};	//reset UART_cubeData
	}
}