section .data
  hello     db      'Hello World', 10     ; string to write
  helloLen  equ     $-hello               ; string length


section .text
  global    _start


_start:
  pop       ebx                           ; argument number
  pop       ebx                           ; program name
  pop       ebx                           ; filename

  ; create file
  mov       eax,      8                   ; creat system call
  mov       ecx,      00644Q              ; file permissions (rw)
  int       80h

  ; test file creation
  test      eax,      eax
  js        quit
  call      fileWrite


quit:
  mov       ebx,      eax                 ; store possible errors on return value
  mov       eax,      1                   ; sys_exit
  int       80h


; proc fileWrite
fileWrite:
  mov       ebx,      eax                 ; store file descriptor
  mov       ecx,      hello               ; string to write
  mov       edx,      helloLen            ; string length
  mov       eax,      4                   ; sys_write
  int       80h

  mov       eax,      6                   ; sys_close
  int       80h

  ret
; end fileWrite

