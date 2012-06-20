; simple cat implementation
; andersonvom
; 2012

section .text
	global _start

_start:
	pop	ebx
	dec	ebx
	pop	ebx

exit:
	mov	eax,	1
	mov	ebx,	0
	int	80h

