section .data
    input1 db  "" ,2      ; Reserve space for 10 characters
    string1 db  "Please input a number: ",0x0a      
    num dq ""
   
section .text
    global _start

    _start:

      mov  rdx, 23            ; length of string is  bytes
        mov  rsi, dword string1     ; set rsi to pointer to string
        mov  rax,1              ; syscall 1 is write
        mov  rdi,1               ; stdout has a file descriptor of 1
        syscall                     ; make the system call




        mov  rdx,3               
        mov  rsi, dword input1     ; set rsi to pointer to string
        mov  rax, 0              ; syscall 0 is read
        mov  rdi,0               ; stdin has a file descriptor of 0
        syscall    

        movsx r8,byte [input1]  ; input one digit one
        

        
        movsx r11, byte [input1+1]  ; unit bot

        mov rax,10
        sub r8,'0'
        sub r11,'0'
        mul r8
        mov r8,rax
        add r8,r11


        mov r12,0
        mov r13,1
        cmp r8,64
        cmovz r13,r12

        cmp r8,32
        cmovz r13,r12

        cmp r8,16
        cmovz r13,r12

        cmp r8,8
        cmovz r13,r12

        cmp r8,4
        cmovz r13,r12

        cmp r8,2
        cmovz r13,r12

        cmp r8,1
        cmovz r13,r12

        add r13,'0'
        mov [num],r13


        mov  rdx,1             ; length of string is 20 bytes
        mov  rsi, dword num  ; set rsi to pointer to string
        mov  rax, 1               ; syscall 1 is write
        mov  rdi, 1               ; stdout has a file descriptor of 1
        syscall 


        

         ;---------------------------------------------------------------
        mov rax,60
        xor rdi,rdi
        syscall