#include <stdio.h>
#include <stdint.h>

#include "uart.h"
#include "platform.h"
int main(){
	uart_init(UART0_BASE);
	uart_putc(UART0_BASE, 'H');
	uart_putc(UART0_BASE, 'E');
	uart_putc(UART0_BASE, 'L');
	uart_putc(UART0_BASE, 'L');
	uart_putc(UART0_BASE, 'O');
	uart_putc(UART0_BASE, ' ');
	uart_putc(UART0_BASE, 'W');
	uart_putc(UART0_BASE, 'O');
	uart_putc(UART0_BASE, 'R');
	uart_putc(UART0_BASE, 'L');
	uart_putc(UART0_BASE, 'D');
	uart_putc(UART0_BASE, '!');
	return 0;
}
