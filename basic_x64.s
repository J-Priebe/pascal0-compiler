	extern printf
	global main
	section .data
	msg:    db "%d", 10, 0
	msglen: equ $-msg
	
	section .bss      ; uninitialized data
	
x_:	resb 4
	
	section .text
	
main:	
	
	mov r15, 5
	mov [x_], r15
	push rbp
	mov rdi, msg
	mov rsi, [x_]
	call printf
	pop rbp
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
