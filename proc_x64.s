	extern printf
	global main
	
	section .data
	
msg:	db "%d", 10, 0
	
	section .bss      ; uninitialized data
	
x_:	resb 8
	
	section .text
	
q:	
	mov r15, [16 + rsp]
	lea r11, [0 + r15]
	mov [-8 + rsp], r11
	mov r15, [8 + rsp]
	lea r11, [0 + r15]
	mov [-16 + rsp], r11
	mov r15, [8 + rsp]
	mov r11, [8 + rsp]
	lea r14, [0 + r15]
	lea r15, [0 + r11]
	mov r14, r14
	mov rax, r14
	xor rdx, rdx
	idiv r15
	mov r14, rdx
	push rdi
	push rsi
	push rax
	mov rdi, msg
	mov rsi, r14
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	ret
	
main:	
	
	mov r15, 9
	mov [x_], r15
	mov r15, [x_]
	push r15
	mov r15, [x_]
	push r15
	call q
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
