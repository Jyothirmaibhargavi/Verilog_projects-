`include "enc83.v"

module enc83_tb;
    reg  [7:0] d;
    wire [2:0] y;

    // Instantiate the encoder
    enc83 dut (.d(d), .y(y));

    initial begin
        $monitor("Time=%0t | d=%b | y=%b", $time, d, y);

        // Apply test vectors
        d = 8'b00000001; #1;  // 0
        d = 8'b00000010; #1;  // 1
        d = 8'b00000100; #1;  // 2
        d = 8'b00001000; #1;  // 3
        d = 8'b00010000; #1;  // 4
        d = 8'b00100000; #1;  // 5
        d = 8'b01000000; #1;  // 6
        d = 8'b10000000; #1;  // 7
     $finish;
    end
endmodule

