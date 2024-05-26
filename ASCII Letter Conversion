# This program stores the ASCII code for a character (a letter), it checks whether the letter is uppercase or lowercase. If the letter is lowercase, convert it to uppercase. If the letter is uppercase, leave it as it is. If the character is not a letter, assign -1 to the destination register to be outputted.
# When you compare with branches, your are comparing the binary representation of the characters, basically the same as decimal
# The ascii value is loaded into the register, which is why load immediate is used
# Also, since you are printing with code 11, the character is printed instead of the decimal value

.data
n: .word 'f'

.text
main:
    la t0, n
    lw a1, 0(t0)
    
    li a2, 'A'                  # the ascii value of A will be loaded into a2, which is why it is immediate
    bge a1, a2, checkUpper      # if the stored letter is greater than or equal to A, check if it is in the uppercase range
    
    blt a1, a2, notLetter       # if the stored letter is less than A, it is not a letter
    
checkUpper:
    li a3, 'Z'                   
    bge a3, a1, print           # if Z is greater than or equal to the stored letter, the stored letter is uppercase
    j checkLower
    
checkLower:                     # check if the values are between a & z
    li a2, 'a'
    li a3, 'z'
    bge a1, a2, checkLower2

checkLower2:                    # if values is between a & z, convert the letter to uppercase
    bge a3, a1, convertUpper    
    j notLetter
    
convertUpper:   
    addi a1, a1, -32             # convert the value from lower to upper and print
    j print
    j notLetter                 # if all else fails, it's not a letter, so jump to notLetter to print -1
    
notLetter:
    li a1, -1                   # print -1 since the stored letter is not a letter
    add a1, a1, x0
    li a0, 1
    ecall
    j end
    
print:
    add a1, a1, x0
    li a0, 11
    ecall
    j end
   
end:
    addi a0, x0, 10             # end the program
    ecall
