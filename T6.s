	extern printf
	extern scanf
	global main
	
	section .data
	
newline:	db "", 10, 0
write_msg:	db "%d", 10, 0
read_msg:	db "Enter an integer: ", 0
read_format:	db "%d", 0
	
	section .bss      ; uninitialized data
	
number:	resb 8
v_:	resb 120
x_:	resb 8
	
	section .text
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r8, 5
	mov [x_], r8
	mov r14, [x_]
	mov r14, r14
	add r14, 3
	mov [x_], r14
	mov r12, [x_]
	mov r12, r12
	add r12, 3
	mov [x_], r12
	mov r9, [x_]
	sub r9, 1
	imul r9, 8
	mov r15, 3
	mov [v_ + r9], r15
	mov r13, [x_]
	sub r13, 1
	imul r13, 8
	mov r11, [x_]
	mov [v_ + r13], r11
	mov r10, [x_]
	sub r10, 1
	imul r10, 8
	mov r8, 1
	mov [v_ + r10], r8
	mov r14, [x_]
	sub r14, 1
	imul r14, 8
	mov r12, 4
	mov [v_ + r14], r12
	mov r15, [x_]
	sub r15, 1
	imul r15, 8
	mov r11, [x_]
	mov [v_ + r15], r11
	mov r8, [x_]
	mov r8, r8
	add r8, 2
	mov [v_ + 16], r8
	mov r12, [x_]
	mov r12, r12
	add r12, 1
	sub r12, 1
	imul r12, 8
	mov r11, [x_]
	mov r11, r11
	imul r11, 2
	mov [v_ + r12], r11
	mov r8, [x_]
	mov r8, r8
	add r8, 1
	sub r8, 1
	imul r8, 8
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [v_ + r8]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [v_ + 88]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [x_]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
