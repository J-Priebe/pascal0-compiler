	.data
x_:	.space 4
	.text
	.globl main
	.ent main
main:	
	addi $t6, $0, 1
	sw $t6, x_
	lw $a0, x_
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	.end main
