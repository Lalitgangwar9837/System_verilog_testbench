`include "enviroment.sv"
program test(intf a_intf);
  environment env;
  initial
    begin
      env=new(a_intf);
      env.run();
    end
endprogram
