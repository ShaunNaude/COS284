extern printChar

section .data
           
   
       
section .bss
    
section .text
GLOBAL spiralRead

	
  spiralRead:

    mov r15,rdi
    mov r14,rsi
   ; mov r13,4 ;dis

    
    looper:
    
    cmp r14,0
    jz end

    xor rdi,rdi  
    
    movsx di,byte [r15] 

    call printChar

    sub r14,1
    add r15,21
    jmp looper
    end:

        ret			; Return