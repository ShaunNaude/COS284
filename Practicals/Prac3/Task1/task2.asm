section .data
    input1 dq  "",0x0a       ; Reserve space for 10 characters
    string1 dq  "Please enter a string: "  
    NULL_TERMINATOR equ 0
    num dq 1
    numk dq 1
    div1 db ""
       

section .text
    global _start

    _start:

        mov  rdx,23             ; length of string is  bytes
        mov  rsi, qword string1     ; set rsi to pointer to string
        mov  rax, 0x1               ; syscall 1 is write
        mov  rdi, 0x1               ; stdout has a file descriptor of 1
        syscall                     ; make the system call


        mov  rdx,264              
        mov  rsi, qword input1     ; set rsi to pointer to string
        mov  rax, 0x0               ; syscall 0 is read
        mov  rdi, 0x0               ; stdin has a file descriptor of 0
        syscall  

        

         mov rax,input1
         mov rbx,input1
         mov rcx,0

        loop1:
        cmp     word [rax], NULL_TERMINATOR ; Compare whether or not this block is completely null (e.g. 0)
            jz     exitLoop ; if it is, jump to _RollbackFinalBlock
            ; if not...
            add rax,4 ; Add to EAX the block size
            add rcx,1
            jmp  loop1; repeat loop

exitLoop:   
            sub rcx,4
            mov rax,rcx
            

             mov r10,10
             mov [div1],r10
             
        div r10
        add rax,'0'
        ;mov [quot],rax
        add rdx,'0'
       ; mov  [rem],rdx
       mov r11,rax
       mov r12,rdx



            mov [num],r11
            mov [numk],r12
            add rcx,1



     
     mov  rdx,rcx           ; length of string is  bytes
        mov  rsi, qword input1     ; set rsi to pointer to string
        mov  rax, 0x1               ; syscall 1 is write
        mov  rdi, 0x1               ; stdout has a file descriptor of 1
        syscall   

        mov  rdx,2           ; length of string is  bytes
        mov  rsi, qword num     ; set rsi to pointer to string
        mov  rax, 0x1               ; syscall 1 is write
        mov  rdi, 0x1               ; stdout has a file descriptor of 1
        syscall  

        mov  rdx,2           ; length of string is  bytes
        mov  rsi, qword numk     ; set rsi to pointer to string
        mov  rax, 0x1               ; syscall 1 is write
        mov  rdi, 0x1               ; stdout has a file descriptor of 1
        syscall  
           
        ;---------------------------------------------------------------
        mov rax,60
        xor rdi,rdi
        syscall