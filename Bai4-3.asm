.data
	s0: .word 0x0f0fffff
	store: .word 0x00000000
	sai: .asciiz "n nhap sai"
.text
	lw $s0,s0
	li $v0,5
	syscall
	li $s1,15
	move $t0,$v0
	slt $s2,$t0,$s1
	beq $s2,0,loi
	slt $s3,$zero,$t0
	beq $s3,0,loi
	addi $s4,$t0,17
	li $s5,32
	sub $s4,$s5,$s4
	sllv $s0,$s0,$s4
	srlv $s0,$s0,$s4
	srlv $s0,$s0,$t0
	sw $s0,store
	j end
loi:
	li $v0,4
	la $a0,sai
	syscall
end: