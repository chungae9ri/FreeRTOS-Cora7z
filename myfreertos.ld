OUTPUT_ARCH(arm)
ENTRY(_vector_table) 

_STACK_SIZE = DEFINED(_STACK_SIZE) ? _STACK_SIZE : 0x2000;
_HEAP_SIZE = DEFINED(_HEAP_SIZE) ? _HEAP_SIZE : 0x2000;

_ABORT_STACK_SIZE = DEFINED(_ABORT_STACK_SIZE) ? _ABORT_STACK_SIZE : 1024;
_SUPERVISOR_STACK_SIZE = DEFINED(_SUPERVISOR_STACK_SIZE) ? _SUPERVISOR_STACK_SIZE : 2048;
_IRQ_STACK_SIZE = DEFINED(_IRQ_STACK_SIZE) ? _IRQ_STACK_SIZE : 1024;
_FIQ_STACK_SIZE = DEFINED(_FIQ_STACK_SIZE) ? _FIQ_STACK_SIZE : 1024;
_UNDEF_STACK_SIZE = DEFINED(_UNDEF_STACK_SIZE) ? _UNDEF_STACK_SIZE : 1024;

MEMORY
{
   ps7_ddr_0 : ORIGIN = 0x100000, LENGTH = 0x3FF00000
   ps7_ram_0 : ORIGIN = 0x0, LENGTH = 0x30000
   ps7_ram_1 : ORIGIN = 0xFFFF0000, LENGTH = 0xFE00
}

SECTIONS
{
	.text : {
		KEEP (*(.vectors));
		*(.boot);
		*(.text);
	} > ps7_ddr_0

	.data : { 
		*(.data);
	} > ps7_ddr_0

	.sbss : {
		__sbss_start = .;
		*(.sbss);
		__sbss_end = .;
	}

	.bss : { 
		__bss_start = .;
		*(.bss); 
		__bss_end = .;
	} > ps7_ddr_0

	.stack (NOLOAD) : {
		. = ALIGN(16);
		_stack_end = .;
		. += _STACK_SIZE;
		. = ALIGN(16);
		_stack = .;
		__stack = _stack;
		. = ALIGN(16);
		_irq_stack_end = .;
		. += _IRQ_STACK_SIZE;
		. = ALIGN(16);
		__irq_stack = .;
		_supervisor_stack_end = .;
		. += _SUPERVISOR_STACK_SIZE;
		. = ALIGN(16);
		__supervisor_stack = .;
		_abort_stack_end = .;
		. += _ABORT_STACK_SIZE;
		. = ALIGN(16);
		__abort_stack = .;
		_fiq_stack_end = .;
		. += _FIQ_STACK_SIZE;
		. = ALIGN(16);
		__fiq_stack = .;
		_undef_stack_end = .;
		. += _UNDEF_STACK_SIZE;
		. = ALIGN(16);
		__undef_stack = .;
	} > ps7_ddr_0
}
