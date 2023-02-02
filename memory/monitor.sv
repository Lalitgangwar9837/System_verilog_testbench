
class monitor;
virtual bus b5;
mailbox mon_to_soc;
function new (virtual bus b5,mailbox mon_to_soc);
	this.b5=b5;
	this.mon_to_soc=mon_to_soc;
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
		mon_to_soc.put(pac);
		pac.display("monitor");
	end
end
endtask
endclass
