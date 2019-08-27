section .data
    input1 db  "AAAABB"       ; Reserve space for 10 characters
    string1 db  "Please input the first number: "      
    string2 db  "Please input the second number: "
    input2 db  "AAAABB"  
    result db "",0x0a


section .text
    global _start

    _start:

        mov  rdx, 0x1f             ; length of string is  bytes
        mov  rsi, dword string1     ; set rsi to pointer to string
        mov  rax, 0x1               ; syscall 1 is write
        mov  rdi, 0x1               ; stdout has a file descriptor of 1
        syscall                     ; make the system call




        mov  rdx, 0x2               
        mov  rsi, dword input1     ; set rsi to pointer to string
        mov  rax, 0x0               ; syscall 0 is read
        mov  rdi, 0x0               ; stdin has a file descriptor of 0
        syscall    


        mov  rdx, 0x20              ; length of string is 20 bytes
        mov  rsi, dword string2     ; set rsi to pointer to string
        mov  rax, 0x1               ; syscall 1 is write
        mov  rdi, 0x1               ; stdout has a file descriptor of 1
        syscall                     ; make the system call


        mov  rdx,0x2               
        mov  rsi, dword input2     ; set rsi to pointer to string
        mov  rax, 0x0               ; syscall 0 is read
        mov  rdi, 0x0               ; stdin has a file descriptor of 0
        syscall 



        mov rax, [input1]
        mov rbx, [input2]
        sub rax,48
        sub rbx,48
        add rax,rbx
        add rax,48
        
        mov [result],rax
        mov  rdx,0x1              ; length of string is 20 bytes
        mov  rsi,dword input2     ; set rsi to pointer to string
        mov  rax, 0x1               ; syscall 1 is write
        mov  rdi, 0x1               ; stdout has a file descriptor of 1
        syscall  

           ;---------------------------------------------------------------
        mov rax,60
        xor rdi,rdi
        syscall

        ; rdx is always output size
        ;rsi is always output register
        ;rax,rdx,rsi,  are system call registers