# This programs takes the sum of two large numbers, the sum is larger than the 32 bit representation range. The output is printed in hex.
.data
a: .word 2147483635
b: .word 20

.text
main:
    # load registers
    la t0, a
    lw t0, 0(t0)
    la t1, b
    lw t1, 0(t1)
    li t2, -1
    
    # use srai to shift to the highest bit of the binary (to check the sign of each operand)
    srai t3, t0, 31
    srai t4, t1, 31
    # if output is 0, overflow "may" occur, otherwise it didn't (since the sum of a positive and negative will never be overflowed)
    xor a2, t3, t4 
    beq a2, x0, overflow
    
noOverflow:    
    # add the non-overflow values and ouput
    add a2, t0, t1
    
    add a1, a2, x0                          # output for 32 bit in hex
    addi a0, x0, 34
    ecall
    
    li a0, 10                               # end program
    ecall
    
overflow:
    # check if the "possible" overflow really is an overflow
    add a2, t0, t1                          # add the possible overflow values
    srai a3, a2, 31                         # find the highest bit of the sum
    xor t3, a3, t3                          # check if the sign(highest bit) is the same as the operand, if they are opposite, then an overflow occured, 
    beq t3, x0, noOverflow
    
    # intialize variables for use
    li t4, 10                       
    li t5, 28
    
    # check whether the overflow sum was positive or negative
    slti t3, a2, 0                          # "set less than" if the sum is negative, t3 = 1, if sum is positive, t3 = 0
    beq t3, x0, changeToNegative
    
changeToPositive:
    # negative number will extend to 64 bit by adding 0s, making it positve
    add a1, x0, x0
    addi a0, x0, 34
    ecall
    
    addi a1, x0, ' '                        # output a space to separate the 64 bits
    addi a0, x0, 11
    ecall
    
    j hex
 
changeToNegative:
    # positive number will extend to 64 bit by adding Fs, making it negative
    add a1, t2, x0
    addi a0, x0, 34
    ecall
    
    addi a1, x0, ' '                        # output a space to separate the 64 bits
    addi a0, x0, 11
    ecall
    
    j hex
    
    # function to print out the hex value
hex:  
    # take out the first 4 bits of the sum
    srl a3, a2, t5
    andi a3, a3, 15                         # compare with 1111, to show the hexadecimal value
    bge a3, t4, character                   # if the hexadecimal value is 10 or greater, it is a character (so jump to function)
    
    add a1, a3, x0                          # output the number value
    addi a0, x0, 1
    ecall
        
    addi t5, t5, -4                         # decrement counter for "srl" usage
    blt t5, x0, exit                        # if t5 < 0, all bits have been accounted for, so exit
    j hex
    
character:
    # add 55 to the decimal value and print out using character code
    addi a3, a3, 55
    
    add a1, a3, x0                          # output correct hex character by adding 55 (ascii)
    addi a0, x0, 11
    ecall
        
    addi t5, t5, -4                         # decrement counter and check if all bits have been compared and converted
    blt t5, x0, exit
    j hex
     
exit:
    li a0, 10                               # exit program
    ecall
    
