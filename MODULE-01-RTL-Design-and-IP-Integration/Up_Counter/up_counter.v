module up_counter(clk, rst, count);
 input wire clk, rst;
 output reg [31:0] count;

 always @(posedge clk)
   begin 
     if(rst) count <= 32'd0;
     else    count <= count + 32'd1;
   end
endmodule
