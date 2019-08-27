section .data
    string1 db  "AAAABB"       ; Reserve space for 10 characters
    string2 db  "Please enter 3 characters: "      
    string3 db  "Converted: "


section .text
    global _start

    _start:

        mov  rdx, 0x1b              ; length of string is 20 bytes
        mov  rsi, dword string2     ; set rsi to pointer to string
        mov  rax, 0x1               ; syscall 1 is write
        mov  rdi, 0x1               ; stdout has a file descriptor of 1
        syscall                     ; make the system call




        mov  rdx, 0x3               
        mov  rsi, dword string1     ; set rsi to pointer to string
        mov  rax, 0x0               ; syscall 0 is read
        mov  rdi, 0x0               ; stdin has a file descriptor of 0
        syscall                     ; make the system call
        
             

        mov  rdx, 0xb               ; length of string is 13 bytes
        mov  rsi, dword string3     ; set rsi to pointer to string
        mov  rax, 0x1               ; syscall 1 is write
        mov  rdi, 0x1               ; stdout has a file descriptor of 1
        syscall        


        mov rax,0x20
        add [string1 + 1], rax
        add [string1+2],rax
        sub [string1],rax


        mov  rdx, 0x3               ; length of string is 10 bytes
        mov  rsi, dword string1    ; set rsi to pointer to string
        mov  rax, 0x1               ; syscall 1 is write
        mov  rdi, 0x1               ; stdout has a file descriptor of 1
        syscall      

    ;---------------------------------------------------------------
        mov eax,60
        xor edi,edi
        syscall