class monitor;
  virtual bus b2;
  mailbox m3;
  function new (virtual bus b2, mailbox m3);
    this.b2=b2;
    this.m3=m3;
  endfunction
  
  task main();
    begin
      
      repeat (1)
        #3 ;
        begin
          
          transaction trans;
          trans=new();
          trans.a=b2.a;
          trans.b=b2.b;
          trans.sum=b2.sum;
          trans.carry=b2.carry;
          m3.put(trans);
          trans.display("monitor");
        end
    end
    
  endtask
  
  
endclass
