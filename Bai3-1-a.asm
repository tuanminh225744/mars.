.text
	addi $s1,$zero,2 #i = 1
	addi $s2,$zero,1 #j =2
start: 
	slt $t0,$s2,$s1 	 
	bne $t0,$zero,else 	 
	addi $t1,$t1,1 	 
	j endif 			 
else: 
	addi $t2,$t2,1	 	 
endif:
