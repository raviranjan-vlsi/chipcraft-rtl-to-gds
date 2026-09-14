 module testbench;

  reg clk, rst;
  wire [15:0] count;

  //instantiation of dut 
  down_counter dut(.clk(clk), .rst(rst), .count(count));

  //clock generation 
  always #5 clk = ~clk;

  //value change dump for simulation waveform 
  
   
  
  initial begin
   clk = 1; 
   rst = 1;

  end

  initial begin 
	  $display("starting simulation .....");
   $monitor("time = %0t | clk = %b | rst = %b | count = %h", $time, clk, rst, count);

    $dumpfile("down_counter_dump_.vcd");
   $dumpvars(0, testbench);

    
   #12; 
   rst = 0;

   #80;
   rst = 1;
   
   #10;
   rst = 0;

  
     
  end


  //finish simulation 
  initial begin 
   #400;
   $finish;
  end 
 endmodule
