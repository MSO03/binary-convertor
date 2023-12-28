class whole2bin {
   static MIPS_OS_Interface mips = new MIPS_OS_Interface();

   static void whole2bin(int number) {

         int count = 0;
         int d = 3;
         int n = number;
         int rem = 0;

ydob:    for(; n != 0 ;){
            rem = n%2;
            n = n/2;
            mips.push(rem);
            count = count + 1;
            continue ydob;
         }
enod:  ; 

loop:    for ( ; count > 0;) {
            d = mips.pop();
            count = count - 1;
            mips.print_d(d);
            continue loop;
         }
done: ;

         mips.print_ci('\n');

   }



 public static void main(String[] args){
     // This method has been written as a driver to test
     // your strlen.  You do NOT need to modify this method
     // Focus your attention to the `strlen` method.

         int arg_0;

         arg_0  = Integer.parseInt(args[0]);
         whole2bin(arg_0);
         return;
  }
}