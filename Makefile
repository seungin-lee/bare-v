CROSS_COMPILE	?= riscv64-unknown-elf-
CC		:= $(CROSS_COMPILE)gcc
LD		:= $(CROSS_COMPILE)ld
OBJCOPY		:= $(CROSS_COMPILE)objcopy
OBJDUMP		:= $(CROSS_COMPILE)objdump

CFLAGS		+= -mcmodel=medany
LDFLAGS		+=

PLATFORM	?= sifive_u
APP		?= app/hello-world
C_SRCS		+= $(wildcard $(APP)/*.c)
OBJS		+= $(C_SRCS:.c=.o)

TARGET		= $(notdir $(APP))
OUTPUT_DIR	= output/$(PLATFORM)/$(TARGET)
TARGET_BIN	= $(OUTPUT_DIR)/$(TARGET).bin
TARGET_ELF	= $(OUTPUT_DIR)/$(TARGET).elf
TARGET_DUMP	= $(OUTPUT_DIR)/$(TARGET).dump
TARGET_HEX	= $(OUTPUT_DIR)/$(TARGET).hex
TARGET_STRIP	= $(OUTPUT_DIR)/$(TARGET).stripped.elf
TARGET_ALL	= $(TARGET_BIN) $(TARGET_ELF) $(TARGET_DUMP) $(TARGET_HEX) \
		  $(TARGET_STRIP)

.SECONDARY:
all: $(OUTPUT_DIR) $(TARGET_ALL)

$(OUTPUT_DIR):
	mkdir -p $@

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

%.elf: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^

%.dump: %.elf
	$(OBJDUMP) -D $< > $@

%.hex: %.elf
	$(OBJCOPY) -O ihex $< $@

%.stripped.elf: %.elf
	$(OBJCOPY) --strip-all $< $@

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

clean:
	rm -rf $(OUTPUT_DIR) $(OBJS)