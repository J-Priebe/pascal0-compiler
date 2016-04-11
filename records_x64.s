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
y_:	resb 8
x_:	resb 8
d_:	resb 72
w_:	resb 72
c_:	resb 56
v_:	resb 56
	
	section .text
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r11, 9
	mov [x_], r11
	mov r10, 5
	mov [w_+64], r10
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [w_+64]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	mov r9, 3
	mov [v_+0], r9
	mov r15, [x_]
	mov r15, r15
	sub r15, 8
	sub r15, 1
	imul r15, 8
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	lea rsi, [v_ + r15]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	mov r8, [x_]
	mov rax, r8
	mov r12, 3
	xor rdx, rdx
	idiv r12
	mov r8, rax
	sub r8, 1
	imul r8, 8
	mov r13, 9
	mov [w_+8 + r8], r13
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [w_+8+16]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	push rdi
	mov rdi, newline
	call printf
	pop rdi
	mov r14, 3
	mov [y_], r14
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [w_+64]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [v_+0]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	mov r11, [y_]
	sub r11, 1
	imul r11, 8
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	lea rsi, [w_+8 + r11]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	push rdi
	mov rdi, newline
	call printf
	pop rdi
	mov r10, 7
	mov [v_+48], r10
	mov r9, [y_]
	mov r9, r9
	add r9, 4
	sub r9, 1
	imul r9, 8
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	lea rsi, [v_ + r9]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	mov r12, [y_]
	mov r12, r12
	imul r12, 2
	sub r12, 1
	imul r12, 8
	mov r13, 7
	mov [w_+8 + r12], r13
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [w_+8+40]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	push rdi
	mov rdi, newline
	call printf
	pop rdi
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [v_+48]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [w_+8+40]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
