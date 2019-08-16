section .data
    input1 db  "" ,2      ; Reserve space for 10 characters
    string1 db  "Please input the first number: ",0x0a      
    string2 db  "Please input the second number: ",0x0a
    input2 db  "aaaaaa",10  
    quot db "aaaaaa",0x0a
    rem db "aaaaaaa",10
    divider dq "aaaaaaa",32
   
section .text
    global _start

    _start:

      mov  rdx, 31            ; length of string is  bytes
        mov  rsi, dword string1     ; set rsi to pointer to string
        mov  rax,1              ; syscall 1 is write
        mov  rdi,1               ; stdout has a file descriptor of 1
        syscall                     ; make the system call




        mov  rdx,3               
        mov  rsi, dword input1     ; set rsi to pointer to string
        mov  rax, 0              ; syscall 0 is read
        mov  rdi,0               ; stdin has a file descriptor of 0
        syscall    


        mov  rdx,32              ; length of string is 20 bytes
        mov  rsi, dword string2     ; set rsi to pointer to string
        mov  rax, 1               ; syscall 1 is write
        mov  rdi, 1               ; stdout has a file descriptor of 1
        syscall                     ; make the system call


        mov  rdx,3               
        mov  rsi, dword input2     ; set rsi to pointer to string
        mov  rax, 0x0               ; syscall 0 is read
        mov  rdi, 0x0               ; stdin has a file descriptor of 0
        syscall 

        movsx r8,byte [input1]
        movsx r10, byte [input2]

        movsx r9,byte [input1+1]   ; unit top
        movsx r11, byte [input2+1]  ; unit bot


        sub r8,'0'
        sub r10,'0'

        sub r9,'0'
        sub r11,'0'

        sub r8,r10
        sub r9,r11

        mov r13,r9 ;copy of r9

         

        mov r12,r8
        sub r12,1

        mov rax,r9
        add r9,10

        
        cmp rax,0
        cmovl rax, r9
        mov r9,rax
        mov rax,r13

        cmp rax,0
        cmovl rax,r12
        mov r13,rax


        add r8,48
        add r9,'0'

        add r12,48
        add r13,'0'

        mov [input1], r13
        mov [quot], r9


        mov  rdx,1             ; length of string is 20 bytes
        mov  rsi, dword input1     ; set rsi to pointer to string
        mov  rax, 1               ; syscall 1 is write
        mov  rdi, 1               ; stdout has a file descriptor of 1
        syscall  

         mov  rdx,1             ; length of string is 20 bytes
        mov  rsi, dword quot     ; set rsi to pointer to string
        mov  rax, 1               ; syscall 1 is write
        mov  rdi, 1               ; stdout has a file descriptor of 1
        syscall  






        ;---------------------------------------------------------------
        mov rax,60
        xor rdi,rdi
        syscall