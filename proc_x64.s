	extern printf
	global main
	
	section .data
	
msg:	db "%d", 10, 0
	
	section .bss      ; uninitialized data
	
x_:	resb 8
	
	section .text
	
q:	
	mov r9, [16 + rsp]
	lea r14, [0 + r9]
	mov [-8 + rsp], r14
	mov r13, [8 + rsp]
	lea r10, [0 + r13]
	mov [-16 + rsp], r10
	mov r11, [8 + rsp]
	mov r15, [8 + rsp]
	lea r12, [0 + r11]
	lea r8, [0 + r15]
	mov r12, r12
	mov rax, r12
	xor rdx, rdx
	idiv r8
	mov r12, rdx
	push rdi
	push rsi
	push rax
	mov rdi, msg
	mov rsi, r12
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	ret
	
main:	
	
	mov r9, 9
	mov [x_], r9
	mov r14, [x_]
	push r14
	mov r13, [x_]
	push r13
	call q
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall