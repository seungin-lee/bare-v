#include <stdint.h>

#define UART_TXDATA		0x00
#define UART_RXDATA		0x04
#define UART_TXCTRL		0x08
#define UART_RXCTRL		0x0c
#define UART_IE			0x10
#define UART_IP			0x14
#define UART_DIV		0x18

int uart_init(uintptr_t base)
{
	/* Set baud rate to 115200 bps */
	*(volatile uint32_t *)(base + UART_DIV) = 0x1a;

	/* Enable TX and RX */
	*(volatile uint32_t *)(base + UART_TXCTRL) = 0x1;
	*(volatile uint32_t *)(base + UART_RXCTRL) = 0x1;

	return 0;
}

int uart_putc(uintptr_t base, char c)
{
	/* Wait until the TX FIFO is not full */
	while (*(volatile uint32_t *)(base + UART_TXDATA) & 0x80000000);

	/* Write the character to the TXDATA register */
	*(volatile uint32_t *)(base + UART_TXDATA) = c;

	return 0;
}