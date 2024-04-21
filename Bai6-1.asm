.data
	mang: .space 100
	ki_tu_nhap: .space 10
	space: .asciiz " "
.text
	li $t1,0		# Bien dem i
	la $s0, mang     	# L?u tr? ??a ch? b?t ??u c?a mang
nhap:
	li $v0, 8          	# S? d?ng system call 8 ?? ??c m?t chu?i ký t?
        la $a0, ki_tu_nhap     	# L?u tr? ??a ch? b?t ??u c?a ki_tu_nhap
        li $t0, 0
	sw $t0, 0($a0)		# Xoa ki_tu_nhap
        li $a1,10		# So toi da co 10 ki tu
        syscall            	# Th?c hi?n system call
kiem_tra:
        lw $t0, 0($a0)     	# Load giá tr? t? ki_tu_nhap vào $t0
        beq $t0,10,exit_nhap  	# Neu la enter thi ki_tu_nhap la 10 => thoat
      	beq $t1,30,exit_nhap	# Neu nhap 30 so => thoat
      	
chuyen_doi:
	#chuyen doi so ki tu sang so nguyen
	#t3 luu gia tri ket qua
	lb $t2, 0($a0)         	# ??c ký t? t? chu?i
        beq $t2,10, end_chuyen_doi     	# N?u ký t? là \n (k?t thúc chu?i) thì thoát kh?i vòng l?p
        sub $t2, $t2, 48       	# Chuy?n ??i t? ký t? ASCII sang giá tr? s?
        mul $t3, $t3, 10       	# Nhân giá tr? hi?n t?i c?a k?t qu? v?i 10
        add $t3, $t3, $t2      	# Thêm giá tr? ký t? vào k?t qu?
        addi $a0, $a0, 1       	# Di chuy?n ??n ký t? ti?p theo trong chu?i
        j chuyen_doi
end_chuyen_doi:
	sll $t4,$t1,2		# t4 =4i
	add $t5,$s0,$t4		# t5 luu dia chi cua mang[i]
	sw $t3,0($t5) 
	li $t3,0		# Tra lai tong = 0 
	addi $t1,$t1,1		# Bien dem i=i+1 
	j nhap
exit_nhap:
	j insertion_sort


buble_sort:
	# bien i(t1) luc nay luu so luong so trong mang
	li $s1,0		#bien dem i
	addi $s7,$t1,-1		#bien dem k luu vi tri a[k] max
loop_buble_sort:
	beq $s1,$s7,exit_buble_sort	#neu i=k =>ket thuc mot vong 
	addi $s2,$s1,1		#s2 =i+1
	sll $s3,$s1,2		#s3=4i
	sll $s4,$s2,2		#s3=4(i+1)
	add $s5,$s0,$s3		#s5 luu dia chi cua a[i]
	add $s6,$s0,$s4		#s6 luu dia chi cua a[i+1]
	lw $s3,0($s5)		#a[i]
	lw $s4,0($s6)		#a[i+1]
	slt $s2,$s4,$s3		#neu a[i+1]<a[i]=>dao 2 so
	beq $s2,1,dao_so
	addi $s1,$s1,1		#i=i+1
	j loop_buble_sort
dao_so:
	# a[i] <=> a[i+1]
	sw $s4,0($s5)		
	sw $s3,0($s6)		
        addi $s1,$s1,1		#i=i+1
	j loop_buble_sort
exit_buble_sort:
	li $s1,0		#dat lai gia tri bien i
	addi $s7,$s7,-1		#gio gia tri lon nhat da ve cuoi, giam gia tri cua k
	beq $s7,0,end_buble_sort
	j loop_buble_sort
end_buble_sort:
	j print
	

insertion_sort:
	li $s1,0		#bien dem i
	li $s2,1		#bien dem k	
	move $s3,$t1		#so n
loop_insertion_sort:
	beq $s1,$s2,exit_loop_insertion_sort
	sll $s4,$s1,2
	sll $s5,$s2,2
	add $s6,$s4,$s0
	add $s7,$s5,$s0
	lw $s4,0($s6)		#a[i]
	lw $s5,0($s7)		#a[k]
	move $t2,$s6
	move $t3,$s5
	move $t4,$s4
	slt $s6,$s5,$s4	
	beq $s6,1,loop
	addi $s1,$s1,1
	j loop_insertion_sort
loop:
	beq $s1,$s2,end_loop
	sll $s5,$s1,2
	add $s6,$s5,$s0
	lw $s7,4($s6)		#a[k]
	sw $t4,4($s6)
	move $t4,$s7
	addi $s1,$s1,1
	j loop
end_loop:
	sw $t3,0($t2)
	li $s1,0
	addi $s2,$s2,1
	beq $s2,$s3,end_insertion_sort
	j loop_insertion_sort
exit_loop_insertion_sort:
	li $s1,0
	addi $s2,$s2,1
	beq $s2,$s3,end_insertion_sort
	j loop_insertion_sort
end_insertion_sort:
	j print		
	
print:
	li $s1,0		#bien dem i
loop_print:
	beq $s1,$t1,end_print
	sll $s2,$s1,2
	add $s3,$s2,$s0
	lw $s4, 0($s3)		#a[i]
	move $a0,$s4
	li $v0,1		#print a[i]
	syscall
	la $a0,space		#print space
	li $v0,4
	syscall
	addi $s1,$s1,1		#i=i+1
	j loop_print
end_print:
	