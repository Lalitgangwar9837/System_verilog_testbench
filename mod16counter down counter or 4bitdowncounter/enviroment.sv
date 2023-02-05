
`include "packet.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor1.sv"
`include "monitor2.sv"
`include "reference_model.sv"
`include "scoreboard.sv"
class environment;
  virtual intf vif;
  mailbox gen2drive;
  mailbox mon2ref;
  mailbox ref2sco;
  mailbox mon22sco;
    packet pack;
    generator gen;
    driver dri;
    monitor1 mon1;
    monitor2 mon2;
    reference refe;
    scoreboard sco;
  function new(virtual intf vif);
    this.vif=vif;
    gen2drive=new();
    mon2ref=new();
    ref2sco=new();
    mon22sco=new();
    pack=new();
    gen=new(gen2drive);
    dri=new(vif,gen2drive);
    mon1=new(vif,mon2ref);
    mon2=new(vif,mon22sco);
    refe=new(vif,mon2ref,ref2sco);
    sco=new(ref2sco,mon22sco);
  endfunction
  task test();
    repeat(10)
      fork
      	gen.main();
      	dri.main();
      	mon1.main();
      	mon2.main();
      	refe.main();
      	sco.main();
    join
  endtask
  task run();
    test();
    $finish;
  endtask
endclass
