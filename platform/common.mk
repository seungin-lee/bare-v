C_SRCS		+= $(wildcard $(PLATFORM_DIR)/*.c)
ASM_SRCS	+= $(wildcard $(PLATFORM_DIR)/*.S)
OBJS		+= $(C_SRCS:.c=.o) $(ASM_SRCS:.S=.o)

PLATFORM_CFLAGS	+= -I$(CORE_DIR)/common/include
PLATFORM_CFLAGS	+= -I$(DRIVERS_DIR)/include
PLATFORM_CFLAGS	+= -I$(LIB_DIR)/sys

LD_SCRIPT	?= $(PLATFORM_DIR)/link.ld
LDFLAGS		+= -T$(LD_SCRIPT)

$(PLATFORM_DIR)/%.o: $(PLATFORM_DIR)/%.c
	$(CC) $(CFLAGS) $(PLATFORM_CFLAGS) -c -o $@ $<

$(PLATFORM_DIR)/%.o: $(PLATFORM_DIR)/%.S
	$(CC) $(CFLAGS) $(PLATFORM_CFLAGS) -D__ASSEMBLY__ -c -o $@ $<