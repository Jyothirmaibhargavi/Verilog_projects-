`include "ha.v"
module tb_ha;
  reg a, b;
  wire s, co;
  ha dut (a,b,s,co);
  initial begin
    $display("A B | Sum  Carry");
    $display("--------------");
    a = 0; b = 0; #10;
    $display("%b %b |  %b    %b", a, b, s, co);

    a = 0; b = 1; #10;
    $display("%b %b |  %b    %b", a, b, s, co);

    a = 1; b = 0; #10;
    $display("%b %b |  %b    %b", a, b, s, co);

    a = 1; b = 1; #10;
    $display("%b %b |  %b    %b", a, b, s, co);

    $finish;
  end
endmodule


//tb using vector 
module tb_ha;
reg [7:0] a,b;
wire [7:0] s,co;

ha dut (a,b,s,co);

initial begin
$monitor("a=%b b=%b | s=%b | co=%b", a,b,s,co);
  a = 8'b00001111; b = 8'b00110011; #10;
  a = 8'b10101010; b = 8'b01010101; #10;
  a = $random;     b = $random;     #10;
  a = $random;     b = $random;     #10;
  a = $random;     b = $random;     #10;

  $finish;
end
endmodule 
