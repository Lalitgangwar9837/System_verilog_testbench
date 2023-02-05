
`include "design.sv"
`include "interface.sv"
`include "test.sv"
module mod4countertb();
  bit clk;
  bit rst;
  always #1clk=~clk;
  initial begin 
  rst=1;
  #5rst=~rst;
  end
  intf a_intf(clk,rst);
  test t1(a_intf);
  mod4counter DUT(.cnt(a_intf.cnt), .clk(a_intf.clk), .rst(a_intf.rst));

endmodule
