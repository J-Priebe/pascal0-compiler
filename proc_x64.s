	extern printf
	global main
	
	section .data
	
msg:	db "%d", 10, 0
	
	section .bss      ; uninitialized data
	
x_:	resb 8
	
	section .text
	
q:	
	mov r9, [16 + rsp]
	lea r10, [0 + r9]
	mov [-8 + rsp], r10
	mov r13, [8 + rsp]
	lea r15, [0 + r13]
	mov [-16 + rsp], r15
	mov r14, [8 + rsp]
	mov r12, [8 + rsp]
	lea r11, [0 + r14]
	lea r8, [0 + r12]
	mov r11, r11
	mov rax, r11
	xor rdx, rdx
	idiv r8
	mov r11, rax
	mov rdi, msg
	mov rsi, r11
	mov rax, 0
	call printf
	ret
	
main:	
	
	mov r9, 9
	mov [x_], r9
	mov r10, [x_]
	push r10
	mov r13, [x_]
	push r13
	call q
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
