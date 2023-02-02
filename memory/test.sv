`include "environment.sv"

program test (bus b1);
initial
	begin
		
		environment env;
      env=new(b1);
		env.main();

	end

endprogram
