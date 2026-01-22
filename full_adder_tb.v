`timescale 1ns / 1ps

module full_adder_tb;
    // Register untuk input (karena akan dimanipulasi di block initial)
    reg a, b, cin;
    // Wire untuk output
    wire sum, cout;

    // Instansiasi modul Full Adder
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Membuat file dump untuk GTKWave
        $dumpfile("full_adder_results.vcd");
        $dumpvars(0, full_adder_tb);

        // Menampilkan output di terminal VS Code
        $monitor("Time=%0t | a=%b b=%b cin=%b | Sum=%b Cout=%b", $time, a, b, cin, sum, cout);

        // Test Case: Semua kombinasi input (Truth Table)
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        $finish; // Mengakhiri simulasi
    end
endmodule