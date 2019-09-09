extern printChar

section .data
              
section .bss


section .text
GLOBAL spiralRead

	
  spiralRead:
    ;start function
  ;=================
      push rbp
      mov rbp,rsp
  ;================
    A equ 0 ; rows
    B equ 8 ; cols
    P equ 16 ;ptr
    sub rsp,16
    mov [rsp+A],rsi  ;put rows on stack
    mov [rsp+B],rdx  ;put cols on stack
    mov [rsp+P],rdi ;put ptr on stack

    

    mov rdi, [rsp+P]
    ; index = current row index
    ; index *= 8
    add rdi,0 ; the first time we add we are moving the pointer
    mov rdi, [rdi]
    ; index = 0

    add rdi,1 ; now we are moving the index
    mov rdi,[rdi] ; dereference that address to get the number 

    mov rax,0
    
    call printChar



    ;end function
  ;=================
      mov rsp,rbp
      pop rbp
      ret
  ;===============



        