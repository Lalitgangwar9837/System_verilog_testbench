`include "packet.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "reference_model.sv"
`include "scoreboard.sv"


class environment ;
virtual bus b3;
mailbox m3;
mailbox m5;
mailbox m9;
mailbox m10;
function new (virtual bus b3);
this.b3=b3;
endfunction 
task main();
begin
	m3=new(1);
	m5=new(1);
	m9=new(1);
	m10=new(2);
		fork
		generator gen;
	        driver dri;
		monitor mon;
		reference refe;
		scoreboard sco;
		
		
		gen=new(m3,m9);
		refe=new(b3,m9,m10);
		dri=new(b3,m3);
		mon=new(b3,m5);
		sco=new(m10,m5);
		
		repeat (50)
		
			begin
			gen.main();
			dri.main();
			refe.main();
			#5;
			mon.main();
			sco.main();
			end
			
		
		
join
end
endtask

endclass