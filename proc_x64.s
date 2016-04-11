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
xy_:	resb 8
xx_:	resb 8
	
	section .text
	
q:	
	mov r8, [16 + rbp]
	lea r14, [0 + r8]
	mov [-8 + rbp], r14
	mov r12, [8 + rbp]
	lea r9, [0 + r12]
	mov [-16 + rbp], r9
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
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [-16 + rbp]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	ret
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r15, 1
	mov [xx_], r15
	mov r13, 2
	mov [xy_], r13
	mov r11, [xx_]
	push r11
	mov r10, [xy_]
	push r10
	push rbp
	mov rbp, rsp
	sub rsp, 50000
	call q
	mov rsp, rbp
	pop rbp
	pop r10
	pop r11
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
