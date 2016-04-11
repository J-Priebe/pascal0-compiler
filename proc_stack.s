; args at rsp + 8, rsp + 16, rsp + 24, etc
; we dont mess with rbp or rsp here at all
; just push and pop with caller
; local vars should be at -8, -16, ...	


	;mov r11, [16 + rsp]
	; this works
	;lea r8, [r11 + 0]
	; this doesn
	;mov r8, [r11 + 0]


	extern printf
	global main
	
	section .data
	
msg:	db "%d", 10, 0
	
	section .bss      ; uninitialized data
	
x_:	resb 8
	
	section .text
	

q:
	mov r9, 55
	mov [rsp -8], r9
	mov rdi, msg
	mov rsi, [rbp + 24] ;third param (qword is 8 bytes)
	mov rax, 0
	call printf ;prints 9
	ret
	
main:	
	
	mov r12, 9
	mov [x_], r12
	mov r11, 33
	mov r9, [x_]
	mov r8, 101
	push r8 ; third param
	push r9 ; second param
	push r11 ; first param
	push    rbp
	mov     rbp, rsp 
	call q
	mov     rsp, rbp
  pop     rbp
	pop r11
	pop r9
	pop r8

	mov rdi, msg
	mov rsi, 10001
	mov rax, 0
	call printf

	
	mov rax, 60   ;exit call
	mov rdi, 0    ;return code 0
	syscall
