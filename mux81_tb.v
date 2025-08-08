`include "mux81.v"
module mux81_tb;
  reg [7:0] i;
  reg [2:0] s;
  wire y;
  mux81 dut (.i(i), .s(s), .y(y));
  initial begin
   i= 10101010;
        $display("i         s  | y");
   s = 3'b000; #1;
        $display("%b %b | %b", i, s, y);
   s = 3'b001; #1;
        $display("%b %b | %b", i, s, y);
   s = 3'b010; #1;
        $display("%b %b | %b", i, s, y);
   s = 3'b011; #1;
        $display("%b %b | %b", i, s, y);
   s = 3'b100; #1;
        $display("%b %b | %b", i, s, y);
   s = 3'b101; #1;
        $display("%b %b | %b", i, s, y);
   s = 3'b110; #1;
        $display("%b %b | %b", i, s, y);
   s = 3'b111; #1;
        $display("%b %b | %b", i, s, y);
   $finish;
 end
endmodule

//testbench using for loop 
module mux81_tb;
    reg  [7:0] i;
    reg  [2:0] s;
    wire       y;

    mux81 dut (.i(i), .s(s), .y(y));

    initial begin
        // Test pattern: i = 8'b10101010 (easy to verify)
        i = 8'b10101010;

        $display("   s    |  y");
        $display("--------|---");
        for (s = 0; s < 8; s = s + 1) begin
            #1;
            $display("%b |  %b", s, y);
        end
    end
endmodule

