
.data
	A: .space 120
	n: .word 30
	tong_max_la: .asciiz "tong max la: "
	space: .asciiz " "
	enter: .asciiz "\n"
	day_lon_nhat_la: .asciiz "day lon nhat la: "
	dia_chi_day_lon_nhat_la: .asciiz "dia chi day lon nhat la: "
.text
main:
	la $t0,A
	lw $s0,n
random_and_store:
	jal random_number
	add $s2,$s1,$s1
	add $s2,$s2,$s2		#s2=4i
	add $s3,$s2,$t0		#go to A[i]
	sw $a0,0($s3)		#store random number in A[i}
	addi $s1,$s1,1		#s1=i
	beq $s1,$s0,out_random_and_store	#if i=30 => out
	j random_and_store
random_number:
	li $v0, 42 		# System call code to generate random integer
	li $a1, 200 		# The upper bound is set in $a1
	syscall 		# The random number is stored in $a0
	jr $ra
out_random_and_store:
	li $s1,0
	li $t6,0		#t6=max
	sub $s4,$s0,2		#for i=0->n-2
	li $s5,0		#address of max
find_max:
	add $s2,$s1,$s1
	add $s2,$s2,$s2		#s2=4i
	add $s3,$s2,$t0		#go to A[i]
	lw $t1,0($s3)		#store A[i] in t1
	add $s1,$s1,1
	add $s2,$s1,$s1
	add $s2,$s2,$s2		#s2=4(i+1)
	add $s3,$s2,$t0		#go to A[i+1]
	lw $t2,0($s3)		#store A[i+1] in t2
	add $s1,$s1,1
	add $s2,$s1,$s1
	add $s2,$s2,$s2		#s2=4(i+2)
	add $s3,$s2,$t0		#go to A[i+2]
	lw $t3,0($s3)		#store A[i+2] in t3
	add $t4,$t1,$t2
	add $t5,$t4,$t3		#t5=t1+t2+t3
	sgt $t7,$t5,$t6		#t5>max?
	beq $t7,1,set_max
	beq $s1,$s4,out_find_max	#if s1=n-2 =>out
	sub $s1,$s1,1		#i+2->i+1
	j find_max
set_max:
	add $t6,$t5,$zero
	add $s5,$s1,$zero
	sub $s1,$s1,2		#i+2->i
	add $s2,$s1,$s1
	add $s2,$s2,$s2		#s2=4i
	add $s5,$s2,$t0		#store address A[i] in s5
	beq $s1,$s4,out_find_max	#if s1=n-2 =>out
	add $s1,$s1,1		#i->i+1
	j find_max
out_find_max:
print:
	li $v0,4
	la $a0,tong_max_la
	syscall
	li $v0,1
	move $a0,$t6
	syscall
	li $v0,4
	la $a0,enter
	syscall
	
	li $v0,4
	la $a0,day_lon_nhat_la
	syscall
	
	li $v0,1
	lw $s6,0($s5)
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,space
	syscall
	
	li $v0,1
	lw $s6,4($s5)
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,space
	syscall
	
	li $v0,1
	lw $s6,8($s5)
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,enter
	syscall
	
	li $v0,4
	la $a0,dia_chi_day_lon_nhat_la
	syscall 
	li $v0,1
	move $a0,$s5
	syscall
	li $v0,4
	la $a0,space
	syscall
	
	li $v0,1
	move $a0,$s5
	addi $a0,$a0,4
	syscall
	li $v0,4
	la $a0,space
	syscall
	
	li $v0,1
	move $a0,$s5
	addi $a0,$a0,8
	syscall
	li $v0,4
	la $a0,space
	syscall
	
	