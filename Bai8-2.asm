.eqv MONITOR_SCREEN 0x10010000 #Dia chi bat dau cua bo nho man hinh
.eqv RED 0x00FF0000 #Cac gia tri mau thuong su dung
.eqv GREEN 0x0000FF00
.eqv BLUE 0x000000FF
.eqv WHITE 0x00FFFFFF
.eqv YELLOW 0x00FFFF00
.text
 li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
 li $s0,0	#Bien dem
loop1:
	beq $s0,64,endloop1
 	li $t0, RED
 	sw $t0, 0($k0)
 	nop
 	addi $k0,$k0,4
 	addi $s0,$s0,1
 	j loop1
endloop1:
	li $s0,0
loop2:
	beq $s0,64,endloop2
 	li $t0, WHITE
 	sw $t0, 0($k0)
 	nop
 	addi $k0,$k0,4
 	addi $s0,$s0,1
 	j loop2
endloop2:

