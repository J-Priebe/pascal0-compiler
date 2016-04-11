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
	mov r13, [8 + rbp]
	lea r8, [16 + r13]
	mov [-8 + rbp], r8
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
	mov r10, [8 + rbp]
	lea r15, [0 + r10]
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
	ret
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r9, 9
	mov [gint_], r9
	mov r12, 1
	mov [garr_ + 0], r12
	mov r14, 2
	mov [garr_ + 8], r14
	mov r11, 3
	mov [garr_ + 16], r11
	mov r8, 4
	mov [garr_ + 24], r8
	mov r15, 5
	mov [garr_ + 32], r15
	mov r9, [garr_]
	push r9
	push rbp
	mov rbp, rsp
	sub rsp, 50000
	call q
	mov rsp, rbp
	pop rbp
	pop r9
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
