module testbench;
 reg [3:0] in; 
 reg [1:0] s;
 wire y ; 

 //instantiation of design module
 mux41 dut (.i(in) , .s(s), .y(y));

 //initialization
 initial begin
    in  = 0; 
    s = 0; 
   
 end

// applying stimuli 
 initial begin
    #4;
    mux_test(4, 0);
    mux_test(4, 1);
    mux_test(4, 2);
    mux_test(4, 3);


    mux_test(10, 0);
    mux_test(10, 1);
    mux_test(10, 2);
    mux_test(10, 3); 
    
   mux_test(12, 0);
   mux_test(12, 1);
   mux_test(12, 2);
   mux_test(12, 3);

 end

 initial begin
   $dumpfile("mux41_dump.vcd");
   $dumpvars;
 end

 // finish simulation
 initial begin 
	 #140; 
	 $finish;
    
 end  


 //task to apply stimulus and  display all ports value 
 task mux_test(input [3:0] test_in, input [1:0] test_s);
  begin
     in = test_in;
     s = test_s;
      
     #1;

     $display("time = %0t | in = %b | s = %b | y = %b", $time , in, s, y);
     #9;

  end

 endtask



endmodule
