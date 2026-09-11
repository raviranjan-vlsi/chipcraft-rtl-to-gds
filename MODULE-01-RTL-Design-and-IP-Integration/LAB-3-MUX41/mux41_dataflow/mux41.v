module mux41(i, s, y);
 input wire [3:0] i; 
 input wire [1:0] s;
 output wire y;

 //mux functionality 
 assign y = (~s[1] & ~s[0] & i[0]) |
	    (~s[1] & s[0] & i[1]) |
            (s[1] & ~s[0] & i[2]) |
            (s[1] & s[0] & i[3]);

endmodule

