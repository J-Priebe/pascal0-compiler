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
	mov r15, [16 + rbp]
	;lea r12, [16 + r15]
	mov [-8 + rbp], r12
	mov r8, [8 + rbp]
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, r15
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	ret
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r10, 9
	mov [gint_], r10
	mov r13, 1
	mov [garr_+0], r13
	mov r11, 2
	mov [garr_+8], r11
	mov r9, 3
	mov [garr_+16], r9
	mov r14, 4
	mov [garr_+24], r14
	mov r12, 5
	mov [garr_+32], r12
	push qword [garr_+32]
	push qword [garr_+24]
	push qword [garr_+16]
	push qword [garr_+8]
	push qword [garr_+0]
	push rbp
	mov rbp, rsp
	sub rsp, 1000000
	call q
	mov rsp, rbp
	pop rbp
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
