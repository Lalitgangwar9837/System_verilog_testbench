module memory (r_data,rd_en,wr_en,address,w_data,clk,reset);
input rd_en,wr_en,address,w_data,clk,reset;
reg [1:0] address;
reg [7:0] w_data;
output reg [7:0] r_data;
  reg [7:0]mem[0:3];

always @(posedge clk)
  begin
    if (reset)
          begin
            foreach (mem[i])
              mem[i]=0;
          end
      else
          begin
            if (wr_en)
              begin
              mem[address]=w_data;
              end
            else
              begin
                if (rd_en)
                begin
                r_data=mem[address];
                end
              end
           end
  end
endmodule