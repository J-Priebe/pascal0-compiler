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
g_:	resb 8
	
	section .text
	
q:	
	mov r13, 9
	mov [-8 + rbp], r13
	mov r13, [-8 + rbp]
	mov r8, [8 + rbp]
	cmp r13, r8
	jle C0
C1:	
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
	jmp I0
C0:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [g_]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
I0:	
	ret
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r13, 5
	mov [g_], r13
	mov r13, 7
	push r13
	push rbp
	mov rbp, rsp
	sub rsp, 50000
	call q
	mov rsp, rbp
	pop rbp
	pop r13
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
