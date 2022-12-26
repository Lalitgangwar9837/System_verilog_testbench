// Code your design here
module full_adder(sum,carry,carry_in,a,b);
  input a,b,carry_in;
  output sum,carry;
  wire x1,a1,a2;
  xor (x1,a,b);
  xor (sum,x1,carry_in);
  and (a1,a,b);
  and (a2,x1,carry_in);
  or (carry,a1,a2);
endmodule
