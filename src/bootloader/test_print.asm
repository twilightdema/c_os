[org 0x7c00]

mov	bx, MSG1
call print
call print_newline

mov	bx, MSG2
call print
call print_newline

mov dx, 0x1234
call print_hex

jmp	$

%include "boot_print.asm"
%include "boot_print_hex.asm"

MSG1:
	db	'Boot Loader v 0.1 by Nok', 0

MSG2:
	db	'All right reserved, 2018', 0

times 510-($-$$)	db	0
dw	0xaa55
