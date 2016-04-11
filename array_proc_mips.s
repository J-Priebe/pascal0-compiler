	.data
gint_:	.space 4
garr_:	.space 20
	.text
	.globl q
	.ent q
q:	
	sw $fp, -12($sp)
	sw $ra, -16($sp)
	sub $fp, $sp, 8
	sub $sp, $fp, 12
	lw $t3, 0($fp)
	lw $t0, 8($t3)
	sw $t0, -12($fp)
	lw $t5, 0($fp)
	lw $a0, 8($t5)
	li $v0, 1
	syscall
	add $sp, $fp, 8
	lw $ra, -8($fp)
	lw $fp, -4($fp)
	jr $ra
	.text
	.globl main
	.ent main
main:	
	addi $t6, $0, 9
	sw $t6, gint_
	addi $t1, $0, 1
	sw $t1, garr_+0
	addi $t8, $0, 2
	sw $t8, garr_+4
	addi $t4, $0, 3
	sw $t4, garr_+8
	addi $t2, $0, 4
	sw $t2, garr_+12
	addi $t7, $0, 5
	sw $t7, garr_+16
	la $t3, gint_
	sw $t3, -4($sp)
	la $t0, garr_
	sw $t0, -8($sp)
	jal q
	li $v0, 10
	syscall
	.end main
