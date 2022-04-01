export PATH:=$(HOME)/bin/arm-2017q1/bin:$(PATH)
export LIB := $(HOME)/bin/arm-2017q1/arm-none-eabi/lib
export LIB2 :=$(HOME)/bin/arm-2017q1/lib/gcc/arm-none-eabi/6.3.1

export CC := arm-none-eabi-gcc
export ASM := arm-none-eabi-as
export LD := arm-none-eabi-ld
export HEAP := 4

export TOPDIR := $(shell pwd)
export TOPOUT := $(TOPDIR)/out

MAKEFILES := $(shell find . -maxdepth 5 -type f -name Makefile)
SUBDIRS   := $(filter-out ./,$(dir $(MAKEFILES)))
MODULES := $(addprefix $(TOPDIR)/, $(SUBDIRS))
CSRCS := $(foreach sdir, $(MODULES), $(wildcard $(sdir)*.c))
HEAPDIR := $(TOPDIR)/./FreeRTOS-Kernel/portable/MemMang
HEAPCSRCS := $(wildcard $(HEAPDIR)/*.c)
OUTCSRCS := $(filter-out $(HEAPCSRCS), $(CSRCS))

ifeq ($(HEAP), 1)
OUTCSRCS += $(HEAPDIR)/heap_1.c
endif

ifeq ($(HEAP), 2)
OUTCSRCS += $(HEAPDIR)/heap_2.c
endif

ifeq ($(HEAP), 3)
OUTCSRCS += $(HEAPDIR)/heap_3.c
endif

ifeq ($(HEAP), 4)
OUTCSRCS += $(HEAPDIR)/heap_4.c
endif

ifeq ($(HEAP), 5)
OUTCSRCS += $(HEAPDIR)/heap_5.c
endif

OUTOBJS := $(patsubst $(TOPDIR)/%.c, $(TOPOUT)/%.o,$(OUTCSRCS))
OUTASMSRCS := $(foreach sdir, $(MODULES), $(wildcard $(sdir)*.S))
OUTOBJS += $(patsubst $(TOPDIR)/%.S, $(TOPOUT)/%.o,$(OUTASMSRCS))

.PHONY: buildapp $(SUBDIRS) clean

buildapp: $(SUBDIRS)
	$(LD) -T myfreertos.ld -o $(TOPOUT)/foo.elf $(OUTOBJS) -L$(LIB) -L$(LIB2) -lc -lgcc

$(SUBDIRS):
	mkdir -p $(TOPOUT)/$@
	$(MAKE) -C $@

clean :
	@echo clean
	rm -rf out
