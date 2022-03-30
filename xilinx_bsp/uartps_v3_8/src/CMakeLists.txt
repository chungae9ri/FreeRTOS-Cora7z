add_library(uartps STATIC outbyte.c
		xuartps.c
		xuartps.h
		xuartps_g.c
		xuartps_hw.c
		xuartps_intr.c
		xuartps_options.c
		xuartps_selftest.c
		xuartps_sinit.c)
target_include_directories(uartps PRIVATE ../../include)
