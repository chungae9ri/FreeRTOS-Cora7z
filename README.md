# myfreertos
FreeRTOS porting for xilinx zynq7000.
Create sample task to drive the outstream device in the genesis bitstream.
Ported zynq7000 (cortex A9) GIC, timer intrrupt, uart and outstream device driver task.
To build, 
1. install the GNU ARM toolchain and set the path in the Makefile, then run make
2. copy the foo.elf from out folder to the Xilinx petalinux SDK (image/linux)
3. copy the binaries in the boot_pkg to the same location (image/linux)
4. run "petalinux-package --boot --fpga genesis.bit --fsbl zynq_fsbl.elf --u-boot=foo.elf --force"
5. copy the BOOT.bin to the sd card then boot the target board.
