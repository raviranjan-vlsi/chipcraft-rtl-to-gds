
`timescale 1ns/1ps

module testbench;
  reg clk, rst, j, k;
  wire q;

  //instantiation of dut
   jk_ff dut(.j(j), .k(k),.q(q), .clk(clk),.rst(rst) );

   //clock generation
   always #5 clk = ~clk;

 initial begin 
  $dumpfile("jk_ff_dump.vcd");
  $dumpvars;
 end

 initial begin 
  j = 1'b0;
  k = 1'b0; 
  clk = 1'b0;
  rst = 1'b0;
 end


 initial begin 

   #5;

   jk_ff_test(0, 0, 1);
   jk_ff_test(0, 1, 1);
   jk_ff_test(1, 0, 1);
   jk_ff_test(1, 1, 1);

   jk_ff_test(0, 0);
   jk_ff_test(0, 1);
   jk_ff_test(1, 0);
   jk_ff_test(1, 1);

   jk_ff_test(0, 0);
   jk_ff_test(0, 1);
   jk_ff_test(1, 0);
   jk_ff_test(1, 1);

   jk_ff_test(0, 1);
   jk_ff_test(1, 0);
   jk_ff_test(0, 0);
   jk_ff_test(1, 1);

   jk_ff_test(0, 0);
   jk_ff_test(0, 1);
   jk_ff_test(1, 0);
   jk_ff_test(1, 1);

 
 end

 initial begin 
  #240; 
  $finish;
 end

 task jk_ff_test(input j_test, input k_test, input rst_test = 1'b0);
   j = j_test;
   k = k_test;
   rst = rst_test;

   #1;
   $display("time = %0t | j = %b | k = %b | q = %b | clk = %b | rst = %b", $time, j, k , q, clk, rst);

   #9;
 endtask
endmodule

