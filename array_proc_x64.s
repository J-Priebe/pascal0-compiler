	extern printf
	global main
	
	section .data
	
msg:	db "%d", 10, 0
	
	section .bss      ; uninitialized data
	
gint_:	resb 8
garr_:	resb 40
	
	section .text
	
q:	
	mov r9, [8 + rsp]
	lea r14, [16 + r9]
	mov [-8 + rsp], r14
	mov r13, [8 + rsp]
	push rdi
	push rsi
	push rax
	mov rdi, msg
	lea rsi, [8 + r13]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	ret
	
main:	
	
	mov r10, 9
	mov [gint_], r10
	mov r11, 1
	mov [garr_+0], r11
	mov r15, 2
	mov [garr_+8], r15
	mov r12, 3
	mov [garr_+16], r12
	mov r8, 4
	mov [garr_+24], r8
	mov r9, 5
	mov [garr_+32], r9
	mov r14, [gint_]
	push r14
	mov r13, [garr_]
	push r13
	call q
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
