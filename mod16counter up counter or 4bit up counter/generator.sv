
class generator;
  packet pack;
  mailbox gen2drive;
  function new(mailbox gen2drive);
    this.gen2drive=gen2drive;
  endfunction
  task main();
    pack=new();
    pack.display("generator");
    gen2drive.put(pack);
  endtask
endclass