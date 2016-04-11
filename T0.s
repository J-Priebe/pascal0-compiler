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
	
	section .text
	
main:	
	mov rbx, 0 ; our "zero register"
	
	push rdi
	push rax
	mov rdi, read_msg
	mov rax, 0
	call printf
	pop rax
	pop rdi
	push rdi
	push rsi
	push rax
	mov rdi, read_format
	mov rsi, number
	mov rax, 0
	call scanf
	mov rsi, [number]
	mov [x_], rsi
	pop rax
	pop rsi
	pop rdi
	mov r15, 3
	mov r14, [x_]
	mov r15, r15
	imul r15, r14
	mov [x_], r15
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
	push rdi
	push rax
	mov rdi, newline
	mov rax, 0
	call printf
	push rax
	pop rdi
	push rdi
	push rax
	mov rdi, newline
	mov rax, 0
	call printf
	push rax
	pop rdi
	mov r11, [x_]
	mov r11, r11
	imul r11, 5
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, r11
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
