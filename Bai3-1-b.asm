.text
	addi $s1,$zero,-1 #i = 1
	addi $s2,$zero,0 #j = 1
	
start: 
	add $s0,$s1,$s2
	slt $t0,$s0,$zero 	 
	bne $t0,$zero,else 	 
	addi $t1,$t1,1 		  	 
	j endif 			 
else: 
	addi $t2,$t2,1		 	 
endif:
