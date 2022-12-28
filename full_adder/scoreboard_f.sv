class scoreboard;
  mailbox score_m_box;
  bit [1:0] check_in;
  bit [1:0] check_out;
  
  function new (mailbox score_m_box);
    this.score_m_box=score_m_box;
  endfunction
  task main();
    begin
      transaction trans;
    repeat (1)
      begin
      
      score_m_box.get(trans);
        check_in=trans.a+trans.b+trans.carry_in;
        check_out={trans.carry,trans.sum};
        if (check_out==check_in)
        begin
          $display("result is as expected");
          end
        else
          begin
            $display("result is not correct");
          end
         trans.display("scoreboard");
      end
    end
  endtask
endclass