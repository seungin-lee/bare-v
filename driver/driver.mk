C_SRCS		+= $(if $(CONF_UART), $(DRIVER_DIR)/uart/uart_$(CONF_UART).c)

DRIVER_CFLAGS	+= -I$(DRIVER_DIR)/include

$(DRIVER_DIR)/uart/%.o: $(DRIVER_DIR)/uart/%.c
	$(CC) $(CFLAGS) $(DRIVER_CFLAGS) -c -o $@ $<
