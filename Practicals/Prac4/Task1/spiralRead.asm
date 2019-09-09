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
    M equ 0 ; rows
    N equ 8 ; cols
    P equ 16 ;ptr
  
    sub rsp,16
    mov [rsp+M],rsi  ;put rows on stack
    mov [rsp+N],rdx  ;put cols on stack
    mov [rsp+P],rdi ;put ptr on stack
   
    mov r15,0 ; K
    mov r14,0 ; I
    mov r13,0 ; i
    

    mov r12,0 ; general
    
    while:
      cmp r15,[rsp+M]
      jz endWhile

      cmp r14,[rsp+N]
      jz endWhile

;====================================
      ;first for Loop
      mov r13,r14
      for1:
          cmp r13,[rsp+N]
          jge endFor1

          mov rax,8
          mov rdi, [rsp+P]

          mov r12,r15
          mul r15
          mov r15,rax
          add rdi,r15
          mov r15,r12

          mov rdi,[rdi]
          add rdi,r13
          mov rdi , [rdi]
          call printChar
          inc r13
          jmp for1
      endFor1:
      inc r15
;========================================
    ;second loop
;========================================
   
    mov r13,r15
    for2:
      cmp r13,[rsp+M]
      jge endFor2

      mov rax,8
      mov rdi, [rsp+P]

      mov r12,r13
      mul r13     ;multiply 
      mov r13,rax
      add rdi,r13
      mov r13,r12 ; back to normal

      mov rdi,[rdi]
      mov r12,[rsp+N]
      sub r12,1
      add rdi,r12
      mov rdi,[rdi]
      call printChar
       inc r13
        jmp for2


    endFor2:  
    mov r12 , [rsp+N]
    sub r12,1
    mov [rsp+N],r12
    
;===========================================

    ;third loop
;========================================
   
  cmp r15,[rsp+M]
  jge dont

    mov r12,[rsp+N]
    sub r12,1
    mov r13,r12
    for3:
      cmp r13,r14
      jl endFor3

       mov rax,8
      mov rdi, [rsp+P]

      mov r12,[rsp+M]
      sub r12,1
      mul r12
      mov r12,rax

      add rdi,r12
      mov rdi , [rdi]
      add rdi,r13
      mov rdi,[rdi]
      call printChar
      sub r13,1
      jmp  for3

    endFor3:  
  mov r12,[rsp+M]
  sub r12,1
  mov [rsp+M],r12

    dont:
;===========================================

    ;4th loop
;=============================================
    cmp r14,[rsp+N]
    jz dont2

    mov r12,[rsp+M]
    sub r12,1
    mov r13,r12
      for4:
      cmp r13,r15
      jl endFor4

       mov rax,8
      mov rdi, [rsp+P]

      mov r12,r13
      mul r13
      mov r13,rax
      add rdi,r13
      mov r13,r12

      mov rdi,[rdi]
      add rdi,r14
      mov rdi,[rdi]
      call printChar
      sub r13,1
      jmp for4


      endFor4:

      inc r14


     dont2:
;=============================================
   




        jmp while
    endWhile:







    


   ; mov rdi, [rsp+P]
    ; index = current row index
    ; index *= 8
   ; add rdi,0 ; the first time we add we are moving the pointer
   ; mov rdi, [rdi]
    ; index = 0

    ;add rdi,1 ; now we are moving the index
   ; mov rdi,[rdi] ; dereference that address to get the number 

   ; mov rax,0
    
    ;call printChar



    ;end function
  ;=================
      mov rsp,rbp
      pop rbp
      ret
  ;===============



        