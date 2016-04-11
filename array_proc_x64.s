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
	mov r11, [8 + rbp]
	lea r8, [16 + r11]
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
	mov r15, [8 + rbp]
	lea r13, [0 + r15]
	mov [-8 + rbp], r13
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
	
	mov r14, 9
	mov [gint_], r14
	mov r10, 1
	mov [garr_+0], r10
	mov r12, 2
	mov [garr_+8], r12
	mov r9, 3
	mov [garr_+16], r9
	mov r8, 4
	mov [garr_+24], r8
	mov r13, 5
	mov [garr_+32], r13
	mov r14, [32 + garr_]
	push r14
	mov r14, [24 + garr_]
	push r14
	mov r14, [16 + garr_]
	push r14
	mov r14, [8 + garr_]
	push r14
	mov r14, [0 + garr_]
	push r14
	push rbp
	mov rbp, rsp
	sub rsp, 1000000
	call q
	mov rsp, rbp
	pop rbp
	pop r14
	pop r14
	pop r14
	pop r14
	pop r14
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
