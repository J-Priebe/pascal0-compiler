	extern printf
	global main
	
	section .data
	
msg:	db "%d", 10, 0
	
	section .bss      ; uninitialized data
	
x_:	resb 4
	
	section .text
	
q:
	add [x_], dword 5	
	mov rax, 0
	ret
	
main:	
	
	mov [x_], dword 5
	call q
	mov rdi, msg
	mov rsi, [x_]
	mov rax, 0
	call printf
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
