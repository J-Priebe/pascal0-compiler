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
	
	mov r11, 5
	mov [x_], r11
	mov r11, [x_]
	mov r11, r11
	add r11, 3
	mov [x_], r11
	mov r11, [x_]
	mov r11, r11
	add r11, 3
	mov [x_], r11
	mov r11, [x_]
	sub r11, 1
	imul r11, 8
	mov r8, 3
	mov [v_ + r11], r8
	mov r15, [x_]
	sub r15, 1
	imul r15, 8
	mov r13, [x_]
	mov [v_ + r15], r13
	mov r14, [x_]
	sub r14, 1
	imul r14, 8
	mov r10, 1
	mov [v_ + r14], r10
	mov r12, [x_]
	sub r12, 1
	imul r12, 8
	mov r9, 4
	mov [v_ + r12], r9
	mov r8, [x_]
	sub r8, 1
	imul r8, 8
	mov r13, [x_]
	mov [v_ + r8], r13
	mov r10, [x_]
	mov r10, r10
	add r10, 2
	mov [v_+16], r10
	mov r9, [x_]
	mov r9, r9
	add r9, 1
	sub r9, 1
	imul r9, 8
	mov r13, [x_]
	mov r13, r13
	imul r13, 2
	mov [v_ + r9], r13
	mov r10, [x_]
	mov r10, r10
	add r10, 1
	sub r10, 1
	imul r10, 8
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	lea rsi, [v_ + r10]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [v_+88]
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
