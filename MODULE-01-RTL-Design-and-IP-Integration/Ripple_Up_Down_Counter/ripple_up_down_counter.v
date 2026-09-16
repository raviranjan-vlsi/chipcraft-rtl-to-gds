 //T-FF 
 module T_ff( 
   input clk, 
   input rst, 
   output reg q   
 );

 always @(posedge clk or posedge rst)
  begin
   if(rst)   q<= 1'b0;
   else      q<= ~q;
  end
 endmodule

 //2 to 1 MUX
 module mux21(
   input wire [1:0] i,
   input wire select,
   output reg mux_out
   );

   always @(*)
    begin
     case(select)
      1'b0: mux_out = i[0];
      1'b1: mux_out = i[1];
      default: mux_out = 1'b0;
      endcase
    end
 endmodule

module ripple_up_down_counter( 
    input clk,
    input rst,
    input switch,
    output [3:0] count    
  );

  reg q_0, q_1, q_2, q_3;
  reg mux_q0, mux_q1, mux_q2;
  assign count = {q_3, q_2, q_1, q_0};

  mux21 mux0(.i({~q_0, q_0}), .select(switch), .mux_out(mux_q0));
  mux21 mux1(.i({~q_1, q_1}), .select(switch), .mux_out(mux_q1));
  mux21 mux2(.i({~q_2, q_2}), .select(switch), .mux_out(mux_q2));


  //instantiation of T_ffs
  T_ff T_ff0(.clk(clk), .rst(rst), .q(q_0));
  T_ff T_ff1(.clk(mux_q0), .rst(rst), .q(q_1));
  T_ff T_ff2(.clk(mux_q1), .rst(rst), .q(q_2));
  T_ff T_ff3(.clk(mux_q2), .rst(rst), .q(q_3));
  

  endmodule
