extern malloc
section .data
              
section .bss

matrixPtr  resb 8  ; size of a char pointer in C


section .text
GLOBAL populateMatrix

	
  populateMatrix:
    ;start function
  ;=================
      push rbp
      mov rbp,rsp
  ;================

        ;stack memory allocation
    ;========================
    generalVar equ 0 ; rows

    sub rsp,16
    ;========================


      mov rdi,208 ; this is the amount of bytes needed for pointer array
      call malloc ; calling malloc from c
      mov [matrixPtr],rax ; making the value of pointer mem address the starting address of matrix 

    ;loop to make array 2D
;===========================================
    mov r15,0
    mov r14,8
    loop1:
        cmp r15,26
        jz end1

        ;allocate 26 bytes
    ;===================
        mov rdi,26
        call malloc
        mov [rsp+generalVar],rax ; holding a ptr
    ;===================
        xor rax,rax
        mov rax,8
        mul r15

        ;adding 8byte memory offset for pointers [matrixPtr+rax]
        mov rdi,[rsp+generalVar]
        mov [matrixPtr+rax],rdi

        mov [rdi],r15
        

        ;increment loop counter
        inc r15
        jmp loop1
    end1:

    mov rax,matrixPtr

;===========================================

    ;end function
  ;=================  
      leave
      ret
  ;===============



        