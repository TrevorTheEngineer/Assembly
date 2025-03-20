; isPractice = Instruction Set Practice

; Define data section (variables)
section .data

    ; Define constants
    EXIT_SUCCESS    equ     0                   ; successful operation
    SYS_EXIT        equ     60                  ; call code for terminate

    ; Variable declarations
    byVar1          db      9
    qwVariable1     dq      54345
    qwVariable2     dq      0
    qwVariable3     dq      3
    byResult        db      0

; Define text section (instructions)
section .text  

    ; Define program entry
    global _start

    _start:

        ; mov - move data
        mov     al,     245                     ; 8 bits    byte
        mov     ax,     25400                  ; 16 bits   word
        mov     eax,    25400000                ; 32 bits   dword
        mov     rax,    2540000000              ; 64 bits   qword
        mov     rax,    qword [qwVariable1]     ; rax = 54345
        mov     qword [qwVariable2],    rax     ; qwVariable = 54345
    _mov:  

        ; lea - load effective address
        mov     rax,    qword [qwVariable3]     ; rax = 3
        lea     rax,    qword [qwVariable3]     ; rax = address
    _lea:

        ; inc - increment
        inc     al                              ; al = 246
        inc     byte [byVar1]                   ; byVar1 = 10
    _inc:

        ; add - addition
        add     al,     byte [byVar1]           ; al = 1 / rFlag = 1
        mov     byte [byResult],    al          ; store al in memory
    _add:

        ; adc - addition including carry bit
        adc     cl,     0                       ; cl = 1
        mov     byte [byResult],    cl          ; store cl in memory
    _adc:

        ; sub - subtraction
        sub     al,     cl                      ; al = 0
        mov     byte [byResult],    al          ; store al in memory
    _sub:

        ; dec - decrement
        dec     cl                              ; cl = 0
        mov     byte [byResult],    cl          ; store cl in memory
    _dec:


    _last:
        mov     rax,    SYS_EXIT                ; Call code for exit
        mov     rdi,    EXIT_SUCCESS            ; Exit program with success
        syscall





    
    
