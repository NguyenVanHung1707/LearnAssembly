.eqv MONITOR_SCREEN 0x10010000  
.eqv  RED 0x00FF0000
.eqv GREEN 0x0000FF00

.text 
   	li	$k0, MONITOR_SCREEN 
   	
li 	$s0, 2
	li	$t0, -1			# Khoi tao j
lap1:	addi	$t0, $t0, 1
	beq	$t0, 8, todo
	li	$t1, -1			# Khoi tao i
lap2:	addi 	$t1, $t1, 1
	beq	$t1, 8, Endlap2
	div	$t0, $s0
	mfhi	$t2
	div	$t1, $s0
	mfhi	$t3
	bne	$t2, 0, nhan1
	bne	$t3, 0, lap2
	j	nhan2
nhan1:	beq	$t3, 0, lap2
nhan2:	sll	$s1, $t0, 3
	add	$s1, $s1, $t1
	sll	$s1, $s1, 2
	add	$s2, $s1, $k0
	li 	$t4, GREEN
	sw  	$t4, 0($s2)
	j	lap2
Endlap2:
	j	lap1
	
todo:   	
	li 	$s0, 2
	li	$t0, -1			# Khoi tao j
For1:	addi	$t0, $t0, 1
	beq	$t0, 8, Exit
	li	$t1, -1			# Khoi tao i
For2:	addi 	$t1, $t1, 1
	beq	$t1, 8, EndFor2
	div	$t0, $s0
	mfhi	$t2
	div	$t1, $s0
	mfhi	$t3
	beq	$t2, 0, loop1
	bne	$t3, 0, For2
	j	loop2
loop1:	beq	$t3, 0, For2
loop2:	sll	$s1, $t0, 3
	add	$s1, $s1, $t1
	sll	$s1, $s1, 2
	add	$s2, $s1, $k0
	li 	$t4, RED 
	sw  	$t4, 0($s2)
	j	For2
EndFor2:
	j	For1
Exit:	li	$v0, 10
	syscall	