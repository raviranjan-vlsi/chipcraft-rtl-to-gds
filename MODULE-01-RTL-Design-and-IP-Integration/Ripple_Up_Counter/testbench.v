 module testbench;
  reg clk, rst;
  wire [3:0] count;

  //instantiation of design module
  ripple_up_counter dut(.clk(clk), .rst(rst), .count(count));

  //clock generation 
  always #5 clk = ~clk;


  initial begin 
   clk = 0;
   rst = 1;

   $monitor("Simulation started ............");
   $monitor("time = %0t | clk = %b | rst = %b | count = %d", $time, clk, rst, count);

   #5;
   rst = 0; 

   #200;
   rst = 1;
   #5;
   rst = 0;

  end

  initial begin 
   $dumpfile("ripple_up_counter_dump.vcd");
   $dumpvars;

  end


  initial begin 
   #400;
   $finish;
  end 
 endmodule
