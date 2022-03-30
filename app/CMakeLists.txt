#target_sources(app PRIVATE main.c port_api.c)
add_executable(foo.elf main.c port_api.c ../myfreertos.ld)
target_include_directories(foo.elf PRIVATE ../xilinx_bsp/include
		../FreeRTOS-Kernel/include
		../FreeRTOS-Kernel/portable/GCC/ARM_CA9)

target_link_libraries(foo.elf ../FreeRTOS-Kernel/freertos_kernel
		../xilinx_bsp/xil_bsp)
