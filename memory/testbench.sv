`include "design.sv"
`include "interface.sv"
`include "test.sv"


module tb_memory;

bit clk;
bit reset;
always #1 clk = ~clk;

bus b1(clk,reset);

memory dut (.r_data(b1.r_data),.rd_en(b1.rd_en),.wr_en(b1.wr_en),.address(b1.address),.w_data(b1.w_data),.clk(b1.clk),.reset(b1.reset));
test t1 (b1);

initial
begin
#200 $finish;
end


endmodule
