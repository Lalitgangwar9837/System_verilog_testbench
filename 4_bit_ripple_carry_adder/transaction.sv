
class transaction;
  randc bit [3:0] a,b;
  bit [3:0] sum,r_sum;
  bit carry,r_carry;
  
  function void display (string name);
    begin
    $display("------------------------------------"); 
    $display("%s",name);
    $display("------------------------------------");
    $display("a = %d,  b = %d",a,b);
    $display("sum = %d,  carry = %d",sum,carry);
    $display("------------------------------------");
    end
  endfunction
  
  function void r_display (string name);
    begin
    $display("------------------------------------"); 
    $display("%s",name);
    $display("------------------------------------");
    $display("a = %d,  b = %d",a,b);
      $display("sum = %d,  carry = %d",r_sum,r_carry);
    $display("------------------------------------");
    end
  endfunction
endclass