
class scoreboard;
  mailbox m4;
  mailbox m3;
  function new (mailbox m4);
    this.m4=m4;
    this.m3=m3;
  endfunction
  task main();
    repeat (1);
    begin
      transaction trans=new();
      m4.get(trans);
      if ((trans.sum==trans.r_sum)&&(trans.sum==trans.r_sum))
        begin
          $display("=============\\\\\\\\\\\\\\\\===============");
          $display("design is correct");
          $display("=============\\\\\\\\\\\\\\\\===============");
        end
      else 
        begin
          $display("=============\\\\\\\\\\\\\\\\===============");
          $display("design is NOT correct");
          $display("=============\\\\\\\\\\\\\\\\===============");
        end
        
    end
  endtask 
endclass