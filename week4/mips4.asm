.text
li $s0, -111
li $s1, -120
li $t0, 0	# Mac dinh t0 = 0 la trang thai khong xay ra Overflow
addu $t2, $s0, $s1	# Tinh tong s0 va s1 
xor $t1, $s0, $s1	# Neu hai so s0 va s1 cung dau thi t1 > 0
blez $t1, Exit		# Neu t1 < 0 (khac dau) thi nhay den Exit
xor $t1, $s1, $t2	# Neu hai so s1 va t2 cung dau thi t1 > 0
bgez $t1, Exit		# Neu t1 > 0 (cung dau) thi nhay den Exit
Overflow:
li $t0, 1		# Overflow xay ra
Exit:
