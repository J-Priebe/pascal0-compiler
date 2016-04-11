section .data
    msg db 'This is a test', 10, 0    ; something stupid here

section .text
    global main
    extern printf

main:
    push    rbp
    mov     rbp, rsp       

    xor     al, al
    lea     rdi, [rel msg]
    call    printf

    mov     rsp, rbp
    pop     rbp
    ret