
class reference;
bit rd_en,wr_en;
bit [1:0] address;
bit [7:0] ref_w_data;
bit [7:0] ref_r_data;
bit [7:0] mem[0:3];
mailbox gen_to_ref;
mailbox ref_to_soc;
virtual bus b10;
function new (virtual bus b10,mailbox gen_to_ref,mailbox ref_to_soc);
	this.gen_to_ref=gen_to_ref;
	this.ref_to_soc=ref_to_soc;
	this.b10=b10;
endfunction

task main();
begin
repeat (1)
begin
packet pac=new();
gen_to_ref.get(pac);
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

ref_to_soc.put(ref_r_data);
ref_to_soc.put(ref_w_data);
    $display("------------------------------------"); 
    $display($time,"%s","reference_model");
    $display("------------------------------------");
    $display("wr_en = %d,  rd_en = %d",wr_en,rd_en);
    $display("w_data = %d  address = %d  r_data = %d",ref_w_data,address,ref_r_data);
    $display("------------------------------------");
end
endtask



endclass
