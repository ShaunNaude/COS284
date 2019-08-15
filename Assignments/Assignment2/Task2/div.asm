section .data
    input1 db  "" ,2      ; Reserve space for 10 characters
    string1 db  "Please input the first number: ",0x0a      
    string2 db  "Please input the second number: ",0x0a
    input2 db  "aaaaaa",10  
    quot db "aaaaaa",10
    rem db "aaaaaaa",10
    divider dq "aaaaaaa",32
    r db "r",10
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
        movsx r10, byte [input2]
        sub r8,48
       sub r10,48
       
       ;mov r8,18
       ;mov r10,2

      xor rdx,rdx
     
      
        ;add r10,1
        mov rax,r8
        mov [rem] , r10
        div dword [rem]
        add rax,48
        mov [quot] , rax

       ; xor rax,rax
       ; mov rax,r10
       ; mul rdx
       
        add rdx,48

        mov [rem] , rdx
       
        

        
        mov  rdx,1             ; length of string is 20 bytes
        mov  rsi,qword quot     ; set rsi to pointer to string
        mov  rax, 1               ; syscall 1 is write
        mov  rdi, 1               ; stdout has a file descriptor of 1
        syscall  

        
        mov  rdx,1             ; length of string is 20 bytes
        mov  rsi,dword r    ; set rsi to pointer to string
        mov  rax, 1               ; syscall 1 is write
        mov  rdi, 1               ; stdout has a file descriptor of 1
        syscall 

        mov  rdx,1             ; length of string is 20 bytes
        mov  rsi,dword rem    ; set rsi to pointer to string
        mov  rax, 1               ; syscall 1 is write
        mov  rdi, 1               ; stdout has a file descriptor of 1
        syscall 


           ;---------------------------------------------------------------
        mov rax,60
        xor rdi,rdi
        syscall
