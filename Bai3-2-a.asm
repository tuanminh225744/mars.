.data
	A: .word 100,10,-30,20
.text
	la $s2, A		# load address of A into $s2
	addi $s4, $zero, 1 	# step =1
	addi $s5, $zero, 0	# sum = 0 
	addi $s1, $zero, 0 	# i = 0 
	addi $s6, $zero, 100
	addi $s7, $zero, 50
loop: 
	add $t1, $s1, $s1 	# $t1 = 2 * $s1 
	add $t1, $t1, $t1 	# $t1 = 4 * $s1 
	add $t1, $t1, $s2 	# $t1 store the address of A[i] 
	lw $t0, 0($t1) 		# load value of A[i] in $t0 
	slt $t2,$t0,$s7		# A[i] < 50?
	add $s5, $s5, $t0 	# sum = sum + A[i]
	slt $t3,$s5,$s6		# sum < 100?
	add $t4,$t2,$t3
	beq $t4,2,endloop	# (a[i]<50)AND(sum<100)=>endloop
	add $s1, $s1, $s4 	# i = i + step 
	j loop 			# goto loop 
endloop:

