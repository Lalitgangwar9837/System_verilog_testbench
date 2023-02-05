
class packet;
  static bit[3:0] cnt;
  function void display(string name);
    $display("====================");
    $display("%s",name);
    $display("value of cnt=%d",cnt,$time);
    $display("====================");
  endfunction
endclass