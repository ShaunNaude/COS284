section .data
              
section .bss


section .text
GLOBAL funct

        funct:
            ;start function
        ;=================
            push rbp
            mov rbp,rsp
        ;==================
            sub rsp, 16
        N   equ 0
        nM1 equ 8
        
        mov rax, 2         ;base case return value
        cmp rdi, 1
        jz .end     ;first parameter<2 (base case)
        
        mov rax,1
        cmp rdi,0
        jz .end
        
               
        dec rdi            ;recall rdi is the first parameter (n)
        mov [rsp+N], rdi   ;save N-1
        call funct

        mov r12,[rsp+N] ;

        mov [rsp+nM1], rax
        mov rdi, [rsp+N]   ;load N-1
        dec rdi
;--------------------
        mov r13,rax
        mov rax,rdi
        mov r12,[rsp+nM1]
        mul r12
        mov [rsp+nM1],rax
;-----------------------------
        mov rax,r13
        



        call funct

        mov r13,[rsp+nM1]

        sub rax, [rsp+nM1]
        .end:



        ;end function
         ;=================
            mov rsp,rbp
            pop rbp
            ret
        ;===============