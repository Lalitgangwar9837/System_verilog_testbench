class driver;
  virtual intf vif;
  mailbox gen2drive;
  packet pack;
  function new(virtual intf vif, mailbox gen2drive);
    this.vif=vif;
    this.gen2drive=gen2drive;
  endfunction
  task main();
    repeat(1)
      begin
        pack=new();
        gen2drive.get(pack);
        pack.cnt=vif.cnt;
        pack.display("driver");
      end
  endtask
endclass
