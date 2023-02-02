class scoreboard;
bit [7:0] ref_w_data;
bit [7:0] ref_r_data;
mailbox mon_to_soc;
mailbox ref_to_soc;
virtual bus b10;
function new (mailbox ref_to_soc,mailbox mon_to_soc);
	this.ref_to_soc=ref_to_soc;
	this.mon_to_soc=mon_to_soc;
endfunction
task main;
packet pac=new();

ref_to_soc.get(ref_r_data);
ref_to_soc.get(ref_w_data);
mon_to_soc.get(pac);
if ((ref_r_data==pac.r_data)&&(ref_w_data==pac.w_data))
	begin
	 $display("----/////////////////////////////////-------------"); 
    	 $display($time,"result is correct");
    	 $display("----/////////////////////////////////-------------"); 
	end
else
	begin
	 $display("----/////////////////////////////////-------------"); 
    	 $display($time,"result is not correct");
    	 $display("----/////////////////////////////////-------------"); 
	end
endtask
endclass
