.data
	text1: .asciiz "Largest: "
	text2: .asciiz "("
	text3: .asciiz ")"
	text4: .asciiz ", "
	text5: .asciiz "Smallest: "
	text6: .asciiz "\n"
.text
	li $s0,0
	li $s1,1
	li $s2,2
	li $s3,3
	li $s4,4
	li $s5,5
	li $s6,6
	li $s7,7
	li $t1,0	#So lon nhat
	li $t2,0	#Dia chi so lon nhat
	li $t3,0	#So lon thu 2
	li $t4,0	#Dia chi so lon thu 2
	
	move $a0,$s0	#Truyen so vao ham
	li $a1,0	#Dia chi cua so
	jal hai_so_lon_nhat	#goi ham tim 2 so lon nhat
	move $a0,$s1	#Truyen so vao ham
	li $a1,1	#Dia chi cua so
	jal hai_so_lon_nhat	#goi ham tim 2 so lon nhat
	move $a0,$s2	#Truyen so vao ham
	li $a1,2	#Dia chi cua so
	jal hai_so_lon_nhat	#goi ham tim 2 so lon nhat
	move $a0,$s3	#Truyen so vao ham
	li $a1,3	#Dia chi cua so
	jal hai_so_lon_nhat	#goi ham tim 2 so lon nhat
	move $a0,$s4	#Truyen so vao ham
	li $a1,4	#Dia chi cua so
	jal hai_so_lon_nhat	#goi ham tim 2 so lon nhat
	move $a0,$s5	#Truyen so vao ham
	li $a1,5	#Dia chi cua so
	jal hai_so_lon_nhat	#goi ham tim 2 so lon nhat
	move $a0,$s6	#Truyen so vao ham
	li $a1,6	#Dia chi cua so
	jal hai_so_lon_nhat	#goi ham tim 2 so lon nhat
	move $a0,$s7	#Truyen so vao ham
	li $a1,7	#Dia chi cua so
	jal hai_so_lon_nhat	#goi ham tim 2 so lon nhat
	
	jal print_2_so_lon_nhat
	
	li $t1,9999	#So be nhat
	li $t2,0	#Dia chi so be nhat
	li $t3,9999	#So be thu 2
	li $t4,0	#Dia chi so be thu 2
	
	move $a0,$s0	#Truyen so vao ham
	li $a1,0	#Dia chi cua so
	jal hai_so_be_nhat	#goi ham tim 2 so be nhat
	move $a0,$s1	#Truyen so vao ham
	li $a1,1	#Dia chi cua so
	jal hai_so_be_nhat	#goi ham tim 2 so be nhat
	move $a0,$s2	#Truyen so vao ham
	li $a1,2	#Dia chi cua so
	jal hai_so_be_nhat	#goi ham tim 2 so be nhat
	move $a0,$s3	#Truyen so vao ham
	li $a1,3	#Dia chi cua so
	jal hai_so_be_nhat	#goi ham tim 2 so be nhat
	move $a0,$s4	#Truyen so vao ham
	li $a1,4	#Dia chi cua so
	jal hai_so_be_nhat	#goi ham tim 2 so be nhat
	move $a0,$s5	#Truyen so vao ham
	li $a1,5	#Dia chi cua so
	jal hai_so_be_nhat	#goi ham tim 2 so be nhat
	move $a0,$s6	#Truyen so vao ham
	li $a1,6	#Dia chi cua so
	jal hai_so_be_nhat	#goi ham tim 2 so be nhat
	move $a0,$s7	#Truyen so vao ham
	li $a1,7	#Dia chi cua so
	jal hai_so_be_nhat	#goi ham tim 2 so be nhat
	
	jal print_2_so_be_nhat
	
	li $v0,10
	syscall
hai_so_lon_nhat:
	slt $t5,$t1,$a0	#t1<a0?
	beq $t5,1,doi1
	slt $t5,$t3,$a0	#t2<a0?
	beq $t5,1,doi2
	jr $ra
doi1:
	move $t3,$t1
	move $t4,$t2
	move $t1,$a0
	move $t2,$a1
	jr $ra	
doi2:
	move $t3,$a0
	move $t4,$a1
	jr $ra
	
print_2_so_lon_nhat:
	# print langest t1(t2), t3(t4)
	li $v0,4
	la $a0,text1
	syscall
	li $v0,1
	move $a0,$t1
	syscall
	li $v0,4
	la $a0,text2
	syscall
	li $v0,1
	move $a0,$t2
	syscall
	li $v0,4
	la $a0,text3
	syscall
	li $v0,4
	la $a0,text4
	syscall
	li $v0,1
	move $a0,$t3
	syscall
	li $v0,4
	la $a0,text2
	syscall
	li $v0,1
	move $a0,$t4
	syscall
	li $v0,4
	la $a0,text3
	syscall
	li $v0,4
	la $a0,text6
	syscall
	jr $ra
	
hai_so_be_nhat:
	sgt $t5,$t1,$a0	#t1>a0?
	beq $t5,1,doi3
	sgt $t5,$t3,$a0	#t2>a0?
	beq $t5,1,doi4
	jr $ra
doi3:
	move $t3,$t1
	move $t4,$t2
	move $t1,$a0
	move $t2,$a1
	jr $ra	
doi4:
	move $t3,$a0
	move $t4,$a1
	jr $ra
	
print_2_so_be_nhat:
	# print smallest t1(t2), t3(t4)
	li $v0,4
	la $a0,text5
	syscall
	li $v0,1
	move $a0,$t1
	syscall
	li $v0,4
	la $a0,text2
	syscall
	li $v0,1
	move $a0,$t2
	syscall
	li $v0,4
	la $a0,text3
	syscall
	li $v0,4
	la $a0,text4
	syscall
	li $v0,1
	move $a0,$t3
	syscall
	li $v0,4
	la $a0,text2
	syscall
	li $v0,1
	move $a0,$t4
	syscall
	li $v0,4
	la $a0,text3
	syscall
	jr $ra

	