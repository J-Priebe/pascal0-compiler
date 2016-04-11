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
v_:	resb 120
z_:	resb 8
y_:	resb 8
x_:	resb 8
	
	section .text
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r15, 4
	mov [y_], r15
	mov r14, 101
	mov [z_], r14
	mov r11, [y_]
	sub r11, 1
	imul r11, 8
	mov r9, [z_]
	mov [v_ + r11], r9
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
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
