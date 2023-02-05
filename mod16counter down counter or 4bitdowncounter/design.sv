
module t_ff(q,clk,rest);
  input rest,clk;
  output bit q;
  
  always @(posedge clk)
    begin
      if(rest)
      		q<=1'b0;
      else
        begin
            q<=~q;
      end
    end
endmodule


module mod4counter(cnt,clk,rst);
  input  clk,rst;
  output [3:0] cnt;

  t_ff t1 (cnt[0],clk,rst);
  t_ff t2 (cnt[1],cnt[0],rst);
  t_ff t3 (cnt[2],cnt[1],rst);
  t_ff t4 (cnt[3],cnt[2],rst);  
endmodule

