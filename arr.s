  extern printf
  extern scanf
  global main
  
  section .data
  
newline:  db "", 10, 0
write_msg:  db "%d", 10, 0
read_msg: db "Enter an integer: ", 0
read_format:  db "%d", 0
  
  section .bss      ; uninitialized data
  
number: resb 8
gint_:  resb 8
garr_:  resb 40
  
  section .text
  
q:

  mov r8, [8 + rbp]
  mov r13, [16 + r8]

  mov [-8 + rbp], r13

  mov r14, [8 + rbp]

  push rdi
  push rsi
  push rax
  mov rdi, write_msg
  mov rsi, [16 + r14]
  mov rax, 0
  call printf
  pop rax
  pop rsi
  pop rdi
  ret
  
main: 
  mov rbx, 0 ; our "zero register"
  
  mov r12, 9
  mov [gint_], r12

  mov r10, 1
  mov [garr_ + 0], r10

  mov r15, 2
  mov [garr_ + 8], r15

  mov r11, 3
  mov [garr_ + 16], r11

  mov r9, 4
  mov [garr_ + 24], r9

  mov r13, 5
  mov [garr_ + 32], r13

  lea r12, [garr_]
  
  push r12
  push rbp
  mov rbp, rsp
  sub rsp, 50000
  call q
  mov rsp, rbp
  pop rbp
  pop r12
  
  mov rax, 60   ;exit call
  mov rdi, 0    ;return code 0
  syscall
