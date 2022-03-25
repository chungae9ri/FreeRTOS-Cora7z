CSRC := $(wildcard *.c)
COBJ := $(patsubst %.c,$(TOPOUT)/FreeRTOS-Kernel/%.o,$(wildcard *.c))
ASMSRC := $(wildcard *.S)
ASMOBJ := $(patsubst %.S,$(TOPOUT)/FreeRTOS-Kernel/%.o,$(wildcard *.S))
INC := -I./include -I./portable/GCC/ARM_CA9 -I$(TOPDIR)/xilinx_bsp/include

$(TOPOUT)/FreeRTOS-Kernel/%.o: %.c
	$(CC) $(CFLAGS) $(INC) -o $@ -c $< -Wall -mcpu=cortex-a9 -mfpu=vfpv3 -Wall -fno-omit-frame-pointer -g

$(TOPOUT)/FreeRTOS-Kernel/%.o: %.S
	$(CC) $(INC) -o $@ -c $< -Wall -mcpu=cortex-a9 -mfpu=vfpv3 -Wall -fno-omit-frame-pointer -g

FreeRTOS-Kernel: $(COBJ) $(ASMOBJ)
