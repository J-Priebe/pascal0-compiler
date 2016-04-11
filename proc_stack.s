; args at rbp + 8, rbp + 16, rbp + 24, etc
; we dont mess with rbp or rsp here at all
; just push and pop with caller
; local vars should be at -8, -16, ...	

;nasm -f elf64 proc_stack.s && gcc -m64 -o proc-stack proc_stack.o


	extern printf
	global main
	
	section .data
	
msg:	db "%d", 10, 0
	
	section .bss      ; uninitialized data
	
x_:	resb 8
	
	section .text
	

q:
	mov r9, 55
	mov [rbp -8], r9 ;local param 
	push rdi
	push rsi
	push rax
	mov rdi, msg
	mov rsi, [rbp + 24] ; passed param
	mov rax, 0
	call printf
	pop rax
	pop rsi
	pop rdi	
	ret
	
main:	
	
	mov r12, 9
	mov [x_], r12
	mov r11, 33
	mov r9, [x_]
	mov r8, 101
	push r8 ; third param 101
	push r9 ; second param 9
	push r11 ; first param 33
	push    rbp
	mov     rbp, rsp 
	sub rsp, 1000000       ; a bunch of local stack space
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
