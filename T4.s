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
y_:	resb 8
x_:	resb 8
	
	section .text
	
q:	
	mov r13, 3
	mov [-8 + rbp], r13
	mov r13, 1
	cmp r13, rbx
	je C90
C91:	
	mov r13, [-8 + rbp]
	mov [y_], r13
	jmp I23
C90:	
	mov r13, 7
	mov [y_], r13
I23:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [y_]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	cmp rbx, rbx
	je C92
C93:	
	mov r13, [-8 + rbp]
	mov [y_], r13
	jmp I24
C92:	
	mov r13, 7
	mov [y_], r13
I24:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [y_]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	mov r13, 1
	cmp r13, rbx
	je C94
C95:	
	mov r13, [-8 + rbp]
	mov [y_], r13
	jmp I25
C94:	
	mov r13, 7
	mov [y_], r13
I25:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [y_]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	cmp rbx, rbx
	je C96
C97:	
	mov r13, [-8 + rbp]
	mov [y_], r13
	jmp I26
C96:	
	mov r13, 7
	mov [y_], r13
I26:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [y_]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	cmp rbx, rbx
	je C98
C99:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 5
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I27
C98:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 9
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
I27:	
	ret
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r13, 7
	mov [x_], r13
	push rbp
	mov rbp, rsp
	sub rsp, 50000
	call q
	mov rsp, rbp
	pop rbp
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, [x_]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
