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
	
	mov r13, 9
	mov [x_], r13
	mov r13, 5
	mov [w_+64], r13
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
	mov r13, 3
	mov [v_ + 0], r13
	mov r13, [x_]
	mov r13, r13
	sub r13, 8
	sub r13, 1
	imul r13, 8
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [v_ + r13]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	mov r13, [x_]
	mov rax, r13
	mov r8, 3
	xor rdx, rdx
	idiv r8
	mov r13, rax
	sub r13, 1
	imul r13, 8
	mov r10, 9
	mov [w_+8 + r13], r10
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [w_+8 + 16]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	push rdi
	push rax
	mov rdi, newline
	mov rax, 0
	call printf
	pop rax
	pop rdi
	mov r15, 3
	mov [y_], r15
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
	mov rsi, [v_ + 0]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	mov r9, [y_]
	sub r9, 1
	imul r9, 8
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [w_+8 + r9]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	push rdi
	push rax
	mov rdi, newline
	mov rax, 0
	call printf
	pop rax
	pop rdi
	mov r12, 7
	mov [v_ + 48], r12
	mov r14, [y_]
	mov r14, r14
	add r14, 4
	sub r14, 1
	imul r14, 8
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [v_ + r14]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	mov r11, [y_]
	mov r11, r11
	imul r11, 2
	sub r11, 1
	imul r11, 8
	mov r8, 7
	mov [w_+8 + r11], r8
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [w_+8 + 40]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	push rdi
	push rax
	mov rdi, newline
	mov rax, 0
	call printf
	pop rax
	pop rdi
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [v_ + 48]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [w_+8 + 40]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
