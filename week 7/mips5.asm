.data
max: .asciiz"Largest: "
line: .asciiz"\n"
coma: .asciiz ","
min: .asciiz"Smallest: "
 
 
.text
# Khoi tao cac gia tri
	li $s0, 12
	li $s1, 60
	li $s2, 13
	li $s3, 100
	li $s4, -200
	li $s5, -100
	li $s6, 30
	li $s7,-10
# Luu dong gia tri kia vao trong stack
# Mo rong stack
#luu cac gia tri cua $s vao trong stack
main:	addi $sp, $sp ,-32
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
# nhay den ham tim Max
	jal findMax
# nhay den ham tim Min
	jal findMin	
	li $v0 , 10
	syscall
# tim kiem nhu binh thuong
findMax:
	la $t1, 0($sp)
	la $s3, 0($sp) # t3 = &A[0] =s3
	la $s4, 32($sp)# t4 = &A[n] = s4
	lw $s0, 0($sp) # tmp = A[0] = s0
	addi $s1, $0 ,0 # index = 0 = s1
	addi $t2, $0, 0 # i = 0 = t2
loop:	slt $t3, $s3, $s4  # &A[n] > &a[0] -> t3 = 1
	bne $t3, $0 , check
	j done
check:	# s5 = A[0]
	lw $s5, 0($s3)
	# tmp  < A[i] -> t3 = 1 -> doi cho
	slt $t3, $s0, $s5
	beq $t3, $0, exit	# tiep tuc vong lap
	# tmp = A[i]
	addi $s0, $s5, 0
	# index = i
	addi $s1, $t2, 0
	j exit
done:	
#-------------------------------------
#in ra max
	li $v0, 4
	la $a0, max
	syscall
	li $v0, 1
	addi $a0, $s0, 0
	syscall
	li $v0, 4
	la $a0, coma
	syscall
	li $v0, 1
	addi $a0, $s1,0
	syscall
	li $v0, 4
	la $a0, line
	syscall
	#Khoi phuc lai $s
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	lw $s4, 16($sp)
	lw $s5, 20($sp)
	lw $s6, 24($sp)
	lw $s7, 28($sp)
	#chu y chua duoc khoi phuc stack
	jr $ra
exit:	
	addi $t2, $t2, 1
	mul $t2, $t2, 4
	add $s3, $t1, $t2
	div $t2, $t2, 4
	j loop
findMin:
	la $t1, 0($sp)
	la $s3, 0($sp) # t3 = &A[0] =s3
	la $s4, 32($sp)# t4 = &A[n] = s4
	lw $s0, 0($sp) # tmp = A[0] = s0
	addi $s1, $0 ,0 # index = 0 = s1
	addi $t2, $0, 0 # i = 0 = t2
loop2:	slt $t3, $s3, $s4  # &A[n] > &a[0] -> t3 = 1
	bne $t3, $0 , check2
	j done2
check2:	# s5 = A[0]
	lw $s5, 0($s3)
	# tmp  > A[i] -> t3 = 1 -> doi cho
	slt $t3, $s5, $s0
	beq $t3, $0, exit2	# tiep tuc vong lap
	# tmp = A[i]
	addi $s0, $s5, 0
	# index = i
	addi $s1, $t2, 0
	j exit2
done2:	
#-------------------------------------
#in ra min
	li $v0, 4
	la $a0, min
	syscall
	li $v0, 1
	addi $a0, $s0, 0
	syscall
	li $v0, 4
	la $a0, coma
	syscall
	li $v0, 1
	addi $a0, $s1,0
	syscall
	#Khoi phuc lai $s
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	lw $s4, 16($sp)
	lw $s5, 20($sp)
	lw $s6, 24($sp)
	lw $s7, 28($sp)
	# Khoi phuc lai stack
	addi $sp, $sp, 32
	jr $ra
exit2:	
	addi $t2, $t2, 1
	mul $t2, $t2, 4
	add $s3, $t1, $t2
	div $t2, $t2, 4
	j loop2	