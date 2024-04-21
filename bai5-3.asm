.data
	string: .space 100
	string_out: .space 100
	message: .asciiz "chieu dai cua chuoi la:\n"
.text
	la $s0,string
	li $v0,8
	move $a0,$s0
	li $a1,15		#max leng = 15
	syscall

	li $s1,0		#s1=i
	
dem:
	add $s2,$s1,$s0
	lb $s3,0($s2)		#load ki tu thu i
	beq $s3,$zero,end_dem	#neu het chuoi thi ket thuc
	addi $s1,$s1,1		#i=i+1
	j dem
end_dem:
	addi $s1,$s1,-1		#chieu dai chuoi = i-1
	la $t0,string_out	
	move $t1,$s1		#j=chieu dai chuoi
	li $t2,0		#k=0
	addi $s1,$s1,1
dao_ki_tu:
	beq $t2,$s1,end_dao_ki_tu	#neu k = chieu dai chuoi + 1 ->end
	add $t3,$t2,$s0
	lb $t4,0($t3)
	add $t5,$t1,$t0
	sb $t4,0($t5)
	addi $t2,$t2,1			#k=k+1
	addi $t1,$t1,-1			#j=j-1
	j dao_ki_tu
end_dao_ki_tu:
print:
	li $v0,4
	la $a0,string_out
	syscall
	









