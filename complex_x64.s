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
x_:	resb 8
w_:	resb 72
v_:	resb 56
	
	section .text
	
q:	
	mov r13, 3
	mov [-8 + rbp], r13
	mov r13, [8 + rbp]
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	lea rsi, [64 + r13]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	mov r11, [8 + rbp]
	mov r8, [-8 + rbp]
	sub r8, 1
	imul r8, 8
	add r8, r11
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	lea rsi, [8 + r8]
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
	mov r15, [8 + rbp]
	mov r9, [-8 + rbp]
	mov r9, r9
	imul r9, 2
	sub r9, 1
	imul r9, 8
	add r9, r15
	mov r12, 7
	mov [8 + r9], r12
	mov r10, [8 + rbp]
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	lea rsi, [48 + r10]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	ret
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r14, 9
	mov [x_], r14
	mov r11, 5
	mov [w_+64], r11
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
	mov r15, 3
	mov [v_ + 0], r15
	mov r12, [x_]
	mov r12, r12
	sub r12, 8
	sub r12, 1
	imul r12, 8
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [v_ + r12]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	mov r14, [x_]
	mov rax, r14
	mov r11, 3
	xor rdx, rdx
	idiv r11
	mov r14, rax
	sub r14, 1
	imul r14, 8
	mov r15, 9
	mov [w_+8 + r14], r15
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
	mov r12, [w_]
	push r12
	push rbp
	mov rbp, rsp
	sub rsp, 50000
	call q
	mov rsp, rbp
	pop rbp
	pop r12
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
