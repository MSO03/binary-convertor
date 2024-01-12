       .data
N:     .word  34

       .text
       .globl fractional2bin
       .include "macros/syscalls.s"
       .include	"macros/stack.s"

       li $a0, 23
       li $a1, 2
       li $a2, 23
       jal fractional2bin
       exit()

.macro pow(%result, %base, %exp)		# max = %result  //tmp = $t9  //10 = %base
	li %result, 1						# max = 1; 
	move $t9, %exp						# tmp = %exp;
loop3:	beq $t9, 0, done3				# loop3:  for(; tmp != 0 ;) { 
	mul %result, %result, %base			#            max = max * 10;
	subi $t9, $t9, 1					#            tmp = tmp - 1;
	b loop3								#            continue loop3;
										#         }
done3: nop								# done3: ;
.end_macro

fractional2bin: 
	   # fractional2bin(int fractional, 
	   #                int precision, 
	   #                int max_size) {  

       # a0 : fractional       # The value of N
       # a1 : precision
       # a2 : max_size
       # v0 : 0       		   # The return value, which is zero

       # t0 : fractional     
       # t1 : precision
       # t2 : max_size
       # t3 : max
       # t4 : n
       # t5 : count
       # t6 : 2
       # t7 : 10

       # Demarshall input arguments
       move $t0, $a0
       move $t1, $a1
       move $t2, $a2
																			
   			li $t3, 0									# int max = 0;
			move $t4, $t0								# int n = fractional;
			li $t5, 0									# int count = 0;
			li $t6, 2
			li $t7, 10

			pow($t3, $t7, $t1)							# max = (int)Math.pow(10, precision);
	bb: 	bge $t5, $t2, se  							# for(count=0; count < max_size; ) {
				sll $t4, $t4, 1  						# 	n = n * 2; (shifting same as mult)
				beq $t4, $zero, se						#   if (n == 0) break; //break to se

				blt $t4, $t3, alt						#   if ( n >= max ) {
	cons:   		nop									#   ;
					print_ci('1')						#    mips.print_di(1);
					sub $t4, $t4, $t3					#    n = n - max; 
					b fi								#    //break fi;
														#    } else {
	alt:    		nop									#    ;
					print_ci('0')						#     mips.print_di(0);
					b fi								#     //break fi;
														#    }
	fi: 		nop    									#    ;
				addi $t5, $t5, 1						#     count = count +1;
			b bb					   				    #     continue bb;
														#    }
	se:     nop											#    ;

     

       # Marshal output arguements
       li $v0, 0
       jr $ra

