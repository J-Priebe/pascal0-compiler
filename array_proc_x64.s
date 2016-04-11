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
gint_:	resb 8
garr_:	resb 40
	
	section .text
	
q:	
	mov r15, [8 + rbp]
	lea r14, [16 + r15]
	mov [-8 + rbp], r14
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
	mov r11, [8 + rbp]
	lea r9, [0 + r11]
	mov [-8 + rbp], r9
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
	ret
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r8, 9
	mov [gint_], r8
	mov r13, 1
	mov [garr_ + 0], r13
	mov r12, 2
	mov [garr_ + 8], r12
	mov r10, 3
	mov [garr_ + 16], r10
	mov r14, 4
	mov [garr_ + 24], r14
	mov r9, 5
	mov [garr_ + 32], r9
	mov r8, [garr_]
	push r8
	push rbp
	mov rbp, rsp
	sub rsp, 50000
	call q
	mov rsp, rbp
	pop rbp
	pop r8
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
