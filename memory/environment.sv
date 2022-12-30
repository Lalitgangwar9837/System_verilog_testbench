`include "transaction.sv"
`include "generator.sv"

`include "driver.sv"
`include "reference_model.sv"
`include "monitor.sv"

`include "scoreboard.sv"


class environment;
  generator gen;
  reference refe;
  driver driv;
  monitor mon;
  scoreboard sco;

  mailbox m5;
  mailbox m6;
  mailbox m7;
  mailbox m8;
  virtual bus b3;
  function new (virtual bus b3);
    this.b3=b3;
  endfunction
  task main();
        m5=new(1);
        m6=new(1);
        m7=new(1);
        m8=new(1);

        gen=new(m5);
        driv=new(b3,m5);
        
        
        mon=new(b3,m8);
        refe=new(m8,m7);
    	sco=new(m7);
        
    repeat(10)

      fork

        gen.main();
        driv.main();
        
        mon.main();
	refe.main();
        sco.main();
      join
 
  endtask
endclass