class generator;
mailbox gen_to_driv;
mailbox gen_to_ref;

function new (mailbox gen_to_driv,mailbox gen_to_ref);
	this.gen_to_driv=gen_to_driv;
	this.gen_to_ref=gen_to_ref;
endfunction

task main();
	begin : generator
	repeat (1)
	begin
 		packet pac =new();
		void'(pac.randomize);
		gen_to_driv.put(pac);
		gen_to_ref.put(pac);
		pac.display("generator");
	end
	end : generator
endtask

endclass
