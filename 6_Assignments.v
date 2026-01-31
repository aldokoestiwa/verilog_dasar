// Contoh format LHS (Left Hand Side)= RHS (Right Hand Side)

module tb;
	reg clk;
	wire a, b, c, d, e, f;
	reg  z, y, q, o, a, b;

	// LHS = clk, y, f, z, a, b, c, d, e
     // RHS = ~clk, 1, (a|b)^(d&e), a + b + c + d, 0

	always #10 clk = ~clk;             // procedural assignment
	assign y = 1;                      // continuous assignment
	assign f = (a | b) ^ (d & e);      // continuous assignment
	
     always @ (posedge clk) begin       // procedural assignment
		z <= a + b + c + d;      
	end

	initial begin                      // procedural assignment
		a <= 0; b <= 0; c <= 0; d <= 0; e <= 0;
		clk <= 0;                

	end
     initial begin            
	     assign q = 0;                 // procedural continuous assignment
	     #10 deassign q;               // procedural continuous assignment
     end

     initial begin                      
	     force o = a & b;
	     ...
	     release o;
     end
endmodule

/* 
     Assignment prosedural:
     always, initial, task, function
*/

module my_design;
     reg clk;
     reg [7:0]  data;
     integer    count;
     real       period;

     initial begin
	     data = 8'h3e;
	     period = 4.23;
	     count = 0;
     end

     always @ (posedge clk)
	     count++;
endmodule

/* 
     Assignment continuous

*/

// Assignment prosedural continuous