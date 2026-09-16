 module testbench;
  reg clk, rst, select;
  wire [3:0] count;

  //instantiation of DUT 
  ripple_up_down_counter dut(.clk(clk), .rst(rst), .switch(select), .count(count));

  //clock generation 
  always #5 clk = ~clk;

  initial begin 
   clk= 0; 
   rst = 1;
   select = 0;

   $display("Simulation Started ................");
   $monitor("time = %t | clk = %b | rst = %b | select = %b | count = %h", $time, clk, rst, select, count);
   
   #4;
   rst = 0;
   #200;
   select = 1;
   #4;
   rst = 1; 
   #4;
   rst = 0;
   
  end

  initial begin 
   $dumpfile("ripple_up_down_counter_dump.vcd");
   $dumpvars;
  end

  initial begin 
   #500;
   $finish;
  end

 endmodule
