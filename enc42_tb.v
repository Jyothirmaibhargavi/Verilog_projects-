`include "enc42.v"
module enc42_tb;
reg [3:0] d;
wire [1:0] y;

enc42  dut (d,y);

initial begin
$monitor("Time=%0t | d=%b | y=%b", $time, d, y);

        // Apply valid one-hot inputs
        d = 4'b0001; #1;
        d = 4'b0010; #1;
        d = 4'b0100; #1;
        d = 4'b1000; #1;

        $finish;
    end
endmodule
