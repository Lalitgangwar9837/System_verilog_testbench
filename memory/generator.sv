class generator;
mailbox m1;
mailbox m2;

function new (mailbox m1,mailbox m2);
	this.m1=m1;
	this.m2=m2;
endfunction

task main();
	begin : generator
	repeat (1)
	begin
 		packet pac =new();
		void'(pac.randomize);
		m1.put(pac);
		m2.put(pac);
		pac.display("generator");
	end
	end : generator
endtask

endclass
