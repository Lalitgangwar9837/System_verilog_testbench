class scoreboard;
bit [7:0] ref_w_data;
bit [7:0] ref_r_data;
mailbox m9;
mailbox m8;
virtual bus b10;
function new (mailbox m8,mailbox m9);
	this.m8=m8;
	this.m9=m9;
endfunction
task main;
packet pac=new();

m8.get(ref_r_data);
m8.get(ref_w_data);
m9.get(pac);
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
