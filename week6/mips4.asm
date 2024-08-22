
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
 
    # Outer loop: i = 1 to n-1

    li $t2, 1           # i = 1

outer_loop:

    # Inner loop: j = i to 1

    move $t3, $t2       # j = i

inner_loop:

    # Calculate the address of a[j] and a[j-1]

    mul $t4, $t3, 4     # Calculate the offset (j*4)

    add $t5, $t1, $t4   # Calculate the address of a[j]

    sub $t6, $t3, 1     # Calculate j - 1

    mul $t6, $t6, 4     # Calculate the offset (j-1)*4

    add $t7, $t1, $t6   # Calculate the address of a[j-1]
 
    # Load a[j] and a[j-1]

    lw $t8, 0($t5)      # Load a[j] into $t8

    lw $t9, 0($t7)      # Load a[j-1] into $t9
 
    # Compare a[j-1] and a[j]

    bge $t9, $t8, not_swap
 
    # Swap a[j-1] and a[j]

    sw $t8, 0($t7)      # Store a[j] into a[j-1]

    sw $t9, 0($t5)      # Store a[j-1] into a[j]
 
not_swap:

    # Decrement j

    subi $t3, $t3, 1    # Decrement j
 
    # Check if j > 0

    bgtz $t3, inner_loop
 
    # Print array after this iteration

    li $t3, 0            # Reset j

    print_loop:

        mul $t4, $t3, 4    # Calculate the offset (j*4)

        add $t5, $t1, $t4  # Calculate the address of a[j]
 
        lw $a0, 0($t5)     # Load current array element

        li $v0, 1          # Print integer syscall

        syscall
 
        li $v0, 4          # Print space syscall

        la $a0, space

        syscall
 
        addi $t3, $t3, 1   # Increment j

        blt $t3, $t0, print_loop  # Continue print loop if j < n
 
    # Print newline

    li $v0, 4            # Print string syscall

    la $a0, newline

    syscall
 
    # Increment i

    addi $t2, $t2, 1    # Increment i
 
    # Check if i < n-1

    blt $t2, $t0, outer_loop
 
    # Exit program

    li $v0, 10           # Exit syscall

    syscall

