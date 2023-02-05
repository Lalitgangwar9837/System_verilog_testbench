class scoreboard;
  packet pack;
  mailbox ref2sco;
  mailbox mon22sco;
  bit[3:0] cnt;
  function new(mailbox ref2sco, mailbox mon22sco);
    this.ref2sco=ref2sco;
    this.mon22sco=mon22sco;
  endfunction
  task main();
    begin
    	pack=new();
    	ref2sco.get(cnt);
    	mon22sco.get(pack);
      begin
      	if(cnt==pack.cnt)
        	$display("right result");
      	else
        	$error("wrong result");
      end
    $display("ref cnt=%d",cnt);
      $display("ref pack.cnt=%d",pack.cnt);      
    end
  endtask
endclass
