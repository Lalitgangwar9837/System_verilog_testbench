class packet;
randc bit [7:0] w_data;
rand bit wr_en,rd_en;
randc bit [1:0] address;
bit [7:0] r_data; 
constraint lalit{wr_en==!rd_en; solve wr_en before rd_en;}


function void display (string name);
    begin
    $display("------------------------------------"); 
    $display($time,"%s",name);
    $display("------------------------------------");
    $display("wr_en = %d,  rd_en = %d",wr_en,rd_en);
    $display("w_data = %d  address = %d  r_data = %d",w_data,address,r_data);
    $display("------------------------------------");
    end
endfunction

endclass
