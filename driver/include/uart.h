/*
 * Copyright (c) 2026, seungin.lee8@gmail.com
 * Licensed under the BSD 3-Clause License.
 */

#ifndef __UART_H
#define __UART_H

#include <stdint.h>

struct uart_regs;
extern struct uart_regs *DEBUG_UART;

void set_debug_uart(struct uart_regs *uart_t);
int uart_init(struct uart_regs *uart_t);
int uart_putc(struct uart_regs *uart_t, char c);

#endif
