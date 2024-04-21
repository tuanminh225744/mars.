.data
	the_sum_of: .asciiz "the sum of "
	and_: .asciiz " and "
	is: .asciiz " is "
.text
	li $v0,5
	syscall
	move $s0,$v0		#doc so s0
	
	li $v0,5
	syscall
	move $s1,$v0		#doc so s1
	
	add $s2,$s1,$s0		#tinh tong
	
	li $v0,4
	la $a0,the_sum_of	#print "the sum of"
	syscall
	
	li $v0,1
	move $a0,$s0		#print s0
	syscall
	
	li $v0,4
	la $a0,and_		#print "and"
	syscall
	
	li $v0,1
	move $a0,$s1		#print s1
	syscall
	
	li $v0,4
	la $a0,is		#print "is"
	syscall
	
	li $v0,1
	move $a0,$s2		#print tong
	syscall
