.data
	
Elements:
	.string "Enter elements: "

Array:
	.word 0,0,0,0,0,0,0,0,0,0	
			
Maximum:
	.string "Maximum Element: "
	
Minimum:
	.string "// Minimum Element: "
		
.text
main:

la a0, Elements
li a7, 4
ecall

la a1, Array
addi t1, a1, 40

Input:
li a7,5
ecall
sw a0, 0(a1)
addi a1, a1, 4
bne t1, a1, Input

addi a1, a1, -40

addi x6, x0,10 # our max size in array
add x5, x0, x0 # our counter (till last array element)
	lw x15, 0(a1) # x15 is max element initilized as A[0]
	lw x16, 0(a1) # x16 is min element initilized as A[0]

Loop: lw x7, 0(a1)  # load A[0]
	blt x7, x16, Min # if x7 < x16, go to Min
	bge x7, x15, Max # if x7 > x15, go to Max
	beq x0, x0, End # unconditional jump if not min or max
Min : add x16, x7, x0 # then x7 is the new min
	beq x0, x0, End # Unconditional Jump
Max:  add x15, x7, x0 # then x7 is the new max
End:  addi a1, a1, 4 # increment to next element in array
	addi x5, x5, 1 # increment x5
	blt x5, x6, Loop # break when counter surpasses array size
	
	
la a0, Maximum
li a7, 4
ecall

addi a0, x15, 0
li a7, 1
ecall

la a0, Minimum
li a7, 4
ecall

addi a0, x16, 0
li a7, 1
ecall