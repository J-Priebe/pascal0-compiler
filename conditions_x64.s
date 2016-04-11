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
	je C100
C101:	
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
	jmp I28
C100:	
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
I28:	
	cmp rbx, rbx
	je C102
C103:	
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
	jmp I29
C102:	
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
I29:	
	mov r13, [t_]
	cmp r13, rbx
	je C104
C105:	
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
	jmp I30
C104:	
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
I30:	
	mov r13, [f_]
	cmp r13, rbx
	je C106
C107:	
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
	jmp I31
C106:	
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
I31:	
	mov r13, [t_]
	cmp r13, rbx
	jne C109
C108:	
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
	jmp I32
C109:	
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
I32:	
	mov r13, [f_]
	cmp r13, rbx
	jne C111
C110:	
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
	jmp I33
C111:	
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
I33:	
	mov r13, [t_]
	cmp r13, rbx
	jne C113
C112:	
	mov r13, [t_]
	cmp r13, rbx
	je C114
C115:
C113:	
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
	jmp I34
C114:	
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
I34:	
	mov r13, [t_]
	cmp r13, rbx
	jne C117
C116:	
	mov r13, [f_]
	cmp r13, rbx
	je C118
C119:
C117:	
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
	jmp I35
C118:	
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
I35:	
	mov r13, [f_]
	cmp r13, rbx
	jne C121
C120:	
	mov r13, [t_]
	cmp r13, rbx
	je C122
C123:
C121:	
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
	jmp I36
C122:	
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
I36:	
	mov r13, [f_]
	cmp r13, rbx
	jne C125
C124:	
	mov r13, [f_]
	cmp r13, rbx
	je C126
C127:
C125:	
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
	jmp I37
C126:	
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
I37:	
	mov r13, [t_]
	cmp r13, rbx
	je C128
C129:	
	mov r13, [t_]
	cmp r13, rbx
	je C130
C131:	
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
	jmp I38
C130:
C128:	
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
I38:	
	mov r13, [t_]
	cmp r13, rbx
	je C132
C133:	
	mov r13, [f_]
	cmp r13, rbx
	je C134
C135:	
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
	jmp I39
C134:
C132:	
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
I39:	
	mov r13, [f_]
	cmp r13, rbx
	je C136
C137:	
	mov r13, [t_]
	cmp r13, rbx
	je C138
C139:	
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
	jmp I40
C138:
C136:	
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
I40:	
	mov r13, [f_]
	cmp r13, rbx
	je C140
C141:	
	mov r13, [f_]
	cmp r13, rbx
	je C142
C143:	
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
	jmp I41
C142:
C140:	
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
I41:	
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
	je C144
C145:	
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
	jmp I42
C144:	
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
I42:	
	mov [b_], rbx
	mov r13, [b_]
	cmp r13, rbx
	je C146
C147:	
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
	jmp I43
C146:	
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
I43:	
	mov r13, [x_]
	mov r11, [y_]
	cmp r13, r11
	jge C148
C149:	
	mov r13, 1
	jmp A6
C148:	
	mov r13, 0
A6:	
	mov [b_], r13
	mov r13, [b_]
	cmp r13, rbx
	je C150
C151:	
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
	jmp I44
C150:	
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
I44:	
	mov r13, [x_]
	mov r11, [y_]
	cmp r13, r11
	jg C153
C152:	
	mov r13, [t_]
	cmp r13, rbx
	je C154
C155:
C153:	
	mov r13, 1
	jmp A7
C154:	
	mov r13, 0
A7:	
	mov [b_], r13
	mov r13, [b_]
	cmp r13, rbx
	je C156
C157:	
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
	jmp I45
C156:	
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
I45:	
	mov r13, [x_]
	mov r11, [y_]
	cmp r13, r11
	jg C159
C158:	
	mov r13, [f_]
	cmp r13, rbx
	je C160
C161:
C159:	
	mov r13, 1
	jmp A8
C160:	
	mov r13, 0
A8:	
	mov [b_], r13
	mov r13, [b_]
	cmp r13, rbx
	je C162
C163:	
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
	jmp I46
C162:	
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
I46:	
	mov r13, [x_]
	mov r11, [y_]
	cmp r13, r11
	je C165
C164:	
	mov r13, [x_]
	mov r11, [y_]
	cmp r13, r11
	jle C166
C167:
C165:	
	mov r13, 1
	jmp A9
C166:	
	mov r13, 0
A9:	
	mov [b_], r13
	mov r13, [b_]
	cmp r13, rbx
	je C168
C169:	
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
	jmp I47
C168:	
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
I47:	
	mov r13, [x_]
	mov r11, [y_]
	cmp r13, r11
	je C171
C170:	
	mov r13, [x_]
	mov r11, [y_]
	cmp r13, r11
	jge C172
C173:
C171:	
	mov r13, 1
	jmp A10
C172:	
	mov r13, 0
A10:	
	mov [b_], r13
	mov r13, [b_]
	cmp r13, rbx
	je C174
C175:	
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
	jmp I48
C174:	
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
I48:	
	mov r13, [f_]
	cmp r13, rbx
	je C176
C177:	
	mov r13, [x_]
	mov r11, [y_]
	cmp r13, r11
	jl C178
C179:	
	mov r13, 1
	jmp A11
C178:
C176:	
	mov r13, 0
A11:	
	mov [b_], r13
	mov r13, [b_]
	cmp r13, rbx
	je C180
C181:	
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
	jmp I49
C180:	
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
I49:	
	push rdi
	push rax
	mov rdi, newline
	mov rax, 0
	call printf
	pop rax
	pop rdi
L1:	
	mov r13, [y_]
	mov r11, 3
	cmp r13, r11
	jle C182
C183:	
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
	jmp L1
C182:	
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
	mov r11, [y_]
	cmp r13, r11
	jl C185
C184:	
	mov r13, [t_]
	cmp r13, rbx
	je C186
C187:	
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
C186:
C185:	
	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
