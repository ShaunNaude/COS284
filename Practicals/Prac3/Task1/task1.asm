section .data
           ; Reserve space for 10 characters
    string1 dq  "Please enter a string: "  
    string2 dq "The length of the string is: "
    NULL_TERMINATOR equ 0
    num dq "",1
    numk dq "",1
    div1 db ""
    input1 db  "",0x0a
       

section .text
    global _start

    _start:

        mov  rdx,23                 ; length of string is  bytes
        mov  rsi, qword string1     ; set rsi to pointer to string
        mov  rax, 0x1               ; syscall 1 is write
        mov  rdi, 0x1               ; stdout has a file descriptor of 1
        syscall                     ; make the system call


        mov  rdx,132              
        mov  rsi, input1     ; set rsi to pointer to string
        mov  rax, 0x0               ; syscall 0 is read
        mov  rdi, 0x0               ; stdin has a file descriptor of 0
        syscall  

    

    xor rax, rax
    xor rdx,rdx
    xor rcx,rcx
    mov rdx, input1
    mov rsi,rdx            

spin: cmp byte[rsi],0         
    je ext                
    inc rcx                 
    inc rsi                 
    jmp spin

ext:	  
            sub rcx,1
            mov rax,rcx
            xor rdx,rdx
            

             mov r10,10
            
             
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
            xor rdx,rdx
	

            cmp rax,48
            jz one

    xor rcx,rcx
	xor rax,rax
	xor rbx,rbx
	mov rax,1
	mov rdi,1
	mov rdx, 29
	lea rsi, [string2]
	syscall 

     

    xor rdx,rdx
	xor rcx,rcx
	xor rax,rax
	xor rbx,rbx
	mov rax,1
	mov rdi,1
	mov rdx, 1
	lea rsi, [num]
	syscall  

     xor rdx,rdx
	xor rcx,rcx
	xor rax,rax
	xor rbx,rbx
	mov rax,1
	mov rdi,1
	mov rdx, 1
	lea rsi, [numk]
	syscall 
jmp end

one:

    xor rcx,rcx
	xor rax,rax
	xor rbx,rbx
	mov rax,1
	mov rdi,1
	mov rdx, 29
	lea rsi, [string2]
	syscall 

     xor rdx,rdx
	xor rcx,rcx
	xor rax,rax
	xor rbx,rbx
	mov rax,1
	mov rdi,1
	mov rdx, 1
	lea rsi, [numk]
	syscall 


      ;  mov  rdx,2           ; length of string is  bytes
       ; mov  rsi, dword num     ; set rsi to pointer to string
       ; mov  rax, 0x1               ; syscall 1 is write
       ; mov  rdi, 0x1               ; stdout has a file descriptor of 1
       ; syscall  

       ; mov  rdx,2           ; length of string is  bytes
        ;mov  rsi, dword numk     ; set rsi to pointer to string
        ;mov  rax, 0x1               ; syscall 1 is write
        ;mov  rdi, 0x1               ; stdout has a file descriptor of 1
        ;syscall  
           
        ;---------------------------------------------------------------
      end:  mov rax,60
        xor rdi,rdi
        syscall