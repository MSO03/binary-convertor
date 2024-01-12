       .data
N:     .word  34

       .text
       .globl whole2bin
       .include "macros/syscalls.s"
       .include "macros/stack.s"

       lw $a0, N
       jal whole2bin
       exit()

.macro mod(%dst,%src1, %src2)
       div %src1, %src2
       mfhi %dst
.end_macro
whole2bin:              # int dec2bin(int number);

       # a0 : number    # The value of N
       # v0 : 0         # The return value, which is zero

       # t0 : number     
       # t1 : count 
       # t2 : d
       # t3 : n
       # t4 : rem
       # t5 : 2

       # Demarshall input arguments
       move $t0, $a0

       li $t1, 0                                                                 #       int count = 0;
       li $t2, 3                                                                 #       int d = 3;
       move $t3, $t0                                                             #       int n = number;
       li $t4, 0                                                                 #       int rem = 0;
       li $t5, 2                                                                 #       two = 2;
                                                                                 # 
ydob:  beq $t3, $zero, enod                                                      #       for(; n != 0 ;){
         mod($t4, $t3, $t5)                                                      #          rem = n%2;
              # div $t3, $t5
              # mfhi $t4                                                         
         div $t3, $t3, $t5                                                       #          n = n/2;
              # div $t3, $t5
              # mflo $t3
         push($t4)                                                               #          mips.push(rem);
         addi $t1, $t1, 1                                                        #          count = count + 1;
       b ydob                                                                    #          continue ydob;
                                                                                 #        }
enod:  nop                                                                       #        ; 
                                                                                 # 
loop:  ble $t1, $zero, done                                                      #        for ( ; count > 0;) {
         pop($t2)                                                                #            d = mips.pop();
         subi $t1, $t1, 1                                                        #            count = count - 1;
         print_d($t2)                                                            #            mips.print_d(d);
       b loop                                                                    #            continue loop;
                                                                                 #        }
done:  nop                                                                       #        ;
                                                                               
       # Marshal output arguements
       li $v0, 0
       jr $ra

