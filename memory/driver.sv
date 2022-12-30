
class driver;
bit clk=0;
bit reset=0;
mailbox m2;
virtual bus b4;
function new (virtual bus b4,mailbox m2);
	this.b4=b4;
	this.m2=m2;
endfunction

task main();
	begin
		repeat (1)
		begin
			packet pac=new();
			m2.get(pac);
			b4.address<=pac.address;
			b4.w_data<=pac.w_data;
			b4.rd_en<=pac.rd_en;
			b4.wr_en<=pac.wr_en;
			pac.r_data=b4.r_data;
			pac.display("driver");
		end
	end
endtask

endclass
