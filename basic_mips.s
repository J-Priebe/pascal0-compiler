	.data
x_:	.space 4
	.text
	.globl main
	.ent main
main:	
	addi $t3, $0, 5
	sw $t3, x_
	lw $a0, x_
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	.end main
