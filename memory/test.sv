`include "environment.sv"

program test (bus b2);
initial
	begin
		
		environment env;
		env=new(b2);
		env.main();

	end

endprogram
