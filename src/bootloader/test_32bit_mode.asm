[org 0x7c00]
	mov	bp, 0x9000 ; set stack/base pointer
	mov	sp, bp

	mov	bx, MSG_REAL_MODE
	call print
	call print_newline

	call enter_32bit_mode
	jmp $ ; should never reach here

%include "boot_print.asm"
%include "boot32_gdt.asm"
%include "boot32_print.asm"
%include "boot32_enter_32bit.asm"

[bits 32]
; kernel main starting point.
BEGIN_PROTECTED_MODE: 
	mov	ebx, MSG_PROTECTED_MODE
	call print32
	jmp	$

MSG_REAL_MODE db "Started in 16-bit real mode", 0
MSG_PROTECTED_MODE db "Loaded in 32-bit protected mode", 0

times 510 - ($-$$) db 0
dw	0xaa55
