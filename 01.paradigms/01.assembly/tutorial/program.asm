section .text
  global  _start

_start:
  pop     eax     ; number of arguments
  pop     ebx     ; program name
  pop     ebx     ; first argument
  pop     ecx     ; second argument
  pop     edx     ; third argument

  mov     eax,  1 ; sys_exit
  mov     ebx,  0 ; return value
  int     80h     ; kernel call
