module testbench;
 reg [3:0] in; 
 reg [1:0] s;
 wire y;

 //instantaition of DUT 
 mux41 dut(.i(in), .s(s), .y(y));

 //initail blocks 
 
 initial begin 
	 //stimuli
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

 initial begin
	 #200;
	 $finish;
 end

 initial begin
	 $dumpfile("mux41_dump.vcd");
	 $dumpvars;
 end


 task test_mux(input [3:0] test_in,input [1:0] test_s );

  begin
    in = test_in;
    s = test_s;
   
    #1;

    $display("time = %0t | in = %b | s = %b | y = %b ", $time, in, s, y);
    #9;
    	      
      end

 endtask


 endmodule
