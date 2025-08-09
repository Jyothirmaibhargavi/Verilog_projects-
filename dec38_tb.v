`include "dec38.v"

module dec38_tb;
  reg [2:0] a;
  reg en;
  wire [7:0] d;

  // Instantiate the decoder
  dec38 uut (.en(en),
    .a(a),
    .d(d)
  );

  initial begin
    $display(" a   |   d");
    $display("--------------");
    en=1;
    // Apply all 3-bit input combinations
    a = 3'b000; #1 $display("%b | %b", a, d);
    a = 3'b001; #1 $display("%b | %b", a, d);
    a = 3'b010; #1 $display("%b | %b", a, d);
    a = 3'b011; #1 $display("%b | %b", a, d);
    a = 3'b100; #1 $display("%b | %b", a, d);
    a = 3'b101; #1 $display("%b | %b", a, d);
    a = 3'b110; #1 $display("%b | %b", a, d);
    a = 3'b111; #1 $display("%b | %b", a, d);

    $finish;
  end
endmodule

