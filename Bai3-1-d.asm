.text
	addi $s1,$zero,-2 #i = 1
	addi $s2,$zero,-1 #j =1
start:
	slt $t0,$s2,$s1 # j < i ?
	bne $t0,$zero,else
	add $s3,$s1,$s2 # s3=i+j
	slt $t0,$s1,$zero # i+j<0 ?
	bne $t0,$zero,else
	addi $t1,$t1,1
	j endif
else: 
	addi $t2,$t2,1
endif:
