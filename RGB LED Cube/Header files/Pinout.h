/*
 * Pinout.h
 *
 * Created: 17.01.2018 21:11:43
 *  Author: Adam
 */ 


#ifndef PINOUT_H_
#define PINOUT_H_

#include <avr/io.h>
#include <avr/interrupt.h>

/*cube*/
#define DDR_ANODES_L DDRB	//for anodes 0-1
#define PORT_ANODES_L PORTB
#define DDR_ANODES_H DDRD	//for anodes 2-7
#define PORT_ANODES_H PORTD	

#define A0 (1 << PB0)
#define A1 (1 << PB1)
#define A2 (1 << PD2)
#define A3 (1 << PD3)
#define A4 (1 << PD4)
#define A5 (1 << PD5)
#define A6 (1 << PD6)
#define A7 (1 << PD7)

/*LED drivers*/
#define DDR_DRIVERS DDRC
#define PORT_DRIVERS PORTC

#define OE (1 << PC4)
#define LE (1 << PC5)

/*SPI*/
#define DDR_SPI DDRB
#define PORT_SPI PORTB

#define SS (1 << PB2)
#define MISO (1 << PB4)
#define MOSI (1 << PB3)
#define SCK (1 << PB5)

/*additional*/
#define DDR_ADDITIONAL DDRC
#define PORT_ADDITIONAL PORTC

#define LED1 (1 << PC2)
#define LED2 (1 << PC3)


#endif /* PINOUT_H_ */