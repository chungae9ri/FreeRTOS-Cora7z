CURPATH :=FreeRTOS-Kernel/portable/GCC/ARM_CA9
CSRC := $(wildcard *.c)
COBJ := $(patsubst %.c,$(TOPOUT)/$(CURPATH)/%.o,$(wildcard *.c))
ASMSRC := $(wildcard *.S)
ASMOBJ := $(patsubst %.S,$(TOPOUT)/$(CURPATH)/%.o,$(wildcard *.S))
INC := -I./ -I../../../include -I$(TOPDIR)/xilinx_bsp/include

$(TOPOUT)/$(CURPATH)/%.o: %.c
	$(CC) $(CFLAGS) $(INC) -o $@ -c $< -Wall -g -mcpu=cortex-a9 -mfpu=vfpv3 -Wall -fno-omit-frame-pointer

$(TOPOUT)/$(CURPATH)/%.o: %.S
	$(CC) $(INC) -o $@ -c $< -Wall -g -mcpu=cortex-a9 -mfpu=vfpv3 -Wall -fno-omit-frame-pointer

ARM_CA9: $(COBJ) $(ASMOBJ)
