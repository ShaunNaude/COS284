section .data
              
section .bss


section .text
GLOBAL encryptChar

	
  encryptChar:

     ;start function
  ;=================
      push rbp
      mov rbp,rsp
  ;================
   Parameter1 equ 0 ; rows
    Parameter2 equ 8 ; cols
    matrixPtr equ 16 ;ptr

   

    sub rsp,32
    mov [rsp+Parameter1],rsi  ;put rows on stack
    mov [rsp+Parameter2],rdx  ;put cols on stack
    mov [rsp+matrixPtr],rdi ;put ptr on stack

    mov r10,0
        ;find the col
;===================================
    loop1:
            cmp r10,26
            jz end1
        
            mov r15,[rsp+matrixPtr] 
            mov r15,[r15]
            add r15,r10

            mov r14,[r15]
            cmp r14,[rsp+Parameter1]
            jz end1 
            

            inc r10
            jmp loop1

        end1:
    mov [rsp+Parameter1],r10 ; parameter1 now hold the row
;====================================
    mov r11,0;
        ;find the row
;====================================
    loop2:
        cmp r11,26
        jz end2

        mov rax,8
        mul r11 ;do offset calc
        mov r15,[rsp+matrixPtr] ; this finds correct row by adding offset
        add r15,rax
        mov r14,[r15]
        mov r14,[r14]
        cmp r14,[rsp+Parameter2]
        jz end2

        inc r11
        jmp loop2
    end2:

    mov [rsp+Parameter2],rax ; parameter 2 now olds row*8
;====================================

        ;return correct char
;===================================
        mov r10,[rsp+Parameter1]
        mov r11,[rsp+Parameter2]

         mov r15,[rsp+matrixPtr] ; this finds correct row by adding offset
         add r15,r11
         add r15,r10
         mov rax,[r15]

;===================================


   ;end function
  ;=================  
      leave
      ret
  ;===============