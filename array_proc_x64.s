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
	lea r11, [16 + r13]
	mov [-8 + rbp], r11
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
	mov r8, [8 + rbp]
	lea r15, [0 + r8]
	mov [-8 + rbp], r15
	mov r9, [8 + rbp]
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	lea rsi, [24 + r9]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	ret
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r12, 9
	mov [gint_], r12
	mov r10, 1
	mov [garr_ + 0], r10
	mov r14, 2
	mov [garr_ + 8], r14
	mov r11, 3
	mov [garr_ + 16], r11
	mov r15, 4
	mov [garr_ + 24], r15
	mov r12, 5
	mov [garr_ + 32], r12
	mov r10, [garr_]
	push r10
	push rbp
	mov rbp, rsp
	sub rsp, 50000
	call q
	mov rsp, rbp
	pop rbp
	pop r10
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
