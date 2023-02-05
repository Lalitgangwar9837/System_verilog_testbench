
class monitor1;
  virtual intf vif;
  mailbox mon2ref;
  
  packet pack;
  function new(virtual intf vif, mailbox mon2ref);
    this.vif=vif;
    this.mon2ref=mon2ref;
  endfunction
  task main();
    #2
    repeat(1)
      begin
        pack=new();
        pack.cnt=vif.cnt;
        pack.display("monitor1");
        mon2ref.put(pack);
      end
  endtask
endclass
