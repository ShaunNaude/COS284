section .data
              
section .bss

allNums resb 64


section .text
GLOBAL parameterSummation

	
  parameterSummation:
    ;start function
  ;=================
      push rbp
      mov rbp,rsp
  ;================

    ;paramters 2-8 are stored in xmm0 till xmm7
    movsd [allNums],xmm0
    movsd [allNums+8],xmm1
    movsd [allNums+16],xmm2
    movsd [allNums+24],xmm3
    movsd [allNums+32],xmm4
    movsd [allNums+40],xmm5
    movsd [allNums+48],xmm6
    movsd [allNums+56],xmm7
   

    cmp rdi,8
    jle onlyregs

    mov rcx,0 ;let rcx be a counter
    mov r15,0 ;stack counter
    cvtsi2sd xmm5,rcx ; this we be the sum var
    for:
         cmp rdi,rcx
        jz endfor

        cmp rcx,8
        jge stack

        movsd xmm0,qword [allNums+rcx*8]
        inc rcx
        cvtsi2sd xmm1,rcx
        mulsd xmm0,xmm1
        addsd xmm5,xmm0
        jmp for
    
        stack:
        movsd xmm0,[rbp+16+r15*8]
        inc rcx
        cvtsi2sd xmm1,rcx
        mulsd xmm0,xmm1
        addsd xmm5,xmm0
        inc r15
        jmp for



    endfor:
    movsd xmm0,xmm5
    jmp endfunc

    ;all other variables are strored from rbp+16 
   ; movsd xmm8, [rbp+24]


     onlyregs:
    mov rcx,0 ;let rcx be a counter
    cvtsi2sd xmm5,rcx ; this we be the sum var
    start:
        cmp rdi,rcx
        jz endSum

        movsd xmm0,qword [allNums+rcx*8]
        inc rcx
        cvtsi2sd xmm1,rcx
        mulsd xmm0,xmm1
        addsd xmm5,xmm0
        jmp start


    endSum:
        movsd xmm0,xmm5 ; return sum

    endfunc:
    ;end function
  ;=================
      leave
      ret
  ;===============