`include "design.sv"
`include "interface.sv"
`include "test.sv"

module tb_bit_adder;
  bus b4();
  bit_adder_4 dut (.sum(b4.sum),.carry(b4.carry),.a(b4.a),.b(b4.b));
  test t1 (b4);
endmodule
