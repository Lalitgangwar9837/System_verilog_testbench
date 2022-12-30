
class monitor;
virtual bus b5;
mailbox m4;
function new (virtual bus b5,mailbox m4);
	this.b5=b5;
	this.m4=m4;
endfunction

task main;
begin
packet pac;
	repeat(1)
	begin
		pac = new();
		pac.address=b5.address;
		pac.w_data=b5.w_data;
		pac.rd_en=b5.rd_en;
		pac.wr_en=b5.wr_en;
		pac.r_data=b5.r_data;
		m4.put(pac);
		pac.display("monitor");
	end
end
endtask
endclass
