.data
array: .word 1, -3, 5, -7, 9   # M?ng v� d?
array_size: .word 5             # S? ph?n t? trong m?ng

.text
main:
    lw $t0, array_size          # T?i s? ph?n t? trong m?ng
    la $t1, array               # T?i ??a ch? c?a m?ng
    lw $t2, 0($t1)              # T?i ph?n t? ??u ti�n c?a m?ng
    abs $t3, $t2                # T�nh gi� tr? tuy?t ??i c?a ph?n t? ??u ti�n
    move $t4, $t2               # Kh?i t?o $t4 v?i gi� tr? c?a ph?n t? ??u ti�n

loop:
    addi $t0, $t0, -1           # Gi?m b? ??m
    beq $t0, $zero, end_loop    # N?u b? ??m b?ng kh�ng, tho�t kh?i v�ng l?p

    lw $t1, 4($t1)              # T?i ph?n t? ti?p theo c?a m?ng
    abs $t5, $t1                # T�nh gi� tr? tuy?t ??i c?a ph?n t? hi?n t?i
    bgt $t5, $t3, update_max    # N?u gi� tr? tuy?t ??i hi?n t?i l?n h?n, c?p nh?t max
    j loop                      # Ti?p t?c v�ng l?p

update_max:
    move $t3, $t5               # C?p nh?t gi� tr? tuy?t ??i l?n nh?t
    move $t4, $t2               # C?p nh?t ph?n t? c� gi� tr? tuy?t ??i l?n nh?t
    j loop                      # Ti?p t?c v�ng l?p

end_loop:
    # ? ?i?m n�y, $t4 ch?a ph?n t? c� gi� tr? tuy?t ??i l?n nh?t
    # B?n c� th? th?c hi?n b?t k? thao t�c n�o kh�c v?i $t4 ? ?�y

# Tri?n khai t�nh to�n gi� tr? tuy?t ??i t�y ch?nh
abs:
    bltz $a0, negative           # N?u gi� tr? l� �m, nh?y ??n nh�n negative
    sub $v0, $zero, $a0         # N?u �m, tr? v? ??o ng??c c?a gi� tr?
    j abs_end

negative:
    move $v0, $a0               # N?u d??ng, tr? v? c�ng m?t gi� tr?

abs_end:
    jr $ra                      # Tr? v? h�m g?i
