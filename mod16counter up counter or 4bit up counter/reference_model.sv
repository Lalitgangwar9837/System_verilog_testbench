class reference;
  virtual intf vif;
  mailbox mon2ref;
  mailbox ref2sco;
  bit [3:0] cnt;
  packet pack;
  function new(virtual intf vif, mailbox mon2ref, mailbox ref2sco);
    this.vif=vif;
    this.mon2ref=mon2ref;
    this.ref2sco=ref2sco;
  endfunction
  task main();
    #2
    repeat(1)
      begin
        pack=new();
        mon2ref.get(pack);
        cnt=pack.cnt;
        @(posedge vif.clk or negedge vif.rst)
        begin
          if(vif.rst)
            cnt<='b0;
          else
            begin
              if(cnt==16)
                cnt<='b0;
              else
                cnt<=cnt+1;
            end
        end
        ref2sco.put(cnt);
        pack.cnt=cnt;
        pack.display("reference");
      end
  endtask
endclass
