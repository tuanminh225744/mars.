.data
	string: .space 1000
	message: .asciiz "chieu dai cua chuoi la:\n"
.text
	la $s0,string
	li $v0,8
	move $a0,$s0
	li $a1,1000
	syscall

	li $s1,0		#s1=i
	
dem:				#vong lap dem so ki tu 
	add $s2,$s1,$s0
	lb $s3,0($s2)		#load ki tu thu i
	beq $s3,$zero,end_dem	#neu het chuoi thi ket thuc
	addi $s1,$s1,1		#i=i+1
	j dem
end_dem:
print:
	li $v0,56
	la $a0,message
	move $a1,$s1
	syscall
	