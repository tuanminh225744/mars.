.data
	a1: .word 0x7fffffff #0111 1111 1111 1111 1111 1111 1111 1111
	a2: .word 0x7fffffff #0111 1111 1111 1111 1111 1111 1111 1111
.text
	lw $s1,a1
	lw $s2,a2
	addu $s3,$s1,$s2
	xor $s4,$s1,$s3
	bltz $s4,overflow	#neu s1 khac dau s3 -> overflow
	xor $s4,$s2,$s3
	bltz $s4,overflow	#neu s2 khac dau s3 -> overflow
not_overflow:
	li $s5,0	
	j end
overflow:
	li $s5,1
	j end
end: