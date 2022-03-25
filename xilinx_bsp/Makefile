CURPATH := xilinx_bsp
CSRC := $(wildcard *.c)
COBJ := $(patsubst %.c,$(TOPOUT)/$(CURPATH)/%.o,$(wildcard *.c))
ASMSRC := $(wildcard *.S)
ASMOBJ := $(patsubst %.S,$(TOPOUT)/$(CURPATH)/%.o,$(wildcard *.S))
INC := -I../FreeRTOS-Kernel/include -I../FreeRTOS-Kernel/portable/GCC/ARM_CA9 -I$(TOPDIR)/xilinx_bsp/include -I$(TOPDIR)/xilinx_bsp/scutimer_v2_1/src -I$(TOPDIR)/xilinx_bsp/scugic_v4_1/src

$(TOPOUT)/$(CURPATH)/%.o: %.c
	$(CC) $(CFLAGS) $(INC) -o $@ -c $< -Wall -mcpu=cortex-a9 -mfpu=vfpv3 -Wall -fno-omit-frame-pointer -g

$(TOPOUT)/$(CURPATH)/%.o: %.S
	$(CC) $(CFLAGS) $(INC) -o $@ -c $< -Wall -mcpu=cortex-a9 -mfpu=vfpv3 -Wall -fno-omit-frame-pointer -g

xilinx_bsp: $(COBJ) $(ASMOBJ)
