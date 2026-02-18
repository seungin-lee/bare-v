C_SRCS		+= $(wildcard $(LIB_DIR)/sys/*.c)
C_SRCS		+= $(wildcard $(LIB_DIR)/utils/*.c)
OBJS		+= $(C_SRCS:.c=.o)

LIB_CFLAGS	+= -I$(CORE_DIR)/common/include
LIB_CFLAGS	+= -I$(DRIVERS_DIR)/include
LIB_CFLAGS	+= -I$(LIB_DIR)/sys
LIB_CFLAGS	+= -I$(LIB_DIR)/utils

$(LIB_DIR)/sys/%.o: $(LIB_DIR)/sys/%.c
	$(CC) $(CFLAGS) $(LIB_CFLAGS) -c -o $@ $<

$(LIB_DIR)/utils/%.o: $(LIB_DIR)/utils/%.c
	$(CC) $(CFLAGS) $(LIB_CFLAGS) -c -o $@ $<