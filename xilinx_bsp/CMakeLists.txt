add_library(xil_bsp STATIC boot.S
		cpu_init.S
		heap_4.c
		port_asm_vectors.S
		portZynq7000.c
		translation_table.S
		vectors.c
		xil-crt0.S
		xil_assert.c
		xil_exception.c
		xil_printf.c
		xplatform_info.c)
target_include_directories(xil_bsp PRIVATE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include)
add_subdirectory(uartps_v3_8/src)
