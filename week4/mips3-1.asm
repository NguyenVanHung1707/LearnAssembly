.text
li $s1, 5
li $s2, 6
slt $at, $s2, $s1 
beq $at, $zero, label
li $s0, 1
label:
