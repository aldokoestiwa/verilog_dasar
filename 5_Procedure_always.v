
/* 
Blok always:
     always @ (event)
     	[statement]
     always @ (event) begin
     	[multiple statements]
     end
*/

/* 
Always harus menggunakan pemicu, jika tidak gunakan:
     always @(*) atau always_comb
*/


// Contoh sekuensial

module tff (
     input  	 d,clk,rstn,
     output reg q
     );

	always @ (posedge clk or negedge rstn) begin
		if (!rstn)
			q <= 0;
		else
			if (d)
				q <= ~q;
			else
				q <= q;
	end
endmodule

// Contoh kombinasional

module combo (	input 	a,
      			input	b,
              	input	c,
              	input	d,
  	            output reg o);

  always @ (a or b or c or d) begin
    o <= ~((a & b) | (c^d));
  end
endmodule







