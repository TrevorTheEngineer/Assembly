;***********************************************************************************
; isPractice = Instruction Set Practice - by Trevor Kopcza 2025
;***********************************************************************************

section .data                                   ; Define data section (variables)

                                                ; Define constants
    EXIT_SUCCESS    equ     0                   ; successful operation
    SYS_exit        equ     60                  ; call code for terminate

                                                ; Variable declarations
    bVar1           db      9                   ; byte      8-bits
    bVar2           db      2                   ; byte      8-bits
    bResult         db      0                   ; byte      8-bits
    wVar1           dw      500                 ; word      16-bits
    wVar2           dw      750                 ; word      16-bits
    wResult         dw      0                   ; word      16-bits
    wRemain         dw      0                   ; word      16-bits
    dVar1           dd      70000               ; dword     32-bits
    dVar2           dd      10000               ; dword     32-bits
    dResult         dd      0                   ; dword     32-bits
    dRemain         dd      0                   ; dword     32-bits
    qVar1           dq      54345               ; qword     64-bits
    qVar2           dq      0                   ; qword     64-bits
    qVar3           dq      3                   ; qword     64-bits
    qResult         dq      0                   ; qword     64-bits
    
section .text                                   ; Define text section (instructions)
    
    global _start                               ; Define program entry label

    _start:                                     ; entry label
    mov_Example:                                ; mov - move data   
        mov     al,     245                     ; 8 bits    byte
        mov     ax,     25400                   ; 16 bits   word
        mov     eax,    25400000                ; 32 bits   dword
        mov     rax,    2540000000              ; 64 bits   qword
        mov     rax,    qword [qVar1]           ; rax = 54345
        mov     qword [qVar2],    rax           ; qwVariable = 54345
      
    lea_Example:                                ; lea - load effective address     
        mov     rax,    qword [qVar3]           ; rax = 3
        lea     rax,    qword [qVar3]           ; rax = address
    
    inc_Example:                                ; inc - increment 
        inc     al                              ; al = 246
        inc     byte [bVar1]                    ; byVar1 = 10

    add_Example:                                ; add - addition
        add     al,     byte [bVar1]            ; al = 1 / rFlag = 1
        mov     byte [bResult],    al           ; store al in memory
 
    adc_Example:                                ; adc - addition including carry bit
        adc     cl,     0                       ; cl = 1
        mov     byte [bResult],    cl           ; store cl in memory

    sub_Example:                                ; sub - subtraction
        sub     al,     cl                      ; al = 0
        mov     byte [bResult],    al           ; store al in memory

    dec_Example:                                ; dec - decrement
        dec     cl                              ; cl = 0
        mov     byte [bResult],    cl           ; store cl in memory

    mul_Example:                                ; mul - unsigned multiplication (widens)
        mov     ax,     0                       ; zero ax
        mov     al,     byte [bVar1]            ; move 10 into al
        mul     byte [bVar2]                    ; 10 x 2 = 20 -> ax
        mov     word [wResult],     ax          ; save ax
    
    imul_Example:                               ; mul - signed multiplication (overwrites)
        mov     ax,     word [wVar1]            ; ax = 500
        imul    ax,     -10                     ; 500 x -10 = -5000 -> ax
        mov     word [wResult],     ax          ; save ax

    div_Example:                                ; div - unsigned division (dividend/divisor -> quotient & remainder)
        mov     dx,     0                       ; clear MSB word of double in dx
        mov     ax,     word [wVar2]            ; ax = 750
        mov     bx,     75                      ; bx = 75
        div     bx                              ; 750 / 75 = 10 -> ax and dx
        mov     word [wResult],     ax          ; store quotient
        mov     word [wRemain],     dx          ; store remainder

    idiv_Example:                               ; idiv - signed division
        mov     eax,    [dVar1]                 ; set eax to 70000
        cdq                                     ; signed widening dword to qword -> edx:eax
        idiv    dword [dVar2]                   ; signed division by 10000
        mov     dword [dResult],    eax         ; store quotient
        mov     dword [dRemain],    edx         ; store remainder

    shl_Example:                                ; shl - logical shift left
        mov     al,     5                       ; set al to 5
        shl     al,     2                       ; shift al left by 2 bits (unsigned multiply by 2^2)
        mov     byte [bResult],     al          ; al = 20

    shr_Example:                                ; shr - logical shift right
        shr     al,     2                       ; shift al right by 2 bits (unsigned divide by 2^2)
        mov     byte [bResult],     al          ; al = 5

    sal_Example:                                ; sal - arithmetic shift left
        sal     al,     2                       ; shift al left by 2 bits (fill zero)

    sar_Example:                                ; sar - arithmetic shift right
        sar     al,     2                       ; shift al right by 2 bits (copy sign bit)

    rol_Example:                                ; rol = rotate left
        rol     al,     5                       ; rotate al left by 5 bits
    
    ror_Example:                                ; ror - rotate right
        ror     al,     5                       ; rotate al right by 5 bits

    jmp_Example:                                ; jmp - unconditional jump
        jmp     cmp_Example                     ; jump to next label

    cmp_Example:                                ; cmp - comparison before conditional jump
        cmp     al,     0                       ; compare al to 0
    
    je_Example:                                 ; je - jump
        je      jumpEqual                       ; jump if equal
    
    jne_Example:                                ; jne - jump        
        jne     jumpNotEqual                    ; jump if not equal
    
    jl_Example:                                 ; jl - jump   
        jl      jumpLess                        ; signed jump if <
    
    jle_Example:                                ; jle - jump  
        jle     jumpLessOrEqual                 ; signed jump if <=
    
    jg_Example:                                 ; jg - jump  
        jg      jumpGreater                     ; signed jump if >
    
    jge_Example:                                ; jge - jump       
        jge     jumpGreaterEqual                ; signed jump if >=
    
    jb_Example:                                 ; jb - jump  
        jb      jumpBelow                       ; unsigned jump if <
    
    jbe_Example:                                ; jbe - jump  
        jbe     jumpBelowEqual                  ; unsigned jump if <=
    
    ja_Example:                                 ; ja - jump  
        ja      jumpAbove                       ; unsigned jump if >
    
    jae_Example:                                ; jae - jump  
        jae     jumpAboveEqual                  ; unsigned jump if >=

    loop_Example:                               ; loop - dec rcx, cmp rcx to 0, jne
        mov     rax,    0                       ; set rax to 0
        mov     rcx,    5                       ; set loop counter to 5
        inc     rax                             ; increment rax to count loops
        loop    rcx                             ; dec rcx, cmp rcx to 0, jne     

    last:
        mov     rax,    SYS_exit                ; Call code for exit
        mov     rdi,    EXIT_SUCCESS            ; Exit program with success
        syscall





    
    
