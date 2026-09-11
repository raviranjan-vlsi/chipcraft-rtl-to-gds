module half_adder(a, b, sum, carry);
 input wire a, b;
 output wire sum, carry;

 //half_adder functionality using gate level modelling
 xor xor1(sum, a, b);
 and and1(carry, a, b);

endmodule
