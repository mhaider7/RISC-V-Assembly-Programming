# This program uses the bubble sort method to sort an array in descending order. Create a separate method swap. Use ecalls to output the array.
# Don't need .global since we aren't linking to another file
.data                               
array: .word 7, 12, 4, -4, 66              # Initialize the array

# make sure you pick the right registers so they aren't reused
.text
main:
    la t0, array                            # load the array
    add t1, x0, x0                          # initialize i = 0 
    addi t2, x0, 5                          # ARRAY SIZE INITIALIZER
    add t3, x0, x0                          # print counter
    
loop1:                                      # create the first loop
    beq t1, t2, print                       # this branch allows a loop for 5 times (checks to sort the array 5 times)
    addi t1, t1, 1                          # increment the counter for the first loop
    addi t4, x0, 0                          # initialize the indexes to be checked ( j & j+1)
    addi t5, x0, 1
loop2:                                      # create the second loop which will sort the elements
    beq t5, t2, loop1                       # check if the inner loop has checked to sort each element for the round
    slli a2, t4, 2                          # a2 = 0, 4, 8, 12
    slli a3, t5, 2                          # a3 = 4, 8, 12, 16
    add s1, t0, a2                          # s1 = array + 4i
    lw a4, 0(s1)                            # load the element into s1
    add s2, t0, a3                          # s2 = array + 4i
    lw a5, 0(s2)                            # load the (element + 1) into s2
    blt a4, a5, swap                        # if s1(j) < s2(j+1), call the swap function, for decreasing order
    addi t4, t4, 1                          # increment the two counters for the inner loop
    addi t5, t5, 1
    j loop2
    
# may need to save the return address to use the "ret" keyword in this function
swap:                                       # create the swap function to swap two elements in the array
    sw a5, 0(s1)                            # swap the values into the opposite memory locations
    sw a4, 0(s2)
    addi t4, t4, 1                          # increment the two counters for the inner loop
    addi t5, t5, 1
    j loop2                                 # return to loop2
     
print:                                      # function to print the sorted array
    beq t3, t2, exit                        # exit once the counter = length of the array
    slli a6, t3, 2                          # a6 = t3*4
    add s3, t0, a6                          # s3 = array address + a6
    lw s3, 0(s3)                            # load the value from the memory address
    
    add a1, s3, x0                          # use ecall to print the integer
    addi a0, x0, 1
    ecall
    
    addi a1, x0, ' '                        # print a space to space each output
    addi a0, x0, 11
    ecall
    
    addi t3, t3, 1                          # increment the print counter
    j print
    
exit:                                       # code to exit the program
    addi a0, x0, 10     
    ecall
    
    
 
