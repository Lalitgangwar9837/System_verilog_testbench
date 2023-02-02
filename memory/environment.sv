`include "packet.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "reference_model.sv"
`include "scoreboard.sv"


class environment ;
virtual bus b3;
mailbox gen_to_driv;
mailbox gen_to_ref;
mailbox mon_to_soc;
mailbox ref_to_soc;
function new (virtual bus b3);
this.b3=b3;
endfunction 
task main();
begin
	gen_to_driv=new(1);
	gen_to_ref=new(1);
	mon_to_soc=new(1);
	ref_to_soc=new(2);
		fork
		generator gen;
	    driver dri;
		monitor mon;
		reference refe;
		scoreboard sco;
		
		
        gen=new(gen_to_driv,gen_to_ref);
        refe=new(b3,gen_to_ref,ref_to_soc);
		dri=new(b3,gen_to_driv);
        mon=new(b3,mon_to_soc);
		sco=new(ref_to_soc,mon_to_soc);
		
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
