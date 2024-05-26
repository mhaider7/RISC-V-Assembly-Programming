# This program converts the code from midterm2.s into a function. This program loops through a string checking each letter eventaully displaying the string as all uppercase. The program should exit if a non-letter character is found within the string.
# To load a character from a string, use load byte to load a character, then increment the address register by "1", not 4 like in lw

.data

s: .string "thIs is a sTring"

.text
main:
    la t0, s                    # load the string address into the register
    li t1, 32
    li t3, 'A'
    li t4, 'z'
    li t5, 'Z'
    li t6, 'a'
    
    lb a0, 0(t0)                # use load byte to load a character from the string
    
# the importance of error checking to produce the right output, is in finding the correct order
checkCharacter:
    blt a0, t3, notLetter       # if letter < A, not a letter
    blt t4, a0, notLetter       # if z < letter, not a letter
    bge a0, t3, check           # if letter >= A, check if it is less then Z
check:
    bge t5, a0, print           # if Z >= letter, its uppercase already, so print it
    bge a0, t6, convertToUpper  # if letter >= a, a lower case letter, convert it to uppercase
    
print:
    add a1, a0, x0              # if the label is bypassed, continue to print the letter
    li a0, 11
    ecall
    addi t0, t0, 1
    lb a0, 0(t0)
    j checkCharacter            # don't use ret since there is no explicit function calls to the print function
  
convertToUpper:
    addi a0, a0, -32
    add a1, a0, x0
    li a0, 11
    ecall
    addi t0, t0, 1
    lb a0, 0(t0)
    j checkCharacter
    
notLetter:                      
    beq a0, t1, print           # check if the character is a space, if so, increment and jump back
    addi a0, x0, 10             # end the program if a non-character is found
    ecall
    
    
