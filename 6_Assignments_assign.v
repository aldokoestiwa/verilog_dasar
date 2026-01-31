// Contoh penggunaan assignment

// 1. Simple combinational logic

module simple (a,b,c,d,e,z);

     input a,b,c,d,e;
     output z;
     wire w1,w2,w3;

     assign w1 = a & b;
     assign w2 = c ^ d;
     assign w3 = ~e & w2;
     assign z = w1 | w3;
endmodule			 

module simple_tb;
	
	reg a,b,c,d,e;
     wire z;
     integer i;
     
     simple uut (
          .a(a),
          .b(b),
          .c(c),
          .d(d),
          .e(e),
          .z(z)
     );

     initial begin
          
          a <= 0;
          b <= 0;
          c <= 0;
          d <= 0;
          e <= 0;
          
          $monitor (
               "a=%0b b=%0b c=%0b d=%0b e=%0b z=%0b",
               a,b,c,d,e,z
          );

          for (i=0; i<32; i++) begin
			  {a,b,c,d,e} = i;
			  #10;
          end
     end
endmodule

// 2. Half adder

module half_adder(a,b,cout,sum);
     input a,b;
     output cout,sum;
     
     assign cout = a & b;
     assign sum = a ^ b;
endmodule

module half_adder_tb;
     reg a,b;
     wire cout,sum;
	 integer i;

     half_adder uut(
          .a(a),
          .b(b),
          .cout(cout),
          .sum(sum)
     );
     
     initial begin
          a = 0;
          b = 0;		 
		  
		  $monitor ("a=%b b=%b sum=%b cout=%b", a,b,sum,cout);
          for(i=0; i<4; i++) begin
               {a,b} = i;
               #1;
          end
     end
endmodule

// 3. Full adder

module fa (a,b,cin,sum,cout);
     input  a, b, cin;
     output sum, cout;

	assign sum  = (a ^ b) ^ cin;
	assign cout = (a & b) | ((a ^ b) & cin);
endmodule

module fa_tb;
     reg a, b, cin;
     wire sum, cout;
     integer i;

     fa u0 ( .a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

     initial begin
          a <= 0;
          b <= 0;

          $monitor("a=%0b b=%0b cin=%0b sum=%0b cout=%0b", a, b, cin, sum, cout);

          for (i = 0; i < 7; i = i + 1) begin
               {a, b, cin} = i;
               #10;
          end
     end
endmodule

// 4. 2x1 multiplekser

module mux_2x1(a,b,sel,c);
     input     a,b,sel;
     output    c;
	assign c = sel ? a : b;
endmodule

module mux_2x1_tb;
     reg a, b, sel;
     wire c;
     integer i;

     mux_2x1 u0 ( .a(a), .b(b), .sel(sel), .c(c));
     initial begin
  	     a <= 0;
          b <= 0;
          sel <= 0;
          $monitor("a=%0b b=%0b sel=%0b c=%0b", a, b, sel, c);
          for (i = 0; i < 3; i = i + 1) begin
               {a, b, sel} = i;
               #10;
          end
     end
endmodule

// 5. 1x4 demultiplekser

module demux_1x4 (f,sel,a,b,c,d);

     input     f, sel[1:0];
     output    a,b,c,d;

	assign a = f & ~sel[1] & ~sel[0];
	assign b = f &  sel[1] & ~sel[0];
	assign c = f & ~sel[1] &  sel[0];
	assign d = f &  sel[1] &  sel[0];

endmodule

module tb;
     reg f;
     reg [1:0] sel;
     wire a, b, c, d;
     integer i;

     demux_1x4 u0 ( .f(f), .sel(sel), .a(a), .b(b), .c(c), .d(d));

     initial begin
          f <= 0;
          sel <= 0;
          $monitor("f=%0b sel=%0b a=%0b b=%0b c=%0b d=%0b", f, sel, a, b, c, d);

          for (i = 0; i < 8; i = i + 1) begin
               {f, sel} = i;
               #10;
          end
     end
endmodule

// 6. 4x16 decoder

module dec_3x8 (en,in,out);
     input     en,[3:0] in;
     output    out[15:0] out;

	assign out = en ? 1 << in: 0;
endmodule

module dec_3x8_tb;
     reg en;
     reg [3:0] in;
     wire [15:0] out;
     integer i;

     dec_3x8 u0 ( .en(en), .in(in), .out(out));

     initial begin
          en <= 0;
          in <= 0;
          $monitor("en=%0b in=0x%0h out=0x%0h", en, in, out);
          for (i = 0; i < 32; i = i + 1) begin
               {en, in} = i;
               #10;
          end
     end
endmodule