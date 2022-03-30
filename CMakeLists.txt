cmake_minimum_required(VERSION 3.10)
	
set(CMAKE_TOOLCHAIN_FILE ./arm-none-eabi.cmake)
set(FREERTOS_CONFIG_FILE_DIRECTORY ./xilinx_bsp/include CACHE STRING "")
set(FREERTOS_PORT GCC_ARM_CA9 CACHE STRING "")
include_directories(./xiliinx_bsp/include ./FreeRTOS-Kernel/include)

# set the project name and version
project(FreeRTOS-Cora7z VERSION 0.1)

add_subdirectory(FreeRTOS-Kernel)
add_subdirectory(xilinx_bsp)
add_subdirectory(app)
