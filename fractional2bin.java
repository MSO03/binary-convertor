    class fractional2bin {
       static MIPS_OS_Interface mips = new MIPS_OS_Interface();
     
       static void fractional2bin(int fractional, 
                                  int precision, 
                                  int max_size) {

        int max = 0;
        int n = fractional;
        int count = 0;
        int tmp;

        //the java code for the pow() macro // max = (int)Math.pow(10, precision);
        max = 1;                           //result = max  //tmp = precison  //base = 10
        tmp = precision;
loop3:  for(; tmp != 0 ;) { 
           max = max * 10;
           tmp = tmp - 1;
           continue loop3;
        }
done3: ;


bb:       for(count=0; count < max_size; ) {
          n = n * 2;
          if (n == 0) break; //break to se
          if ( n >= max ) {
cons:   ;
            mips.print_di(1);
            n = n - max; 
            //break fi;
          } else {
alt:    ;
            mips.print_di(0);
            //break fi;
          }
fi:     ;
          count = count +1;
          continue bb;
        }
se:     ;
          return;
       }
     
       public static void main(String[] args){
         final int mantissa_size = 23;  
         // This is the number of bits in a binary32 mantissa
      
         int arg_0 = Integer.parseInt(args[0]);
         char arg_1 = args[1].charAt(0);
         int arg_2 = Integer.parseInt(args[2]);
         int precision = args[2].length();
      
         // dec2bin(arg_0);
         // mips.print_c(arg_1);
         fractional2bin(arg_2, precision, mantissa_size);
         mips.print_c('\n');
         return;
       } 
     }