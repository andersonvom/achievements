; simple cat implementation
; andersonvom
; 2012

section .data
	BUFSIZE		equ	0x2000
	NOTFOUND	db	'File not found',10
	NOTFOUND_LEN	equ	$-NOTFOUND
	ERROR		db	'An error occurred',10
	ERROR_LEN	equ	$-ERROR

section .bss
	buffer		resb	BUFSIZE

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
	js	file_not_found
	mov	ebx,	eax
	
read_file:
	mov	eax,	3	; sys_read
	mov	ecx,	buffer
	mov	edx,	BUFSIZE
	int	80h
	test	eax,	eax
	jz	exit
	js	error
	
	push	ebx		; save file descriptor
	mov	edx,	eax	; num of bytes read
	mov	eax,	4	; sys_write
	mov	ebx,	1	; STDOUT
	int	80h
	pop ebx			; get file descriptor back

	jmp	read_file

error:
	mov	ecx,	ERROR
	mov	edx,	ERROR_LEN
	jmp	print_message

file_not_found:
	mov	ecx,	NOTFOUND
	mov	edx,	NOTFOUND_LEN
	jmp	print_message

print_message:
	mov	eax,	4	; write
	mov	ebx,	1	; STDOUT
	int	80h

exit:
	mov	eax,	1
	mov	ebx,	0
	int	80h

