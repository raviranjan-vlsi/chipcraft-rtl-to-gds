module mux41(i, s, y);
 input wire [3:0] i;
 input wire [1:0] s;
 output reg y;

 always @(*)
      case(s)
	0: y = i[0];
	1: y = i[1];
	2: y = i[2];
	3: y = i[3];
	default: y = 1'b0;
     endcase

 
endmodule

