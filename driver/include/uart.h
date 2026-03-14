#include <stdint.h>

int uart_init(uintptr_t base);
int uart_putc(uintptr_t base, char c);
