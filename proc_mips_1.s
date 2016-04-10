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
	lw $t8, 0($fp)
	lw $t6, 0($t8)
	sw $t6, -12($fp)
	add $sp, $fp, 4
	lw $ra, -8($fp)
	lw $fp, -4($fp)
	jr $ra
	.text
	.globl main
	.ent main
main:	
	addi $t8, $0, 9
	sw $t8, x_
	la $t8, x_
	sw $t8, -4($sp)
	jal q
	li $v0, 10
	syscall
	.end main


;program p;
;  var x: integer;
;  procedure q(var c: integer);
;   var y: integer;
;    begin 
;      y := c
;    end;
;  begin 
;    x := 9;
;    q(x)
;  end