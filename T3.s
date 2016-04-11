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
f_:	resb 8
t_:	resb 8
b_:	resb 8
z_:	resb 8
y_:	resb 8
x_:	resb 8
	
	section .text
	
main:	
	mov rbx, 0 ; our "zero register"
	
	mov r13, 7
	mov [x_], r13
	mov r13, 9
	mov [y_], r13
	mov r13, 11
	mov [z_], r13
	mov r13, 1
	mov [t_], r13
	mov [f_], rbx
	mov r13, 1
	cmp r13, rbx
	je C2
C3:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 7
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I1
C2:	
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
I1:	
	cmp rbx, rbx
	je C4
C5:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 7
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I2
C4:	
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
I2:	
	mov r13, [t_]
	cmp r13, rbx
	je C6
C7:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 7
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I3
C6:	
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
I3:	
	mov r13, [f_]
	cmp r13, rbx
	je C8
C9:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 7
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I4
C8:	
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
I4:	
	mov r13, [t_]
	cmp r13, rbx
	jne C11
C10:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 7
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I5
C11:	
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
I5:	
	mov r13, [f_]
	cmp r13, rbx
	jne C13
C12:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 7
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I6
C13:	
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
I6:	
	mov r13, [t_]
	cmp r13, rbx
	jne C15
C14:	
	mov r13, [t_]
	cmp r13, rbx
	je C16
C17:
C15:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 7
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I7
C16:	
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
I7:	
	mov r13, [t_]
	cmp r13, rbx
	jne C19
C18:	
	mov r13, [f_]
	cmp r13, rbx
	je C20
C21:
C19:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 7
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I8
C20:	
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
I8:	
	mov r13, [f_]
	cmp r13, rbx
	jne C23
C22:	
	mov r13, [t_]
	cmp r13, rbx
	je C24
C25:
C23:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 7
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I9
C24:	
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
I9:	
	mov r13, [f_]
	cmp r13, rbx
	jne C27
C26:	
	mov r13, [f_]
	cmp r13, rbx
	je C28
C29:
C27:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 7
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I10
C28:	
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
I10:	
	mov r13, [t_]
	cmp r13, rbx
	je C30
C31:	
	mov r13, [t_]
	cmp r13, rbx
	je C32
C33:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 7
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I11
C32:
C30:	
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
I11:	
	mov r13, [t_]
	cmp r13, rbx
	je C34
C35:	
	mov r13, [f_]
	cmp r13, rbx
	je C36
C37:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 7
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I12
C36:
C34:	
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
I12:	
	mov r13, [f_]
	cmp r13, rbx
	je C38
C39:	
	mov r13, [t_]
	cmp r13, rbx
	je C40
C41:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 7
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I13
C40:
C38:	
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
I13:	
	mov r13, [f_]
	cmp r13, rbx
	je C42
C43:	
	mov r13, [f_]
	cmp r13, rbx
	je C44
C45:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 7
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I14
C44:
C42:	
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
I14:	
	push rdi
	push rax
	mov rdi, newline
	mov rax, 0
	call printf
	pop rax
	pop rdi
	mov r13, 1
	mov [b_], r13
	mov r13, [b_]
	cmp r13, rbx
	je C46
C47:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 3
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I15
C46:	
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
I15:	
	mov [b_], rbx
	mov r13, [b_]
	cmp r13, rbx
	je C48
C49:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 3
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I16
C48:	
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
I16:	
	mov r13, [x_]
	mov r8, [y_]
	cmp r13, r8
	jge C50
C51:	
	mov r13, 1
	jmp A0
C50:	
	mov r13, 0
A0:	
	mov [b_], r13
	mov r13, [b_]
	cmp r13, rbx
	je C52
C53:	
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
	jmp I17
C52:	
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
I17:	
	mov r13, [x_]
	mov r8, [y_]
	cmp r13, r8
	jg C55
C54:	
	mov r13, [t_]
	cmp r13, rbx
	je C56
C57:
C55:	
	mov r13, 1
	jmp A1
C56:	
	mov r13, 0
A1:	
	mov [b_], r13
	mov r13, [b_]
	cmp r13, rbx
	je C58
C59:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 3
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I18
C58:	
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
I18:	
	mov r13, [x_]
	mov r8, [y_]
	cmp r13, r8
	jg C61
C60:	
	mov r13, [f_]
	cmp r13, rbx
	je C62
C63:
C61:	
	mov r13, 1
	jmp A2
C62:	
	mov r13, 0
A2:	
	mov [b_], r13
	mov r13, [b_]
	cmp r13, rbx
	je C64
C65:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 3
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I19
C64:	
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
I19:	
	mov r13, [x_]
	mov r8, [y_]
	cmp r13, r8
	je C67
C66:	
	mov r13, [x_]
	mov r8, [y_]
	cmp r13, r8
	jle C68
C69:
C67:	
	mov r13, 1
	jmp A3
C68:	
	mov r13, 0
A3:	
	mov [b_], r13
	mov r13, [b_]
	cmp r13, rbx
	je C70
C71:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 3
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I20
C70:	
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
I20:	
	mov r13, [x_]
	mov r8, [y_]
	cmp r13, r8
	je C73
C72:	
	mov r13, [x_]
	mov r8, [y_]
	cmp r13, r8
	jge C74
C75:
C73:	
	mov r13, 1
	jmp A4
C74:	
	mov r13, 0
A4:	
	mov [b_], r13
	mov r13, [b_]
	cmp r13, rbx
	je C76
C77:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 3
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I21
C76:	
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
I21:	
	mov r13, [f_]
	cmp r13, rbx
	je C78
C79:	
	mov r13, [x_]
	mov r8, [y_]
	cmp r13, r8
	jl C80
C81:	
	mov r13, 1
	jmp A5
C80:
C78:	
	mov r13, 0
A5:	
	mov [b_], r13
	mov r13, [b_]
	cmp r13, rbx
	je C82
C83:	
	push rdi
	push rsi
	push rax
	mov rdi, write_msg
	mov rsi, 3
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi
	jmp I22
C82:	
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
I22:	
	push rdi
	push rax
	mov rdi, newline
	mov rax, 0
	call printf
	pop rax
	pop rdi
L0:	
	mov r13, [y_]
	mov r8, 3
	cmp r13, r8
	jle C84
C85:	
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
	mov r13, [y_]
	mov r13, r13
	sub r13, 1
	mov [y_], r13
	jmp L0
C84:	
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
	push rdi
	push rax
	mov rdi, newline
	mov rax, 0
	call printf
	pop rax
	pop rdi
	mov r13, [x_]
	mov r8, [y_]
	cmp r13, r8
	jl C87
C86:	
	mov r13, [t_]
	cmp r13, rbx
	je C88
C89:	
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
C88:
C87:	
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
