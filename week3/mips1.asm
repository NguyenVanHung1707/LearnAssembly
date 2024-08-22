#Laboratory Exercise 3, Home Assignment 1
.text
addi $s1, $zero, 7 # i = 3
addi $s2, $zero, 5 # j = 5
addi $t1, $zero, 2004 # x = 2004
addi $t2, $zero, 2022 # y = 2022
addi $t3, $zero, 4 # z = 4
start: 
slt $t0,$s2,$s1 # j<i 
bne $t0,$zero,else # branch to else if j<i 
addi $t1,$t1,1 # then part: x=x+1 
addi $t3,$zero,1 # z=1 
j endif # skip “else” part 
else: addi $t2,$t2,-1 # begin else part: y=y-1 
add $t3,$t3,$t3 # z=2*z 
endif: