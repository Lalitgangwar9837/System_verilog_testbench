`include "transaction_f.sv"

`include "generator_f.sv"
`include "driver_f.sv"

`include "monitor_f.sv"
`include "scoreboard_f.sv"


class environment;
  generator gen;
  driver dri;
  scoreboard sco;
  monitor mon;
  mailbox m1;
  mailbox m2;
  
  virtual intf i3;
  function new (virtual intf i3);
    this.i3=i3 ;
  endfunction
  
  task run();
    m1=new(1);
    m2=new(1);
    gen=new(m1);
    dri=new(i3,m1);
    sco=new(m2);
    mon=new(i3,m2);
    repeat (15)
      fork
      gen.main();
      dri.main();
      mon.main();  
      sco.main();
      
        
      join
  endtask
endclass