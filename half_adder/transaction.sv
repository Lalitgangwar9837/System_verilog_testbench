class transaction;
  
  rand bit a;
  rand bit b;
  bit sum;
  bit carry;
  
  function void display(string name);
    $display("------------------------------------"); 
    $display("%s",name);
    $display("------------------------------------");
    $display("a = %0b,  b = %0d",a,b);
    $display("sum = %0b,  carry = %0b",sum,carry);
    $display("------------------------------------");
  endfunction
endclass
