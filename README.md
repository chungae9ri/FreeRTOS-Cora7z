# myfreertos
FreeRTOS porting for xilinx zynq7000 in cora7z eval board.
To build, 
1. install the GNU ARM toolchain and set the path in the Makefile, then run make
2. copy the foo.elf from out folder to the Xilinx petalinux SDK (images/linux)
3. copy the binaries in the corabins folder to the same location (images/linux)
4. run "petalinux-package --boot --fpga cora_7z_10_wrapper.bit --fsbl zynq_fsbl_cora.elf --u-boot=foo.elf --force"
5. copy the BOOT.bin to the sd card then boot the target board.
