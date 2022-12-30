class reference;
  mailbox m2;
  mailbox m4;
  function new (mailbox m2,mailbox m4);
    this.m2=m2;
    this.m4=m4;
  endfunction
  
  task main;
    repeat(1)
      begin
        transaction trans= new();
        m2.get(trans);
        {trans.r_carry,trans.r_sum}=trans.a+trans.b;
        m4.put(trans);
        trans.r_display("referance_model");
      end
  endtask
  
endclass
