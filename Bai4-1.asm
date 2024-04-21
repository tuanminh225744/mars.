.data
	n: .word 0x87654321
.text
	lw $s0,n
	srl $s1,$s0,24		#luu 2 byte dau vao s1
	srl $s0,$s0,8		
	sll $s0,$s0,8		#clear 2 byte cuoi
	ori $s0,$s0,17		#dat 2 byte cuoi = 1
	andi $s0,$s0,0		#clear s0
	add $s0,$s0,$s1		#dua 2 byte dau vao s0