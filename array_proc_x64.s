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
	mov r8, [8 + rbp]
	lea r14, [16 + r8]
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
	mov r12, [8 + rbp]
	lea r9, [0 + r12]
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
	
	mov r15, 9
	mov [gint_], r15
	mov r13, 1
	mov [garr_ + 0], r13
	mov r11, 2
	mov [garr_ + 8], r11
	mov r10, 3
	mov [garr_ + 16], r10
	mov r14, 4
	mov [garr_ + 24], r14
	mov r9, 5
	mov [garr_ + 32], r9
	mov r15, [32 + garr_]
	push r15
	mov r15, [24 + garr_]
	push r15
	mov r15, [16 + garr_]
	push r15
	mov r15, [8 + garr_]
	push r15
	mov r15, [0 + garr_]
	push r15
	push rbp
	mov rbp, rsp
	sub rsp, 50000
	call q
	mov rsp, rbp
	pop rbp
	pop r15
	pop r15
	pop r15
	pop r15
	pop r15
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
