[org 0x7c00]
	mov bp, 0x8000 ; set stack, base pointer safely away.
	mov	sp, bp

	mov	bx, 0x9000 ; es:bx = 0x0000:0x9000 = location of reading result.
	mov	dh, 2 ; read 2 sectors
	call disk_read_sectors

	mov	dx, [0x9000] ; result of 1st sector read
	call print_hex
	call print_newline

	mov	dx, [0x9000 + 512] ; result of 2nd sector read
	call print_hex
	call print_newline

	jmp $ ; halt

%include "boot_print.asm"
%include "boot_print_hex.asm"
%include "boot_disk_read.asm"

times 510 - ($-$$) db 0
dw	0xaa55

; sector 0x02
times 256 dw 0xabcd

; sector 0x03
times 256 dw 0xdcba
