

class generator;
  
  mailbox m1;
  
  function new (mailbox m1);
    this.m1=m1;
  endfunction
  task main();
    begin
      repeat(1)
        begin
        transaction trans;
        trans=new();
        void'(trans.randomize);
        m1.put(trans);
        trans.display("generator");
       end
    end
  endtask
  
endclass