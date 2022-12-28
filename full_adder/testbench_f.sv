`include "interface_f.sv"

`include "design_f.sv"

`include "test_f.sv"

module tb_full_adder;
  intf i5 ();
  full_adder dut(.sum(i5.sum),.carry(i5.carry),.carry_in(i5.carry_in),.a(i5.a),.b(i5.b));
  test t1 (i5);
endmodule