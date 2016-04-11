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
	mov r14, 101
	mov [z_], r14
	lea r13, [y_]
	sub r13, 1
	imul r13, 8
	lea r10, [z_]
	mov [v_ + r13], r10
	lea r11, [y_]
	sub r11, 1
	imul r11, 8
	push rdi
	push rsi
	push rax
	mov rdi, msg
	lea rsi, [v_ + r11]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
