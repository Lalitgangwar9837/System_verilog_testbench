`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator gen;
  monitor mon;
  driver driv;
  scoreboard scb;
  mailbox m1;
  mailbox m2;
  virtual intf vif;
  
  function new(virtual intf vif);
    this.vif = vif;
    m1 = new();
    m2 = new();
    gen = new(m1);
    scb = new(m2);
    driv = new(vif,m1);
    mon = new(vif,m2);
  endfunction
  
  task test();
    repeat (15)
    fork
      gen.main();
      driv.main();
      
      mon.main();
      scb.main();
      
    join
  endtask
  
  task run;
    test();
    $finish;
  endtask
endclass
