section .data
           
    string1 dq  "Please input the shift degree: ",
    string2 dq "Please input the string to encode: "
    string3 dq "Encoded text: "
   
       
section .bss
    input1 resb 10 ; Reserve space for 10 characters
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


         
        mov r9,input2 ;let a reg point to the starting address of string
        mov r10,0     ; this is going to be my loop counter
        mov r12,2     ; we will use this to divide

        ;this start end adds shift to encode
;=========================================================================================================================
Start:
        cmp byte [r9],0 ; test for end line character
        jz end1
         
    ;this code just tests for spaces and symbols 
    ;============================================ 
        cmp byte [r9],32
        jz increment_r9

        cmp byte [r9],33
        jz increment_r9

        cmp byte [r9],44
        jz increment_r9
        
        cmp byte [r9],46
        jz increment_r9

        cmp byte [r9],63
        jz increment_r9
    ;====================================

    xor rax,rax ;cleaning rax because we going to divide
    xor rdx,rdx ;cleaning rdx because we going to divide

    ;here we are going to test if we should shift right or left
    ;===========================================================
        cmp r10,0 ;will shift right for first char
        jz even ; shift right

        mov rax,r10
        div r12

        cmp rdx,1 ; test if there is a remainder from rax/2 (if yes jump to odd)
        jz odd

        jmp even ; if the cmp does not set zero flag it means its even
    ;============================================================

    ;here we have right shift code
    ;====================================
    even:
        cmp byte [r9],97
        jl uppercaseE

      lowercaseE:      ;lower case code
        ;============================================
        add byte [r9], r8b ; adding the shift
        mov al,byte [r9]
        cmp al,127
        jl overE      ;***why does it not jump

        jmp larger127
	
	
	
        larger127: sub byte [r9],122
                  add byte [r9],97
                  jmp increment

        overE:
        
        mov r11,rax
        cmp r11,122
        jle increment

        jmp wrapAround

        wrapAround:sub byte[r9],26
        jmp increment
        ;===================================
      
      uppercaseE:      ;upper case code
        ;============================================
        add byte [r9], r8b ; adding the shift
        mov al,byte [r9]
        
        
        mov r11,rax
        cmp r11,90
        jle increment

        jmp wrapAround2

        wrapAround2:sub byte[r9],26
        jmp increment
        ;===================================

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    ;here we have left shift code
    ;===================================
    odd:
    cmp byte [r9],97
        jl uppercaseO
    lowercaseO:
        sub byte [r9], r8b ; sub the shift
        mov al,byte [r9]
        cmp al,97
        jl lower97      ;***why does it not jump

        jmp overO
	
	
	
        lower97:  sub byte [r9],97
                  add byte [r9],122
                  movsx r11,byte [r9]
                  add r11,r8
                  cmp r11,122
                  jge here

                  jmp increment
                    here:
                  add byte [r9],1  

                  jmp increment

        overO:
        jmp increment

    uppercaseO:

        sub byte [r9], r8b ; sub the shift
        mov al,byte [r9]
        cmp al,65
        jl lower65      ;***why does it not jump

        jmp overO2
	
	
	
        lower65:  sub byte [r9],65
                  add byte [r9],90
                  movsx r11,byte [r9]
                  add r11,r8
                  cmp r11,90
                  jge here2

                  jmp increment
                    here2:
                  add byte [r9],1  

                  jmp increment

        overO2:



    ;===================================

    ;this code increments string pointer and loop counter
    ;====================================================
        increment:  movsx r14,byte [r9] ;debugging line
                    inc r10 ; loop counter
        increment_r9:            
                    inc r9 ; string pointer
                    jmp Start
    ;=====================================================               
end1: 
;==============================================================================================================================


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