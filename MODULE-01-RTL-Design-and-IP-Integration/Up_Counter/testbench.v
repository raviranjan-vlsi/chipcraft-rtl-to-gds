module testbench;
 reg clk, rst;
 wire [31:0]count;
 

 //instantiation of dut
 up_counter dut (.clk(clk), .rst(rst), .count(count));

 //clock generation 
 always #5 clk = ~clk;

 //initialization
 initial begin 
  clk = 0;
  rst = 0;
 end 

 // dump value changes for waveform view inside gtkwave
 initial begin 
   $dumpfile("up_counter_dump.vcd");
   $dumpvars;
 end

 //finish simulation 
 initial begin
   #200;
   $finish;
 end

 //applying stimulus
 initial begin 
   counter_test(0, 20);
   counter_test(1, 5);
   counter_test(0, 40);
   counter_test(1, 5);
   counter_test(0, 30);
   counter_test(1, 5);
     
 end
 
 task counter_test (input rst_test, input time delay_test);
   time delay;

   rst = rst_test;
   delay = delay_test;

   #1;
   $monitor("time =%0t | clk = %b | rst = %b | count = %d", $time, clk, rst, count);
   #delay;
 endtask


endmodule
