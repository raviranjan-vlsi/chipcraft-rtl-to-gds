`timescale 1ns/1ps
module jk_ff(clk, rst, j, k, q );
 input j, k, clk, rst;
 output reg q;

 always @(posedge clk)
  begin
   if(rst) q <= 1'b0;
   else
	   case({j, k})
	    2'b00: q<=q;
	    2'b01: q<=1'b0;
	    2'b10: q<=1'b1;
	    2'b11: q<=~q;
	    default: q <= 1'b0;
	   endcase
  end

endmodule
