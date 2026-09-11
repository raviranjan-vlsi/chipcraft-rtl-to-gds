module mux41(i, s, y);
 input wire [3:0] i;
 input wire [1:0] s;
 output wire y;

 wire [1:0] s_bar;
 wire [3:0] and_op;

 //s_bar generation 
 not(s_bar[0], s[0]);
 not(s_bar[1], s[1]);

 and(and_op[0],  s_bar[1],s_bar[0],  i[0]);
 and(and_op[1],  s_bar[1],s[0],  i[1]);
 and(and_op[2],  s[1],s_bar[0],  i[2]);
 and(and_op[3],  s[1],s[0],  i[3]);


 or(y, and_op[0], and_op[1], and_op[2], and_op[3]);
 
endmodule
