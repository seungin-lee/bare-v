#include <stdio.h>
#include <stdint.h>

#include "uart.h"
#include "platform.h"

int main(){
	struct uart_regs* uart_t = (struct uart_regs*)UART0_BASE;
	uart_init(uart_t);
	uart_putc(uart_t, 'H');
	uart_putc(uart_t, 'E');
	uart_putc(uart_t, 'L');
	uart_putc(uart_t, 'L');
	uart_putc(uart_t, 'O');
	uart_putc(uart_t, ' ');
	uart_putc(uart_t, 'W');
	uart_putc(uart_t, 'O');
	uart_putc(uart_t, 'R');
	uart_putc(uart_t, 'L');
	uart_putc(uart_t, 'D');
	uart_putc(uart_t, '!');
	return 0;
}
