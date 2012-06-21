; NAME
;	utils - preprocessor definitions to make life easier
; 
; SYNOPSIS
;	%include utils.asm
;
; EXAMPLES
;	mov	eax,	sys_write
;	mov	ebx,	STDOUT
;		Call sys_write to output to STDOUT, instead of using integers
;
; 
; License : GNU General Public License
; Author : Anderson Mesquita
; E-Mail : andersonvom@gmail.com
; Version : 0.1
; Created : 06/21/2012

; input and output
%define	STDIN		0
%define	STDOUT		1
%define	STDERR		2

; file options
%define	O_RDONLY	0

; functions
%define	sys_exit	1
%define	sys_open	5
%define	sys_read	3
%define	sys_write	4

