CURPATH :=xilinx_bsp/uartps_v3_8/src
CSRC := $(wildcard *.c)
COBJ := $(patsubst %.c,$(TOPOUT)/$(CURPATH)/%.o,$(wildcard *.c))
ASMSRC := $(wildcard *.S)
ASMOBJ := $(patsubst %.S,$(TOPOUT)/$(CURPATH)/%.o,$(wildcard *.S))
INC := -I../../include

$(TOPOUT)/$(CURPATH)/%.o: %.c
	$(CC) $(CFLAGS) $(INC) -o $@ -c $< -Wall -mcpu=cortex-a9 -mfpu=vfpv3 -Wall -fno-omit-frame-pointer -g

$(TOPOUT)/$(CURPATH)/%.o: %.S
	$(CC) $(CFLAGS) $(INC) -o $@ -c $< -Wall -mcpu=cortex-a9 -mfpu=vfpv3 -Wall -fno-omit-frame-pointer -g

src: $(COBJ) $(ASMOBJ)
