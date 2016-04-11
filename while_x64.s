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
	mov r15, 101
	mov [z_], r15
	mov r15, [y_]
	sub r15, 1
	imul r15, 8
	mov r11, [z_]
	mov [v_ + r15], r11
	mov r14, [y_]
	sub r14, 1
	imul r14, 8
	push rdi
	push rsi
	push rax
	mov rdi, msg
	lea rsi, [v_ + r14]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
