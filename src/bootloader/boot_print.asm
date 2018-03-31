; Subroutine for printing null terminated string.
; Address of string is in bx.

print:
	pusha
	; While (string[i] != 0) { print string[i]; i++ }
start:
	mov	al, [bx]
	cmp	al, 0
	je	done
	; TTY mode opcode
	mov	ah, 0x0e
	int	0x10
	add	bx, 0x01
	jmp	start
done:
	popa
	ret

print_newline:
	pusha
	mov	ah, 0x0e
	mov	al, 0x0a
	int 0x10
	mov	al, 0x0d
	int	0x10
	popa
	ret
