
.data

n: .word 10

a: .word 10, 60, 40, 70, 20, 30, 90, 100, 0, 80, 50

space: .asciiz " "

newline: .asciiz "\n"
 
.text

.globl main
 
main:

    # Load n and the base address of array a

    lw $t0, n           # Load n into $t0

    la $t1, a           # Load the base address of array a into $t1
 
    # Outer loop: i = 0 to n-2

    li $t2, 0           # i = 0

outer_loop:

    # Load i into $t3

    move $t3, $t2       # $t3 = i
 
    # Inner loop: j = i+1 to n-1

inner_loop:

    # Calculate the addresses of a[i] and a[j]

    mul $t4, $t2, 4     # Calculate the offset (i*4)

    add $t5, $t1, $t4   # Calculate the address of a[i]

    addi $t6, $t3, 1    # j = i + 1

    mul $t6, $t6, 4     # Calculate the offset (j*4)

    add $t7, $t1, $t6   # Calculate the address of a[j]
 
    # Load a[i] and a[j]

    lw $t8, 0($t5)      # Load a[i] into $t8

    lw $t9, 0($t7)      # Load a[j] into $t9
 
    # Compare a[i] and a[j]

    ble $t8, $t9, not_swap
 
    # Swap a[i] and a[j]

    sw $t9, 0($t5)      # Store a[j] into a[i]

    sw $t8, 0($t7)      # Store a[i] into a[j]
 
not_swap:

    # Increment j

    addi $t3, $t3, 1    # Increment j
 
    # Check if j < n

    blt $t3, $t0, inner_loop
 
    # Increment i

    addi $t2, $t2, 1    # Increment i
 
    # Check if i < n-1

    blt $t2, $t0, outer_loop
 
    # Print sorted array

    li $v0, 4            # Print string syscall

    la $a0, newline

    syscall
 
    li $v0, 4            # Print string syscall

    la $a0, newline

    syscall
 
    li $v0, 4            # Print string syscall

    la $a0, newline

    syscall
 
    li $v0, 4            # Print string syscall

    la $a0, newline

    syscall
 
    li $v0, 4            # Print string syscall

    la $a0, newline

    syscall
 
    li $v0, 10           # Exit syscall

    syscall
