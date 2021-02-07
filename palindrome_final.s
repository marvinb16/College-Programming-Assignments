# $s7 - save $ra
# $s2 - current address of the string to be tested
# $s3 - the next of the last string to be tested 
# $a0 - for function parameter / syscall parameter
# $v0 - syscall number / function return value

.text
.globl palindrome

palindrome:

# $s2 is the current of the string to be tested

	sub $sp, $sp, 8 # freeing up the memory on the stack
	# la $a0, $s2 
	sw $ra, 0($sp) # saving the return address to the stack
	sw $s2, 4($sp) # saving the string to stack
	
	# need to get the string length now
	
	jal string_length
	
	move $t0, $v0 # saving the result from the string_length
	
	lw $a0, 4($sp)
	
	li $v0, 1 # setting the return to 1 already by default
	
	li $t2, 1 # counter variable
	
	div $t3, $t0, 2 # diving the string length by 2
	
	addi $t3, $t3, 1 # adding 1
	
pal_loop: #this is hard man

	bge $t2, $t3, exit_loop # when the counter is @ half, exit
	
	lb $t4, 0($a0) # loading the character now
	
	sub $t5, $t0, $t2 #subtracting counter from string_length
	
	add $t6, $t5, $t1 #adding the end of string to the start
	
	lb $t7, 0($t6) # get the character from the end
	
	#check on to continue or exit
	beq $t4, $t7, continue
	
	li $v0, 0 # if this check fails load 0 and then exit
	
	j exit_loop

continue:

	addi $a0, $a0, 1 #shifting pointer by 1
	
	addi $t2, $t2, 1 # counter++
	
	j pal_loop
	
	
exit_loop:

	lw $ra, 0($sp) #returning origional return address
	
	addi $sp, $sp, 8 #freeing the hostage stack
	
	jr $ra #return



string_main: # jumping to this for start then looping the length

	li $v0, 0	
	
string_length:

# need to move this
#	li $v0, 0 # setting return to 0
	
	lb $t0, 0($a0)
	
	beq $t0, $0, string_exit
	
	addi $a0, $a0, 1 # shifting the pointer one to the right
	
	addi $v0, $v0, 1 #incrementing the value of the size by 1
	
	j string_length #looping the length for the length
	
	
string_exit:

	jr $ra #returning back to palindrome
