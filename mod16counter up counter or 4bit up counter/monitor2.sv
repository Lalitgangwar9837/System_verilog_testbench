class monitor2;
  virtual intf vif;
  mailbox mon22sco;
  packet pack;
  function new(virtual intf vif, mailbox mon22sco);
    this.vif=vif;
    this.mon22sco=mon22sco;
  endfunction
  task main();
    #2
    repeat(1)
      begin
        pack=new();
        pack.cnt=vif.cnt;
        pack.display("monitor_2");
        mon22sco.put(pack);
      end
  endtask
endclass
