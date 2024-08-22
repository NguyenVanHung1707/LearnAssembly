.text 
 li $s0, 0x12345678 
 andi $t0,$s0,0xff000000 
 srl $t0,$t0,24 #Trích xu?t 8 bit ??u (K?t qu? ? thanh $t0) 
 andi $t1,$s0,0xffffff00 #Xoá 8 bit cu?i (K?t qu? ? thanh $t1)
 ori $t2,$s0,0x000000ff #Bi?n 8 bit cu?i thành 1 (K?t qu? ? thanh $t2) 
 andi $s0,$s0, 0 #Xoá s?ch $s0