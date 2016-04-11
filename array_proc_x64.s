	extern printf
	global main
	
	section .data
	
msg:	db "%d", 10, 0
	
	section .bss      ; uninitialized data
	
gint_:	resb 8
garr_:	resb 40
	
	section .text
	
q:	
	mov r15, [8 + rsp]
	lea r11, [16 + r15]
	mov [-8 + rsp], r11
	mov r15, [8 + rsp]
	push rdi
	push rsi
	push rax
	mov rdi, msg
	lea rsi, [8 + r15]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	ret
	
main:	
	
	mov r15, 9
	mov [gint_], r15
	mov r15, 1
	mov [garr_+0], r15
	mov r15, 2
	mov [garr_+8], r15
	mov r15, 3
	mov [garr_+16], r15
	mov r15, 4
	mov [garr_+24], r15
	mov r15, 5
	mov [garr_+32], r15
	mov r15, [gint_]
	push r15
	mov r15, [garr_]
	push r15
	call q
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
