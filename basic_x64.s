	extern printf
	global main
	
	section .data
	
msg:	db "%d", 10, 0
	
	section .bss      ; uninitialized data
	
v_:	resb 120
z_:	resb 8
y_:	resb 8
x_:	resb 8
	
	section .text
	
main:	
	
	mov r9, 4
	mov [y_], r9
	mov r10, 101
	mov [z_], r10
	lea r13, [y_]
	sub r13, 1
	imul r13, 8
	lea r15, [z_]
	mov [v_ + r13], r15
	lea r14, [y_]
	sub r14, 1
	imul r14, 8
	mov rdi, msg
	lea rsi, [v_ + r14]
	mov rax, 0
	call printf
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
