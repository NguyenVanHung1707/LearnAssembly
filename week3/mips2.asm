.data
array: .word 1, -3, 5, -7, 9   # M?ng ví d?
array_size: .word 5             # S? ph?n t? trong m?ng

.text
main:
    lw $t0, array_size          # T?i s? ph?n t? trong m?ng
    la $t1, array               # T?i ??a ch? c?a m?ng
    lw $t2, 0($t1)              # T?i ph?n t? ??u tiên c?a m?ng
    abs $t3, $t2                # Tính giá tr? tuy?t ??i c?a ph?n t? ??u tiên
    move $t4, $t2               # Kh?i t?o $t4 v?i giá tr? c?a ph?n t? ??u tiên

loop:
    addi $t0, $t0, -1           # Gi?m b? ??m
    beq $t0, $zero, end_loop    # N?u b? ??m b?ng không, thoát kh?i vòng l?p

    lw $t1, 4($t1)              # T?i ph?n t? ti?p theo c?a m?ng
    abs $t5, $t1                # Tính giá tr? tuy?t ??i c?a ph?n t? hi?n t?i
    bgt $t5, $t3, update_max    # N?u giá tr? tuy?t ??i hi?n t?i l?n h?n, c?p nh?t max
    j loop                      # Ti?p t?c vòng l?p

update_max:
    move $t3, $t5               # C?p nh?t giá tr? tuy?t ??i l?n nh?t
    move $t4, $t2               # C?p nh?t ph?n t? có giá tr? tuy?t ??i l?n nh?t
    j loop                      # Ti?p t?c vòng l?p

end_loop:
    # ? ?i?m này, $t4 ch?a ph?n t? có giá tr? tuy?t ??i l?n nh?t
    # B?n có th? th?c hi?n b?t k? thao tác nào khác v?i $t4 ? ?ây

# Tri?n khai tính toán giá tr? tuy?t ??i tùy ch?nh
abs:
    bltz $a0, negative           # N?u giá tr? là âm, nh?y ??n nhãn negative
    sub $v0, $zero, $a0         # N?u âm, tr? v? ??o ng??c c?a giá tr?
    j abs_end

negative:
    move $v0, $a0               # N?u d??ng, tr? v? cùng m?t giá tr?

abs_end:
    jr $ra                      # Tr? v? hàm g?i
