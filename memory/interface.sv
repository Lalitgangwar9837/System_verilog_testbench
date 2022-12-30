interface bus(input logic clk,reset);
logic rd_en,wr_en;
logic [7:0] r_data,w_data;
logic [1:0] address;

endinterface
