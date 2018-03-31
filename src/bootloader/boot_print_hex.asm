; Subroutine for print_hex, data in dx.

print_hex:
	pusha
	mov	cx, 0 ; index variable

hex_loop:
	cmp	cx, 4 ; loop 4 times
	je	end

	mov	ax,	dx
	and	ax, 0x000f
	add	al,	0x30 ; 0x30->0x39 = '0'->'9'
	cmp	al, 0x39
	jle	_step_2
	add	al, 0x07
_step_2:
	mov	bx, HEX_OUT + 5
	sub bx, cx
	mov	[bx], al
	ror	dx, 4	; rotate right so that we get next byte to be processed.
	add	cx, 0x01
	jmp	hex_loop

end:
	mov	bx, HEX_OUT
	call	print
	popa
	ret

HEX_OUT:
	db	'0x0000', 0 ; temporary memory for output to be printed.
