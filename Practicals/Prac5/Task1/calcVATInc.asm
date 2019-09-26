
section .data
              
section .bss


section .text
GLOBAL calcVATInc

	
  calcVATInc:
    ;start function
  ;=================
      push rbp
      mov rbp,rsp
  ;================
   

    ; xmm0 has the price
    ; xmm1 has the "VAT"

    mov r15,100
    cvtsi2sd xmm2,r15 

    divsd xmm1,xmm2
    mulsd xmm1,xmm0

    addsd xmm0,xmm1

    ; return via xmm0

      ;end function
  ;=================
      
      leave
      ret
  ;===============