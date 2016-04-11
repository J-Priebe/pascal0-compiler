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
	
	mov r15, 4
	mov [y_], r15
	mov r11, 101
	mov [z_], r11
	mov r13, [y_]
	sub r13, 1
	imul r13, 8
	mov r14, [z_]
	mov [v_ + r13], r14
	mov r10, [y_]
	sub r10, 1
	imul r10, 8
	push rdi
	push rsi
	push rax
	mov rdi, msg
	mov rsi, [v_ + r10]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
