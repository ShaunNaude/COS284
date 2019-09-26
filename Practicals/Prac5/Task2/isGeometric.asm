
section .data
              
section .bss

number resb 8 

section .text
GLOBAL isGeometric

	
  isGeometric:
    ;start function
  ;=================
      push rbp
      mov rbp,rsp
  ;================
    ;rdi is holding a pointer to a double array
    ;rsi has the length of the array

    ptr equ 0 ; pointer
    val equ 8 ;value


    sub rsp,32 ; 
    mov [rsp+ptr],rdi  ;put pointer on stack

    

    

    mov r15,[rsp+ptr]
    movsd xmm2, qword [r15]    ; xmm2 should hold double[0]

    movsd xmm3,qword [r15+8]  ; xmm3 should hold double[1]

    divsd xmm3,xmm2   ; xmm3 is holding the ratio

    mov rcx,0 ; let rcx be the counter
    sub rsi,1
    for:
        cmp rsi,rcx
        jz end 

        movsd xmm1,qword [r15+8*rcx]
        inc rcx
        movsd xmm2,qword[r15+8*rcx]
        divsd xmm2,xmm1

        ucomisd xmm2,xmm3
        mov rax,1
        je for

        mov rax,0

    end:

       ;end function
  ;=================
      
      leave
      ret
  ;===============