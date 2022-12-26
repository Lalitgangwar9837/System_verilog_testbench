class transaction;
  randc bit a,b,carry_in;
  bit sum, carry;
  
  function void display(string name);
    $display("------------------------------------"); 
    $display("%s",name);
    $display("------------------------------------");
    $display("a = %0b,  b = %0d carry_in=%0d",a,b,carry_in);
    $display("sum = %0b,  carry = %0b",sum,carry);
    $display("------------------------------------");
  endfunction
  
endclass
