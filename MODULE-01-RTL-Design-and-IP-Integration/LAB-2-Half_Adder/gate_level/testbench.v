module testbench;
 reg x, y ;
 wire s, c;

 //instantiation of dut 
 half_adder dut(.a(x), .b(y), .sum(s), .carry(c) );

 initial begin 
   #4;
   half_adder_test(0, 0);
   half_adder_test(0, 1);
   half_adder_test(1, 0);
   half_adder_test(1, 1);
 end

 initial begin
  x = 0; 
  y = 0;
   
 end

 initial begin
  #100;
  $finish;
 end

 task half_adder_test(input x_test, y_test);
  
	 x = x_test;
	 y = y_test;

	 #1;
	 $display("time = %0t | x = %b | y = %b | sum = %b | carry = %b", $time, x, y, s, c);
	 #9;

 endtask 
 initial begin
   $dumpfile("half_adder_dump.vcd");
   $dumpvars;
 end
endmodule 
