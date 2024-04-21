.eqv SEVENSEG_LEFT 0xFFFF0011 # Dia chi cua den led 7 doan trai.
 # Bit 0 = doan a; 
# Bit 1 = doan b; ... 
# Bit 7 = dau .
.eqv SEVENSEG_RIGHT 0xFFFF0010 # Dia chi cua den led 7 doan phai
.text
main:

#S? 0 (0b00111111) chuy?n thành 0x3F
#S? 1 (0b00000110) chuy?n thành 0x06
#S? 2 (0b01011011) chuy?n thành 0x5B
#S? 3 (0b01001111) chuy?n thành 0x4F
#S? 4 (0b01100110) chuy?n thành 0x66
#S? 5 (0b01101101) chuy?n thành 0x6D
#S? 6 (0b01111101) chuy?n thành 0x7D
#S? 7 (0b00000111) chuy?n thành 0x07
#S? 8 (0b01111111) chuy?n thành 0x7F
#S? 9 (0b01101111) chuy?n thành 0x6F
#Ký t? a (0b01110111) chuy?n thành 0x77
#Ký t? b (0b01111100) chuy?n thành 0x7C
#Ký t? c (0b01011000) chuy?n thành 0x58
#Ký t? d (0b01011110) chuy?n thành 0x5E
#Ký t? e (0b01111001) chuy?n thành 0x79
#Ký t? f (0b01110001) chuy?n thành 0x71

 li $a0, 0x3F # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x06 # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x5B # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x4F # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x66 # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x6D # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x7D # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x07 # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x7F # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x6F # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x77 # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x7C # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x58 # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x5E # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x79 # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x71 # Gia tri cho cac doan led
 jal SHOW_7SEG_LEFT # Goi thu tuc
 nop
 li $a0, 0x00 # Gia tri cho cac doan led
 jal SHOW_7SEG_RIGHT # Goi thu tuc
 nop

exit: li $v0, 10
 syscall
endmain:
#---------------------------------------------------------------
# Function SHOW_7SEG_LEFT : turn on/off the 7seg
# param[in] $a0 value to shown 
# remark $t0 changed
#---------------------------------------------------------------
SHOW_7SEG_LEFT: li $t0, SEVENSEG_LEFT # Gan dia chi port
 sb $a0, 0($t0) # Gan gia tri led 
nop
jr $ra
nop
#---------------------------------------------------------------
# Function SHOW_7SEG_RIGHT : turn on/off the 7seg
# param[in] $a0 value to shown 
# remark $t0 changed
#---------------------------------------------------------------
SHOW_7SEG_RIGHT: li $t0, SEVENSEG_RIGHT # Gan dia chi port
 sb $a0, 0($t0) # Gan gia tri led
nop
jr $ra 
nop
