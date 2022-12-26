// Code your testbench here
// or browse Example
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "interface.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module tb_full_adder;
  intf i5 ();
  full_adder dut(.sum(i5.sum),.carry(i5.carry),.carry_in(i5.carry_in),.a(i5.a),.b(i5.b));
  test t1 (i5);
endmodule
