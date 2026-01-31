/*
     Blocking statement
*/

module tb;
  reg [7:0] a, b, c, d, e;

  initial begin
    a = 8'hDA;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
    b = 8'hF1;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
    c = 8'h30;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
  end

  initial begin
    d = 8'hAA;
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);
 	e = 8'h55;
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);
  end
endmodule      // diproses secara sekuensial

module tb;
  reg [7:0] a, b, c, d, e;

  initial begin
    a = 8'hDA;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
    #10 b = 8'hF1;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
    c = 8'h30;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
  end

  initial begin
    #5 d = 8'hAA;
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);
 	#5 e = 8'h55;
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);
  end
endmodule      // diproses secara sekuensial sesuai urutan delay

/*
     Nonblocking statemtn
*/

module tb;
  reg [7:0] a, b, c, d, e;

  initial begin
    a <= 8'hDA;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
    b <= 8'hF1;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
    c <= 8'h30;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
  end

  initial begin
    d <= 8'hAA;
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);
 	e <= 8'h55;
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);
  end
endmodule      // hasil tidak bisa ditampilkan di display, hanya diassign

module tb;
  reg [7:0] a, b, c, d, e;

  initial begin
    a <= 8'hDA;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
    #10 b <= 8'hF1;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
    c <= 8'h30;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
  end

  initial begin
    #5 d <= 8'hAA;
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);
    #5 e <= 8'h55;
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);
  end
endmodule      // hasil ditampilkan dan nilainya diassign, tetapi ditampilkan di delay berikutnya