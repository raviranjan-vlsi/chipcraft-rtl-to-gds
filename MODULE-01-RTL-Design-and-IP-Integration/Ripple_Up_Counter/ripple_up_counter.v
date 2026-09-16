
//T-ff 
 module T_ff(clk, rst, q);
  input wire clk, rst;
  output reg q;

  always @(posedge clk or posedge rst)
   begin
    if(rst)   q<= 1'b0;
    else      q<= ~q;
   end 
 endmodule

 module ripple_up_counter(clk, rst, count);
  input wire clk, rst;
  output [3:0] count;

  reg q_0, q_1, q_2, q_3;

  //instantiation of T_ff to create ripple_up_counter
  T_ff T_ff0(clk, rst, q_0);
  T_ff T_ff1(~q_0, rst, q_1);
  T_ff T_ff2(~q_1, rst, q_2);
  T_ff T_ff3(~q_2, rst, q_3);

  assign count = {q_3, q_2, q_1, q_0};

 endmodule
