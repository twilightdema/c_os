; Structure of GDT table for boot loader to works in 32-bit protected mode.

gdt_start:
	; GDT tablet start with 8 bytes of 0x00
	dd 0x0
	dd 0x0

gdt_code:
	; code segment. base = 0x00000000, length = 0xfffff
	dw 0xffff ; segment length (bit 0-15)
	dw 0x0 ; segment base (bit 0-15)
	db 0x0 ; segment base (bit 16-23)
	db 10011010b ; flags (8 bits)
	db 11001111b ; flags (4 bits), segment length (bit 16-23)
	db	0x0 ; segment base (bit 24-31)

gdt_data:
	; data segment. base = 0x00000000, length = 0xfffff
	dw 0xffff ; segment length (bit 0-15)
	dw 0x0 ; segment base (bit 0-15)
	db 0x0 ; segment base (bit 16-23)
	db 10010010b ; flags (8 bits)
	db 11001111b ; flags (4 bits), segment length (bit 16-23)
	db	0x0 ; segment base (bit 24-31)

gdt_end:

gdt_descriptor:
	dw	gdt_end - gdt_start - 1 ; size (16 bits) = real size - 1
	dd	gdt_start ; address (32 bits)

; degine constants for later usage
CODE_SEGMENT	equ gdt_code - gdt_start
DATA_SEGMENT	equ gdt_data - gdt_start
