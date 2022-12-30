
`include "environment.sv"
program test (bus b4);
  environment env;
  
  initial
    begin
      env =new(b4);
      env.main();
    end
endprogram