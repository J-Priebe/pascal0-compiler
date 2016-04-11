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
	lea r10, [16 + r11]
	mov [-8 + rbp], r10
	mov r9, [8 + rbp]
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	lea rsi, [16 + r9]
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	ret
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r15, 9
	mov [gint_], r15
	mov r8, 1
	mov [garr_+0], r8
	mov r12, 2
	mov [garr_+8], r12
	mov r13, 3
	mov [garr_+16], r13
	mov r14, 4
	mov [garr_+24], r14
	mov r10, 5
	mov [garr_+32], r10
	mov r15, [gint_]
	push r15
	mov r8, [garr_]
	push r8
	push rbp
	mov rbp, rsp
	sub rsp, 1000000
	call q
	mov rsp, rbp
	pop rbp
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
