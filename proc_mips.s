	.data
x_:	.space 4
	.text
	.globl q
	.ent q
q:	
	sw $fp, -8($sp)
	sw $ra, -12($sp)
	sub $fp, $sp, 4
	sub $sp, $fp, 12
	lw $t3, 0($fp)
	lw $t0, 0($t3)
	sw $t0, -12($fp)
	add $sp, $fp, 4
	lw $ra, -8($fp)
	lw $fp, -4($fp)
	jr $ra
	.text
	.globl main
	.ent main
main:	
	addi $t5, $0, 9
	sw $t5, x_
	la $t6, x_
	sw $t6, -4($sp)
	jal q
	li $v0, 10
	syscall
	.end main
