class driver;
  
  virtual intf vif;
  
  mailbox gen2driv;
  
  function new (virtual intf vif,mailbox gen2driv);
    this.vif=vif;
    this.gen2driv = gen2driv;
  endfunction
  task main;
    
    repeat (1)
      begin
        
        transaction trans;
        
        
        gen2driv.get(trans);
        
        vif.a <= trans.a;
        vif.b <= trans.b;
        vif.carry_in <= trans.carry_in;
        
        trans.sum  = vif.sum;
        trans.carry = vif.carry;
        trans.display("driver");
      end
  endtask
  
endclass
