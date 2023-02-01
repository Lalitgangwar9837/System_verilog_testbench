
class reference;
bit rd_en,wr_en;
bit [1:0] address;
bit [7:0] ref_w_data;
bit [7:0] ref_r_data;
bit [7:0] mem[0:3];
mailbox m5;
mailbox m6;
virtual bus b10;
function new (virtual bus b10,mailbox m5,mailbox m6);
	this.m5=m5;
	this.m6=m6;
	this.b10=b10;
endfunction

task main();
begin
repeat (1)
begin
packet pac=new();
m5.get(pac);
rd_en=pac.rd_en;
wr_en=pac.wr_en;
address=pac.address;
ref_w_data=pac.w_data;
ref_r_data=pac.r_data;
@(posedge b10.clk)
  begin
    if (b10.reset)
          begin
            foreach (mem[i])
              mem[i]=0;
          end
      else
          begin
            if (wr_en)
              begin
              mem[address]=ref_w_data;
              end
            else
              begin
                if (rd_en)
                begin
                ref_r_data=mem[address];
                end
              end
           end

   end
end


m6.put(ref_r_data);
m6.put(ref_w_data);
    $display("------------------------------------"); 
    $display($time,"%s","reference_model");
    $display("------------------------------------");
    $display("wr_en = %d,  rd_en = %d",wr_en,rd_en);
    $display("w_data = %d  address = %d  r_data = %d",ref_w_data,address,ref_r_data);
    $display("------------------------------------");
end
endtask



endclass
