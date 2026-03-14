C_SRCS		+= $(wildcard $(LIB_DIR)/sys/*.c)
C_SRCS		+= $(wildcard $(LIB_DIR)/utils/*.c)

LIB_CFLAGS	+= -I$(CORE_DIR)/common/include
LIB_CFLAGS	+= -I$(DRIVER_DIR)/include
LIB_CFLAGS	+= -I$(LIB_DIR)/sys
LIB_CFLAGS	+= -I$(LIB_DIR)/utils

$(LIB_DIR)/sys/%.o: $(LIB_DIR)/sys/%.c
	$(CC) $(CFLAGS) $(LIB_CFLAGS) -c -o $@ $<

$(LIB_DIR)/utils/%.o: $(LIB_DIR)/utils/%.c
	$(CC) $(CFLAGS) $(DRIVER_CFLAGS) $(LIB_CFLAGS) -c -o $@ $<
