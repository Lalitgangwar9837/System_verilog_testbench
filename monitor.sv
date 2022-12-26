class monitor;
  
  virtual intf vif;
  
  mailbox mon2scb;
  
  function new ( virtual intf vif,mailbox mon2scb);
    this.vif =vif;
    this.mon2scb =mon2scb;
  endfunction
  
  task main;
    repeat (1)
      #3;
    begin
      transaction trans;
      trans=new();
      trans.a =vif.a;
      trans.b = vif.b;
      trans.carry_in = vif.carry_in;
      trans.sum =vif.sum;
      trans.carry = vif.carry;
      mon2scb.put(trans);
      trans.display("monitor");
      
    end
  endtask
  
endclass
                    
