.eqv KEY_CODE 0xFFFF0004 # ASCII code from keyboard, 1 byte
.eqv KEY_READY 0xFFFF0000 # =1 if has a new keycode ?
 # Auto clear after lw
.eqv DISPLAY_CODE 0xFFFF000C # ASCII code to show, 1 byte
.eqv DISPLAY_READY 0xFFFF0008 # =1 if the display is already to do
 # Auto clear after sw

	
.text
 	li $k0, KEY_CODE
 	li $k1, KEY_READY
 
 	li $s0, DISPLAY_CODE
 	li $s1, DISPLAY_READY
loop: nop
 
 
WaitForKey: 
	lw $t1, 0($k1) # $t1 = [$k1] = KEY_READY
 	nop
 	beq $t1, $zero, WaitForKey # if $t1 == 0 then Polling
 	nop
ReadKey: 
	lw $t0, 0($k0) # $t0 = [$k0] = KEY_CODE
 	nop




check:
	addi $sp,$sp,-4
	sw $t0,0($sp)
	lw $t3,0($sp)
	beq $t3,116,check1	#ma ki tu 't'
	j exit_check
check1:
	lw $t3,4($sp)
	beq $t3,105,check2	#ma ki tu 'i'
	j exit_check
check2:
	lw $t3,8($sp)
	beq $t3,120,check3	#ma ki tu 'x'
	j exit_check
check3:
	lw $t3,12($sp)
	beq $t3,101,exit	#ma ki tu 'e'
	j exit_check
exit:
	li $v0,10
	syscall
exit_check:

    
    
WaitForDis: 
	lw $t2, 0($s1) # $t2 = [$s1] = DISPLAY_READY
 	nop
 	beq $t2, $zero, WaitForDis # if $t2 == 0 then Polling 
 	nop 

Encrypt: 
	addi $t0, $t0, 1 # change input key
ShowKey: 
	sw $t0, 0($s0) # show key
 	nop 
 	j loop
 
