.data
    	he16: .asciiz "0123456789ABCDEF"  
	ketqua: .space 1000
	enter: .asciiz "\n"
	text1: .asciiz "The multiplication of "
	text2: .asciiz " (base 16) and "
	text3: .asciiz " (base 16) is "
	text4: .asciiz " (base 16)."
.text
   	li $s1, 0x01234567    	# x1
    	li $s2, 0x01234567    	# x2
    	mult $s1, $s2		# x1*x2
    	la $t0, he16          	# luu dia chi bang ki tu vao t0
    	li $s3, 0             	# bien dem i
    	la $s0,ketqua		# luu dia chi ket qua vao s0
    	
    	li $v0,4
    	la $a0,text1
    	syscall
    	
    	move $s4, $s1         	# Luu x1 vào s4 de thuc hien trong ham 
    	jal chuyen_he_16      	# Goi ham chuyen_he_16
    	
    	li $v0,4
    	la $a0,text2
    	syscall
    	
    	li $s3, 0             	# bien dem i
    	move $s4, $s2         	# Luu x2 vào s4 de thuc hien trong ham 
    	jal chuyen_he_16      	# Goi ham chuyen_he_16

    	
    	li $v0,4
    	la $a0,text3
    	syscall
    	
    	li $s3, 0             	# bien dem i
    	mfhi $s5
    	move $s4, $s5         	# Luu hi vào s4 de thuc hien trong ham 
    	jal chuyen_he_16      	# Goi ham chuyen_he_16
 	
    	li $s3, 0             	# bien dem i
    	mflo $s5
    	move $s4, $s5         	# Luu hi vào s4 de thuc hien trong ham 
    	jal chuyen_he_16      	# Goi ham chuyen_he_16
   	
    	li $v0,4
    	la $a0,text4
    	syscall
    	
    	li $v0, 10
    	syscall
    	
    

chuyen_he_16:
  	beq $s3, 8, out_chuyen_he_16   	# dieu kien thoat khi in du 8 ki tu
   	andi $t1, $s4, 0x0000000f      	# Luu 4 bit cuoi vào t1
  	srl $s4, $s4, 4                	# Dich sang 4 bit tiep theo
  	add $t2, $t1, $t0              	# t2 là vi trí cua ky tu trong bang ky tu
 	lb $t3, 0($t2)                 	# load ki tu luu vao t3
  	sll $t4,$s3,2			# t4=i*4
  	add $t5,$s0,$s3			# t5 luu dia chi cua ket qua
   	sb $t3, 0($t5)			# luu ki tu vao bo nho ket qua
  	addi $s3, $s3, 1               	# Tang bien dem len 1
  	j chuyen_he_16                 	# Nhay lai hàm chuyen_he_16
out_chuyen_he_16:
	li $s3,7			# Dat lai bien dem = 7
print:
	beq $s3,-1,out_print
	sll $t6,$s3,2			# t6 = 4i
	add $t7,$s3,$s0			# t7 luu vi tri ki tu can in
	lb $t8,0($t7)			# load ki tu can in
	move $a0, $t8                  	# luu ki tu vao a0 de in
    	li $v0, 11                     	# Lenh syscall de in ki tu
    	syscall
    	addi $s3,$s3,-1			# giam bien dem di 1 
    	j print
out_print:
    	jr $ra                          # Tro ve tu ham chuyen_he_16
