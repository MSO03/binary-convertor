       .text
       .globl dec2bin
       .include "macros/syscalls.s"
       .include "macros/stack.s" 
       .include "macros/subroutine.s"      

       li $a0, 1234
       li $a1, '.'
       li $a2, 1234567
       li $a3, 7
       jal dec2bin
       exit()
       # output should be
       # 10011010010.00011111100110101101101


dec2bin:  # void dec2bin( whole, radix, fractional, precision )
       # a0: whole
       # a1: radix
       # a2: fractional
       # a3: precision
       # v0: 0

       # t0: whole
       # t1: radix
       # t2: fractional
       # t3: precision
       # t4: mantissa_size


       # Demarshal your input arguments
       move $t0, $a0
       move $t1, $a1
       move $t2, $a2
       move $t3, $a3
      
       li $t4, 23                    #     final int mantissa_size = 23;  

       marshal_args($t0)
       save_state()              
       jal whole2bin                 #     whole2bin( whole );
       restore_state()
       demarshal_results()
 
       print_c($t1)                  #     mips.print_c( radix );

       marshal_args($t2, $t3, $t4)
       save_state()
       jal fractional2bin            #     fractional2bin(fractional, precision, mantissa_size);
       restore_state()
       demarshal_results()

       print_ci('\n')                #     mips.print_c('\n');


       # Marshal your output arguments
       li $v0, 0
       jr $ra


       