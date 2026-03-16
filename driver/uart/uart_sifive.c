/*
 * Copyright (c) 2026, seungin.lee8@gmail.com
 * Licensed under the BSD 3-Clause License.
 */

#include <stdint.h>
#include <stddef.h>
#include "uart.h"

struct uart_regs {
	volatile uint32_t tx_data;
	volatile uint32_t rx_data;
	volatile uint32_t tx_ctrl;
	volatile uint32_t rx_ctrl;
	volatile uint32_t ie;
	volatile uint32_t ip;
	volatile uint32_t div;
};

struct uart_regs *DEBUG_UART = NULL;

void set_debug_uart(struct uart_regs *uart_t)
{
	DEBUG_UART = uart_t;
}

int uart_init(struct uart_regs *uart_t)
{
	/* Set baud rate to 115200 bps */
	uart_t->div = 0x1a;

	/* Enable TX and RX */
	uart_t->tx_ctrl = 0x1;
	uart_t->rx_ctrl = 0x1;

	if (DEBUG_UART == NULL) set_debug_uart(uart_t);

	return 0;
}

int uart_putc(struct uart_regs *uart_t, char c)
{
	/* Wait until the TX FIFO is not full */
	while (uart_t->tx_data & 0x80000000);

	/* Write the character to the TXDATA register */
	uart_t->tx_data = c;

	return 0;
}
