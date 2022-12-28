class scoreboard;
  mailbox mon2scb;
  
  function new (mailbox man2acb);
    this.mon2scb =man2acb;
  endfunction
  
  task main;
    transaction trans;
    repeat (1)
      begin
        mon2scb.get(trans);
        
        if (((trans.a^trans.b) == trans.sum) && ((trans.a&trans.b) == trans.carry))
          begin
          $display("result is as expected");
          end
        else
          begin
            $display("result is not correct");
          end
        //trans.display("scoreboard");
      end
  endtask
  
endclass
