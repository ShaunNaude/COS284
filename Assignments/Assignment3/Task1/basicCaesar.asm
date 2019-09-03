
section .data
           ; Reserve space for 10 characters
    string1 dq  "Please input the shift degree: ",
    string2 dq "Please input the string to encode: "
    string3 dq "Encoded text: "
   
   ; input1 db  ""
   ; something db "here"
   ; input2 db ""
       
section .bss
    input1 resb 10
    input2 resb 10
section .text

    global _start

    _start:
        ;ask for shift
        mov  rdx,31                 
        mov  rsi, qword string1     
        mov  rax, 0x1               
        mov  rdi, 0x1              
        syscall                    


        mov  rdx,3              
        mov  rsi, input1     
        mov  rax, 0x0               
        mov  rdi, 0x0               
        syscall  
        
        mov r10,rax ; this stores the lenght of shift

        ;ask for string
        mov  rdx,35                 
        mov  rsi, qword string2     
        mov  rax, 0x1               
        mov  rdi, 0x1               
        syscall                     


        mov  rdx,132              
        mov  rsi, input2     
        mov  rax, 0x0               
        mov  rdi, 0x0               
        syscall  
         ; r15 will store the length of the input string
        mov r15,rax



        ;getting shift values and making it int
        ;============================================================================
         cmp r10,2
         jg doubleDigit

         ;this code executes if its a single digit
         movsx r8 , byte [input1]
         sub r8,'0'
         jmp singleDigit

         doubleDigit: movsx r8 , byte [input1]
                      movsx   r9 , byte [input1+1]
                      sub   r8 , '0'
                      sub   r9 , '0'
                      mov rax,10
                      mul r8
                      mov r8,rax
                      add r8,r9
                      xor r9,r9 ; clearing r9
                      xor r10,r10 ; clearing r10
        ;=============================================================================
        singleDigit:

        ;let a reg point to the starting address of string
        mov r9,input2

        ;this start end adds shift to encode
        ;=============================================================================
        Start:
        cmp byte [r9],0 ; test for end line character
        jz end1
        
        cmp byte [r9],32
        jz increment

        add byte [r9], r8b ; adding the shift
        mov al,byte [r9]
        cmp al,127
        jl over      ;***why does it not jump

        jmp larger127
	
	
	
        larger127: sub byte [r9],122
                  add byte [r9],97
                  jmp increment

        over:

        cmp byte [r9],122
        jg wrapAround

        jmp increment

        wrapAround:sub byte[r9],26
        jmp increment


        increment:  movsx r14,byte [r9] ;debugging line
                    add r9,1
                    jmp Start
                    



        end1: 
        ;=====================================================================================

        ; display code
        ;===============================
        mov  rdx,14                 
        mov  rsi, qword string3     
        mov  rax, 0x1               
        mov  rdi, 0x1              
        syscall 

        sub r15,1
        mov  rdx,r15                
        mov  rsi, dword input2     
        mov  rax, 0x1               
        mov  rdi, 0x1               
        syscall
        ;============================


  






      end:  mov rax,60
        xor rdi,rdi
        syscall