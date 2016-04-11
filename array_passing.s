;nasm -f elf64 array_passing.s && gcc -m64 -o array-pass-test array_passing.o


section .data
    array:  dq 1, 2
    arrayLen: dq 2

section .text
global main

main:
    push qword array
    push qword [arrayLen]
    call reverse
    add rsp, 16


reverse:
    push rbp        ; setup stack
    mov rbp, rsp
    sub rsp, 0x80       ; 128 bytes of local stack space

    ; put parameters into registers
    ;mov rbx, [rbp + 16]           ; array
    ;mov rdi, [rbp + 8]            ; len

    ; set up loop
    mov rcx, 0

; push all the values onto the stack
.loopPush:
    mov rax, 8
    mul rcx
    push qword [rbx + rax]
    inc rcx
    cmp rcx, rdi
    jl .loopPush
    mov rcx, 0

; pop all the values from the stack
.loopPop:
    mov rax, 8
    mul rcx
    pop qword [ebx + eax]
    inc rcx
    cmp rcx, rdi
    jl .loopPop


.end:
    mov rsp,rbp ; undo "sub esp,0x40" above                                                                     
    pop rbp
    mov rax, rbx    ; return the reversed array
    ret