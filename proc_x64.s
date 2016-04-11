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
x_:	resb 8
	
	section .text
	
q:	
	;mov r13, [16 + rsp]
	;mov r14, [0 + r13]
	;mov [-8 + rsp], r14
	;mov r11, [8 + rsp]
	;mov r10, [0 + r11]
	;mov [-16 + rsp], r10
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	lea rsi, [-16 + rsp]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	ret
	
main:	
	mov rbx, 0 ; our "zero register"
	
	;mov r12, 9
	;mov [x_], r12
	;mov r8, [x_]
	;push r8
	;mov r15, [x_]
	;push r15
	push rbp
	mov rbp, rsp
	mov rdi, 30
	call q
	mov rsp, rbp
	pop rbp
	
	ret
	;mov rax, 60   ;exit call
	;mov rdi, 0    ;return code 0
	;syscall
