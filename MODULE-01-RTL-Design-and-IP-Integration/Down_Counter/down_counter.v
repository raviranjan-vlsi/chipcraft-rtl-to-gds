
//16 - bit down counter with asynchronous reset
module down_counter(clk, rst, count);
 input wire clk, rst;
 output reg [15:0] count;

 always @(posedge clk, posedge rst)
  begin 
    if(rst)   count = {16{1'b1}};
    else      count = count - 1;
  end
endmodule
