CURPATH :=xilinx_bsp/scutimer_v2_1/src
CSRC := $(wildcard *.c)
COBJ := $(patsubst %.c,$(TOPOUT)/$(CURPATH)/%.o,$(wildcard *.c))
INC := -I../../include

$(TOPOUT)/$(CURPATH)/%.o: %.c
	$(CC) $(CFLAGS) $(INC) -o $@ -c $< -Wall -mcpu=cortex-a9 -mfpu=vfpv3 -Wall -fno-omit-frame-pointer -g

src: $(COBJ) $(ASMOBJ)
