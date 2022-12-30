
module half_adder(sum,carry,a,b);
  input a,b;
  output sum,carry;
  xor (sum,a,b);
  and (carry,a,b);
endmodule

module full_adder(sum,carry,carry_in,a,b);
  input carry_in,a,b;
  output sum,carry;
  wire c2,c1,s1;
  half_adder h1 (s1,c1,a,b);
  half_adder h2 (sum,c2,s1,carry_in);
  or (carry,c1,c2);
endmodule

module bit_adder_4(sum,carry,a,b);
  input [3:0]a,b;
  output [3:0]sum;
  output carry;
  wire c1,c2,c3;
  half_adder h3 (sum[0],c1,a[0],b[0]);
  full_adder f1 (sum[1],c2,c1,a[1],b[1]);
  full_adder f2 (sum[2],c3,c2,a[2],b[2]);
  full_adder f3 (sum[3],carry,c3,a[3],b[3]);
  
endmodule