CROSS_COMPILE	?= riscv64-unknown-elf-
CC		:= $(CROSS_COMPILE)gcc
LD		:= $(CROSS_COMPILE)ld
OBJCOPY		:= $(CROSS_COMPILE)objcopy
OBJDUMP		:= $(CROSS_COMPILE)objdump

CFLAGS		+= -mcmodel=medany -g
LDFLAGS		+=

PLATFORM	?= sifive_u
APP		?= app/hello-world
ROOT_DIR	= $(shell pwd)
PLATFORM_DIR	= $(ROOT_DIR)/platform/$(PLATFORM)
CORE_DIR	= $(ROOT_DIR)/core
DRIVER_DIR	= $(ROOT_DIR)/driver
LIB_DIR		= $(ROOT_DIR)/lib
APP_DIR		= $(ROOT_DIR)/$(APP)

include $(PLATFORM_DIR)/platform.mk
include $(DRIVER_DIR)/driver.mk
include $(LIB_DIR)/lib.mk
include $(APP_DIR)/app.mk

C_SRCS		+= $(wildcard $(APP_DIR)/*.c)
OBJS		+= $(C_SRCS:.c=.o) $(ASM_SRCS:.S=.o)

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

$(TARGET_BIN): $(TARGET_ELF)
	$(OBJCOPY) -O binary $< $@

$(TARGET_ELF): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

$(TARGET_DUMP): $(TARGET_ELF)
	$(OBJDUMP) -D $< > $@

$(TARGET_HEX): $(TARGET_ELF)
	$(OBJCOPY) -O ihex $< $@

$(TARGET_STRIP): $(TARGET_ELF)
	$(OBJCOPY) --strip-all $< $@

%.o: %.c
	$(CC) $(CFLAGS) $(APP_CFLAGS) -c -o $@ $^

sim: $(OUTPUT_DIR) $(TARGET_ALL)
	qemu-system-riscv64 -M $(PLATFORM) -bios $(TARGET_ELF) \
	--display none -serial stdio

clean:
	rm -rf $(OUTPUT_DIR) $(OBJS)
