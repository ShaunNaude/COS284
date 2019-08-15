section .data
    input1 db  "" ,2      ; Reserve space for 10 characters
    string1 db  "Please input the first number: ",0x0a      
    string2 db  "Please input the second number: ",0x0a
    input2 db  "aaaaaa"  
    quot db "aaaaaa"
    rem db "aaaaaaa"
    divider db "aaaaaaa"
    result db "aaaaaaaa"


section .text
    global _start

    _start:

        mov  rdx, 31            ; length of string is  bytes
        mov  rsi, dword string1     ; set rsi to pointer to string
        mov  rax,1              ; syscall 1 is write
        mov  rdi,1               ; stdout has a file descriptor of 1
        syscall                     ; make the system call




        mov  rdx,2               
        mov  rsi, dword input1     ; set rsi to pointer to string
        mov  rax, 0              ; syscall 0 is read
        mov  rdi,0               ; stdin has a file descriptor of 0
        syscall    


        mov  rdx,32              ; length of string is 20 bytes
        mov  rsi, dword string2     ; set rsi to pointer to string
        mov  rax, 1               ; syscall 1 is write
        mov  rdi, 1               ; stdout has a file descriptor of 1
        syscall                     ; make the system call


        mov  rdx,0x2               
        mov  rsi, dword input2     ; set rsi to pointer to string
        mov  rax, 0x0               ; syscall 0 is read
        mov  rdi, 0x0               ; stdin has a file descriptor of 0
        syscall 



        movsx r8,byte [input1]
        movsx r9, byte [input2]
        sub r8,48
        sub r9,48
        ;mov r8,7
       ; mov r9,6
        mov rax , r8
        mul r9

       
        mov rdx,0
        xor r10,r10
        mov r10,10
        mov [divider],r10
        div dword [divider]
        add rax,48
        ;mov [quot],rax
        add rdx,48
       ; mov  [rem],rdx
       mov r11,rax
       mov r12,rdx



        
        
        
       mov [result],r11
        mov  rdx,1             ; length of string is 20 bytes
        mov  rsi,dword result     ; set rsi to pointer to string
        mov  rax, 1               ; syscall 1 is write
        mov  rdi, 1               ; stdout has a file descriptor of 1
        syscall  

        
       mov [rem],r12
        mov  rdx,1             ; length of string is 20 bytes
        mov  rsi,dword rem    ; set rsi to pointer to string
        mov  rax, 1               ; syscall 1 is write
        mov  rdi, 1               ; stdout has a file descriptor of 1
        syscall 

           ;---------------------------------------------------------------
        mov rax,60
        xor rdi,rdi
        syscall

        ; rdx is always output size
        ;rsi is always output register
        ;rax,rdx,rsi,  are system call registers