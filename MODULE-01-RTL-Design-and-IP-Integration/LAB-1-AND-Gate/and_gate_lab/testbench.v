module testbench;
 reg a, b;
 wire y;

 //instantiation of design module
 and_gate dut (.a(a), .b(b), .y(y));

 initial begin 
	 $monitor("time = %t | a = %d | b = %d | y = %d",$time,  a, b, y);

	 #10
	 a = 0; b = 0; #10;
	 a = 0; b = 1; #10;
	 a = 1; b = 0; #10;
	 a = 1; b = 1; #10;

 end 

 initial begin
	 $dumpfile("and_gate_vcd.vcd");
	 $dumpvars(0, testbench);
 end 


 initial begin
	 #100
	 $finish;
		
 end 
endmodule 
