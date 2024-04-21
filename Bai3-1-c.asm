.text
	addi $s1,$zero,1 #i = 1
	addi $s2,$zero,1 #j =1
	addi $s3,$zero,1 #m =1
	addi $s4,$zero,2 #n =1
	add $s5,$s1,$s2 #i+j
	add $s6,$s3,$s4 #m+n
	sub $s7,$s5,$s6 #i+j – (m+n)
start: 
	slt $t0,$zero,$s7 	 
	beq $t0,$zero,else 	 
	addi $t1,$t1,1 		  
	j endif 			 
else: 
	addi $t2,$t2,1		 	 
endif:
