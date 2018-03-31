[bits 32]

VIDEO_MEMORY	equ 0xb8000
WHITE_ON_BLACK	equ 0x0f

print32:
	pusha
	mov	edx, VIDEO_MEMORY

print32_loop:
	mov	al, [ebx] ; 1st character is at ebx
	mov	ah, WHITE_ON_BLACK
	cmp al, 0 ; check if end of string
	je	print32_done
	mov	[edx], ax ; store to video memory
	add	ebx, 1 ; next src
	add edx, 2 ; next dst
	jmp	print32_loop

print32_done:
	popa
	ret
