extern printf
global main

    
    section .data
    
msg:    db "%d", 10, 0

    section .text

main:
    
    mov   rax,   3
    mov   rbx,   5
    call  _Add_Two_Things
    ; Result in eax

    ;write
    mov rdi, msg
    mov rsi, rax
    mov rax, 0
    call printf

    ;exit
    ret

_Add_Two_Things:  ; Into eax
    add   rax,   rbx
    ret

; genwrite
;   putInstr('mov rdi, msg')
;   loadItemReg(x, 'rsi')
;   putInstr('mov rax, 0')
;   putInstr('call printf')
