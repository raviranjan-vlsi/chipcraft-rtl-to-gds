module testbench;
 reg [3:0] in;
 reg [1:0] s;
 wire y;

 //instantiation of dut 
 mux41 dut (.i(in), .s(s), .y(y));

 initial begin 
   $dumpfile("mux41_dump.vcd");
   $dumpvars;
 end

 initial begin
   //$monitor("time = %0t | input = %b | select = %b | output = %b", $time, in, s, y);

   //#10;

   //in = 4; s = 0; #10;
   //in = 4; s = 1; #10;
   //in = 4; s = 2; #10;
   //in = 4; s = 3; #10;

   //#20;

   //in = 15; s = 0; #10;
   //in = 15; s = 1; #10;
   //in = 15; s = 2; #10;
   //in = 15; s = 3; #10;
  
   //#10; 

   //in = 10; s = 0; #10;
   //in = 10; s = 1; #10; 
   //in = 10; s = 2; #10; 
   //in = 10; s = 3; #10;
   
   test_mux(4, 0);
   test_mux(4, 1);
   test_mux(4, 2);
   test_mux(4, 3);

   test_mux(10, 0);
   test_mux(10, 1);
   test_mux(10, 2);
   test_mux(10, 3);

   test_mux(12, 0);
   test_mux(12, 1);
   test_mux(12, 2);
   test_mux(12, 3);

 end

 task test_mux(input [3:0] test_i, input[1:0] test_s);

    begin
	 in = test_i;
	 s  = test_s;

	 #1;

	 $display("time = %0t | in = %b | s = %b | y = %b ", $time, in , s, y);
	 #9;


    end

 endtask

 initial begin
	#200;
       $finish;	
 end

endmodule
