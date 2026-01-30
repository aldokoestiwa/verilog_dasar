// if-else-if

/* 
tanpa else:
     if (expression)
	     [statement]

dengan else:
     if (expression)
	     [statement]
     else
	     [statement]

dengan banyak else:
     if (expression) begin
	     [multiple statements]
     end 
     else begin
     	[multiple statements]
     end
dengan else if:
     if (expression)
	     [statement]
     else if (expression)
     	[statement]
     else
     	[statement]
*/

// forever loop

/* 
forever
	[statement]

forever begin
	[multiple statements]
end
*/

module my_design;
	initial begin
		forever begin
			$display ("This will be printed forever, simulation can hang ...");
		end
	end
endmodule

// repeat

/*
     repeat ([num_of_times]) begin
     	[statements]
     end

     repeat ([num_of_times]) @ ([some_event]) begin
     	[statements]
     end
*/

module my_design_2;
	initial begin
		repeat(4) begin
			$display("This is a new iteration ...");
		end
	end
endmodule

// while

/*
     while (expression) begin
     	[statements]
     end
*/

module my_design_2;
  	integer i = 5;

	initial begin
      while (i > 0) begin
        $display ("Iteration#%0d", i);
        i = i - 1;
      end
	end
endmodule

// for loop

/*
     for ( initial_assignment; condition; increment_variable) begin
	     [statements]
     end
*/

module my_design_3;
  	integer i = 5;

	initial begin
      for (i = 0; i < 5; i = i + 1) begin
        $display ("Loop #%0d", i);
      end
    end
endmodule





