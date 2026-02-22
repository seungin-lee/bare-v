include $(PLATFORM_DIR)/../common.mk

CFLAGS			+= -march=rv64imac_zicsr_zifencei -mabi=lp64
LDFLAGS			+= -march=rv64imac_zicsr_zifencei -mabi=lp64

USE_UART_SIFIVE		= 1