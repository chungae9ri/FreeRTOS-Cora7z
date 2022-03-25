CURPATH :=app
CSRC := $(wildcard *.c)
COBJ := $(patsubst %.c,$(TOPOUT)/$(CURPATH)/%.o,$(wildcard *.c))
INC := -I../xilinx_bsp/include -I../FreeRTOS-Kernel/include -I../FreeRTOS-Kernel/portable/GCC/ARM_CA9

$(TOPOUT)/$(CURPATH)/%.o: %.c
	$(CC) $(CFLAGS) $(INC) -o $@ -c $< -Wall -mcpu=cortex-a9 -mfpu=vfpv3 -Wall -fno-omit-frame-pointer -g

app: $(COBJ)
