; simple cat implementation
; andersonvom
; 2012

section .data:
	NOTFOUND	db	'File not found',10
	NOTFOUND_LEN	equ	$-NOTFOUND

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
	jns	read_file
	jmp	file_not_found
	
read_file:
	

file_not_found:
	mov	eax,	4	; write
	mov	ebx,	1	; STDOUT
	mov	ecx,	NOTFOUND
	mov	edx,	NOTFOUND_LEN
	int	80h

exit:
	mov	eax,	1
	mov	ebx,	0
	int	80h

