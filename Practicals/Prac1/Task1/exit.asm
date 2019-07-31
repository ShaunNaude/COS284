segment .text
global  _start
_start:
mov  eax,1 ;sys_write
mov  ebx,-1 ;return code

int  0x80 ; 32 bit //syscall is 64bit


;The return code is going to be 255 because is interpreted as an unsigned char in C
