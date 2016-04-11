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
	
q:	
	mov r15, [8 + rbp]
	mov [-8 + rbp], r15
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [-8 + rbp]
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
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [8 + rbp]
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
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [8 + rbp]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [-8 + rbp]
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
	ret
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r14, 5
	mov [x_], r14
	mov r11, 7
	push r11
	push rbp
	mov rbp, rsp
	sub rsp, 50000
	call q
	mov rsp, rbp
	pop rbp
	pop r11
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
