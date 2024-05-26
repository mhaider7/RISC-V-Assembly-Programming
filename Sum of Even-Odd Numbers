# This program should declare and array. Then loop through the array adding up all of the even numbers and all of the odd numbers, then displaying the sums for each.
# Use the appropriate convention

.data
# declare of length 22
arr: .word 3, 8, 6, 4, 2, 7, 9, 2, 4, 2, 5, 8, 1, 5, 5, 2, 1, 3, 2, 3, 6, 9
str1: .string "Even total: "
str2: .string "Odd total: "

.text
main:
    la t0, arr                  # load the array
    la s3, str1
    la s4, str2
    li t1, 0                    # create counter (i)
    li t2, 22                   # length of array
    li t4, 2
    li s1, 0                    # saved register even
    li s2, 0                    # saved register odd
    
    # loop through the array
loop: 
    slli a0, t1, 2              # a0 = 4i
    add a0, t0, a0              # a0 = arr + 4i
    lw a1, 0(a0)                # load the word from the word address into s1
    rem t3, a1, t4               # check if the value is even
    beq t3, zero, evenSum         # if t3 = 0 (meaning even), then jump to the label
    j oddSum              # if not even, jump to odd sum
    next:
    addi t1, t1, 1              # increment counter        
    bne t1, t2, loop            # if counter != 22, repeat loop
    j finish
    
    # functions for adding up the event and odd numbers
evenSum:
    add s1, s1, a1
    j next
    
oddSum:
    add s2, s2, a1
    j next
    
    # display output (take note of when a1 & a0 are used)
finish:
    add a1, s3, x0              # display string
    addi a0, x0, 4
    ecall

    add a1, s1, x0                   # display the even total
    addi a0, x0, 1
    ecall
    
    addi a1, x0, '\n'                 # print a new line
    li a0, 11
    ecall
    
    add a1, s4, x0                   # display string
    li a0, 4
    ecall
    
    add a1, s2, x0                   # display the odd total
    addi a0, x0, 1
    ecall
    
    addi a0, x0, 10             # exit program
    ecall
