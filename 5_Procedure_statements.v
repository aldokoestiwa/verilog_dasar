/* 
     Sekuensial
     Data dieksekusi secara berurutan
*/


module design0;
	bit [31:0] data;

	initial begin
		#10   data = 8'hfe;
		$display ("[Time=%0t] data=0x%0h", $time, data);
		#20   data = 8'h11;
		$display ("[Time=%0t] data=0x%0h", $time, data);
	end
endmodule

/* 
     Paralel
     Data dieksekusi secara bersamaan
*/

module my_design_2;
     initial begin
	     #10   data = 8'hfe;
	fork
	     #20 data = 8'h11;
	     #10 data = 8'h00;
	join
end
endmodule

// Paralel dengan sekuensial

module my_design_3;
     initial begin : blok_sekuensial    // menamai blok
	     #10 data = 8'hfe;
	     fork : blok_paralel           // menamai blok
		     #10 data = 8'h11;
		     begin                    // diproses secara sekuensial
			     #20 data = 8'h00;
			     #30 data = 8'haa;
		     end
	     join
     end
endmodule


/*
Penamaan blok sekuensial/paralel
     begin : name_seq
	     [statements]
     end
     fork : name_fork
	     [statements]
     join
*/ 
