[bits 16]
enter_32bit_mode:
	cli ; disable interrupts
	lgdt	[gdt_descriptor] ; load GDT descriptor
	mov	eax, cr0 ; set A19 gate of register cr0
	or	eax, 0x1
	mov	cr0, eax
	jmp	CODE_SEGMENT:init_32bit_mode ; use far jump to flush CPU pipeline.

[bits 32]
init_32bit_mode:
	mov	ax, DATA_SEGMENT ; update all segment registers
	mov	ds, ax
	mov	ss, ax
	mov	es, ax
	mov	fs, ax
	mov	gs, ax

	mov	ebp, 0x90000 ; put stack/base pointer at top of free space
	mov	esp, ebp

	call BEGIN_PROTECTED_MODE ; call start of kernel code
