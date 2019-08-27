section .data
    len db "",2       ; Reserve space for 10 characters
    string1 dq  "Please input a string: "  
    string2 dq "The new string is: "
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

        ;loop start
        mov r8,input1
        mov rcx,0

    Start:
        cmp byte [r8],0
        jz end1
        
        cmp byte [r8],32
        jz increment

        cmp byte [r8],90
        jl isUpper
        jmp isLower

        isLower: sub byte [r8],32
                 jmp increment




        isUpper: add byte [r8],32
                 jmp increment   
        


        increment:  inc rcx
                    add r8,1
                    jmp Start
    end1:

        sub rcx,1
        mov [len],rcx

        mov  rdx,19                 ; length of string is  bytes
        mov  rsi, qword string2     ; set rsi to pointer to string
        mov  rax, 0x1               ; syscall 1 is write
        mov  rdi, 0x1               ; stdout has a file descriptor of 1
        syscall  
        
        
	    xor rax,rax
	    xor rbx,rbx
	    mov rax,1
	    mov rdi,1
	    mov rdx,[len]
       lea rsi, [input1]
	    syscall 

  
      end:  mov rax,60
        xor rdi,rdi
        syscall