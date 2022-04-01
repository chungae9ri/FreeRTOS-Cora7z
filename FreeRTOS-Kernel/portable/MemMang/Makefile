CURPATH :=FreeRTOS-Kernel/portable/MemMang
INC := -I../../include -I../GCC/ARM_CA9 -I../../../xilinx_bsp/include

ifeq ($(HEAP), 1)
CSRC := heap_1.c
endif

ifeq ($(HEAP), 2)
CSRC := heap_2.c
endif

ifeq ($(HEAP), 3)
CSRC := heap_3.c
endif

ifeq ($(HEAP), 4)
CSRC := heap_4.c
endif

ifeq ($(HEAP), 5)
CSRC := heap_5.c
endif

COBJ := $(patsubst %.c,$(TOPOUT)/$(CURPATH)/%.o,$(CSRC))

$(TOPOUT)/$(CURPATH)/%.o: %.c
	$(CC) $(CFLAGS) $(INC) -o $@ -c $< -Wall -g -mcpu=cortex-a9 -mfpu=vfpv3 -Wall -fno-omit-frame-pointer

MEMMANG: $(COBJ) 
