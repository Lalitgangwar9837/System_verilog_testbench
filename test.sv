program test (intf pro);
  environment env;
  initial
    begin
      env=new(pro);
      env.run();
    end
  
endprogram
