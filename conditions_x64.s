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
	
	mov r8, 7
	mov [x_], r8
	mov r14, 9
	mov [y_], r14
	mov r12, 11
	mov [z_], r12
	mov r9, 1
	mov [t_], r9
	mov [f_], rbx
	mov r15, 1
	cmp r15, rbx
	je C0
C1:	
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
	jmp I0
C0:	
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
I0:	
	cmp rbx, rbx
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
	mov r13, [t_]
	cmp r13, rbx
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
	mov r11, [f_]
	cmp r11, rbx
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
	mov r10, [t_]
	cmp r10, rbx
	jne C9
C8:	
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
C9:	
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
	mov r8, [f_]
	cmp r8, rbx
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
	mov r14, [t_]
	cmp r14, rbx
	jne C13
C12:	
	mov r12, [t_]
	cmp r12, rbx
	je C14
C15:
C13:	
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
C14:	
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
	mov r9, [t_]
	cmp r9, rbx
	jne C17
C16:	
	mov r15, [f_]
	cmp r15, rbx
	je C18
C19:
C17:	
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
C18:	
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
	mov r13, [f_]
	cmp r13, rbx
	jne C21
C20:	
	mov r11, [t_]
	cmp r11, rbx
	je C22
C23:
C21:	
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
C22:	
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
	mov r10, [f_]
	cmp r10, rbx
	jne C25
C24:	
	mov r8, [f_]
	cmp r8, rbx
	je C26
C27:
C25:	
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
C26:	
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
	mov r14, [t_]
	cmp r14, rbx
	je C28
C29:	
	mov r12, [t_]
	cmp r12, rbx
	je C30
C31:	
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
C30:
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
	mov r9, [t_]
	cmp r9, rbx
	je C32
C33:	
	mov r15, [f_]
	cmp r15, rbx
	je C34
C35:	
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
C34:
C32:	
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
	mov r13, [f_]
	cmp r13, rbx
	je C36
C37:	
	mov r11, [t_]
	cmp r11, rbx
	je C38
C39:	
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
C38:
C36:	
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
	mov r10, [f_]
	cmp r10, rbx
	je C40
C41:	
	mov r8, [f_]
	cmp r8, rbx
	je C42
C43:	
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
C42:
C40:	
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
	push rdi
	mov rdi, newline
	call printf
	pop rdi
	mov r14, 1
	mov [b_], r14
	mov r12, [b_]
	cmp r12, rbx
	je C44
C45:	
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
	jmp I14
C44:	
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
I14:	
	mov [b_], rbx
	mov r9, [b_]
	cmp r9, rbx
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
	mov r15, [x_]
	mov r13, [y_]
	cmp r15, r13
	jge C48
C49:	
	mov r11, 1
	jmp A0
C48:	
	mov r11, 0
A0:	
	mov [b_], r11
	mov r10, [b_]
	cmp r10, rbx
	je C50
C51:	
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
	jmp I16
C50:	
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
I16:	
	mov r8, [x_]
	mov r14, [y_]
	cmp r8, r14
	jg C53
C52:	
	mov r12, [t_]
	cmp r12, rbx
	je C54
C55:
C53:	
	mov r9, 1
	jmp A1
C54:	
	mov r9, 0
A1:	
	mov [b_], r9
	mov r15, [b_]
	cmp r15, rbx
	je C56
C57:	
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
	jmp I17
C56:	
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
I17:	
	mov r13, [x_]
	mov r11, [y_]
	cmp r13, r11
	jg C59
C58:	
	mov r10, [f_]
	cmp r10, rbx
	je C60
C61:
C59:	
	mov r8, 1
	jmp A2
C60:	
	mov r8, 0
A2:	
	mov [b_], r8
	mov r14, [b_]
	cmp r14, rbx
	je C62
C63:	
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
C62:	
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
	mov r12, [x_]
	mov r9, [y_]
	cmp r12, r9
	je C65
C64:	
	mov r15, [x_]
	mov r13, [y_]
	cmp r15, r13
	jle C66
C67:
C65:	
	mov r11, 1
	jmp A3
C66:	
	mov r11, 0
A3:	
	mov [b_], r11
	mov r10, [b_]
	cmp r10, rbx
	je C68
C69:	
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
C68:	
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
	mov r8, [x_]
	mov r14, [y_]
	cmp r8, r14
	je C71
C70:	
	mov r12, [x_]
	mov r9, [y_]
	cmp r12, r9
	jge C72
C73:
C71:	
	mov r15, 1
	jmp A4
C72:	
	mov r15, 0
A4:	
	mov [b_], r15
	mov r13, [b_]
	cmp r13, rbx
	je C74
C75:	
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
C74:	
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
	mov r11, [f_]
	cmp r11, rbx
	je C76
C77:	
	mov r10, [x_]
	mov r8, [y_]
	cmp r10, r8
	jl C78
C79:	
	mov r14, 1
	jmp A5
C78:
C76:	
	mov r14, 0
A5:	
	mov [b_], r14
	mov r12, [b_]
	cmp r12, rbx
	je C80
C81:	
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
C80:	
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
	push rdi
	mov rdi, newline
	call printf
	pop rdi
L0:	
	mov r9, [y_]
	mov r15, 3
	cmp r9, r15
	jle C82
C83:	
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
C82:	
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
	mov rdi, newline
	call printf
	pop rdi
	mov r11, [x_]
	mov r10, [y_]
	cmp r11, r10
	jl C85
C84:	
	mov r8, [t_]
	cmp r8, rbx
	je C86
C87:	
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
C86:
C85:	
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
