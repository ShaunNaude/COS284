section .data
           ; Reserve space for 10 characters
<<<<<<< HEAD
    string1 dq  "Please input an integer: ",0x0a  
=======
    string1 dq  "Please input an integer: "  
>>>>>>> 468e9615492bc66b082bf0937626cbdc924feb22
    string2 dq "The total sum is: "
   
    input1 db  ""
    ans db ""
       

section .text
    global _start

    _start:

        mov  rdx,25                 ; length of string is  bytes
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

    ;getting input length
    start: cmp byte[rsi],0         
        je ext                
        inc rcx                 
        inc rsi                 
        jmp start

    ext:	  
        sub rcx,1
        mov r8,input1
        mov r9,0 ; holder
        mov r10,0 ; tally
        mov r11,1 ; initial
        mov r12,10 ;multiplier
        mov r15,1 ;count
        mov r14,0
        mov rax,0
        add r8,rcx
        sub r8,1

    start2:
            cmp rcx,0
            je ext2
            movsx r9,byte [r8]
            sub r9,'0'
            mov rax,r9
            mul r11

            add r10,rax
            mov rax,1
            mov r14,r15
            mul2: 
                cmp r14,0
                je endmul2
                sub r14,1
                mul r12
                jmp mul2
            endmul2:
                

            mov r11,rax
            inc r15
            sub rcx,1
            sub r8,1
            jmp start2
    ext2:

        mov r11,0 ;tally
    start3:
            cmp r10,0
            je ext3

            add r11,r10
            sub r10,1
            jmp start3

    ext3:

    mov rax,r11
    mov r10,10
    mov r9,0 ; number of times divided
    mov rdx,0
    mov r8,ans
    mov r12,0 ;holder
    mov r15,0
    mov r13,0 ;another counter
    
    start4:
        xor rdx,rdx
        
       

        cmp rax,10
        jl less

        div r10
        inc r9
        
        jmp start4


            less:
                 cmp rax,0
                 jz cunt

                cmp r9,0
                je r9is0
                mov r12,rax
                add rax,48
                mov [r8],rax
                inc r15
                mov rax,10
                    mul1:
                        cmp r9,1
                        je endMul
                        mul r10
                        sub r9,1
                        jmp mul1

                    endMul:
                mul r12
                sub r11,rax
                ;lll
                div r10
                div r12
                cmp rax,r11
                jg addZero
                jmp here

            addZero:inc r8
                    add r13,'0'
                    mov [r8],r13
                    inc r15


              here:  mov rax,r11
                
                inc r8
                mov r13,0
                mov r9,0
                jmp start4
                
                r9is0:
                    cmp r15,0
                    jz this
                    add rax,'0'
                    mov [r8],rax
                    inc r15
                    jmp ext4

            this:    add rax,'0'
                    mov [r8],rax
                    inc r15
                    jmp ext4


    ext4:

    cunt:




    mov  rdx,18                 ; length of string is  bytes
    mov  rsi, qword string2     ; set rsi to pointer to string
    mov  rax, 0x1               ; syscall 1 is write
    mov  rdi, 0x1               ; stdout has a file descriptor of 1
    syscall
    

    
    mov  rdx,r15                 ; length of string is  bytes
    mov  rsi, dword ans     ; set rsi to pointer to string
    mov  rax, 0x1               ; syscall 1 is write
    mov  rdi, 0x1               ; stdout has a file descriptor of 1
    syscall 






      end:  mov rax,60
        xor rdi,rdi
        syscall