
class driver;
  virtual bus b1;
  mailbox m1;
  function new (virtual bus b1, mailbox m1);
    this.b1=b1;
    this.m1=m1;
  endfunction
  
  task main;
    begin
      repeat (1)
        begin
          transaction trans;
          trans =new();
          m1.get(trans);
          b1.a<=trans.a;
          b1.b<=trans.b;
          trans.sum=b1.sum;
          trans.carry=b1.carry;
          trans.display("driver");
        end
    end
  endtask
  
  
endclass