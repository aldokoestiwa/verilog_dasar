// Dieksekusi hanya sekali pada detik ke 0 selama simulasi

/*
     initial
          [single statement]
     initial begin
          [multiple statements]
     end
*/

module behave;

     reg [1:0] a,b;

     initial begin
          a = 2'b10;
     #20  b = 2'b11;
     end

     initial begin
     #10  a = 2'b11;
     #10  b = 2'b10;
     end

     initial begin
     #60  $finish;  // $finish menghentikan semua aktivitas simulasi 
     end
     
endmodule