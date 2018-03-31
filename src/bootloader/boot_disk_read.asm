; Subroutine to read 'bh' sector(s) of drive 'dl' (start at sector 0x02) into memory at es:bx (0=floppy, 1=floppy2, 0x80=hdd, 0x81=hdd2).

disk_read_sectors:
	pusha
	; Preserve input argument dx for later use
	push dx
	mov	ah, 0x02 ; opcode read of int 0x13
	mov	al, dh ; # of sectors to read (0x01 -> 0x80)
	mov	cl, 0x02 ; start at sector 0x02 as 0x01 is boot sector
	mov	ch, 0x00 ; cylinder (0x0 -> 0x3ff)
	; dl <- drive number (0=floppy, 1=floppy2, 0x80=hdd, 0x81=hdd2)
	mov	dh, 0x00 ; head number (0x0 -> 0xf)
	int 0x13 ; read int
	jc	disk_error
	pop	dx
	cmp	al, dh ; al is output of read int = # of sector actually read.
	jne	sector_error
	popa
	ret

disk_error:
	mov	bx, DISK_ERROR_MSG
	call print
	call print_newline
	mov	dh, ah ; ah = error code
	call	print_hex
	jmp	disk_error_halt_loop


sector_error:
	mov	bx, SECTOR_ERROR_MSG
	call print
	call print_newline

disk_error_halt_loop:
	jmp $

DISK_ERROR_MSG: db "Cannot read kernel from sector 0x02:",0

SECTOR_ERROR_MSG: db "# of kernel sector read is wrong.",0
