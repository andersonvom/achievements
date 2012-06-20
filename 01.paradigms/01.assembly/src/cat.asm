; simple cat implementation
; andersonvom
; 2012

section .text
	global _start

_start:
	pop	ebx		; argc
	pop	ebx		; argv[0] - program name

open_next_file:
	pop	ebx		; argv[i] - filename
	mov	eax,	5	; sys_open
	mov	ecx,	0	; O_RDONLY
	int	80h

	test	eax,	eax
	jns	file_not_found
	jmp	exit
	
read_file:
	

file_not_found:
	

exit:
	mov	eax,	1
	mov	ebx,	0
	int	80h

