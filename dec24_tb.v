`include "dec24.v"
module dec24_tb;
reg [1:0]a;
reg en;
wire [3:0] d;
dec24 dut (en,a,d);
initial begin 
$display("EN A  |  D");
        $display("--------------");
        en = 1; 
		a = 2'b00; #10 $display("%b  %b | %b", en, a, d);
        a = 2'b01; #10 $display("%b  %b | %b", en, a, d);
        a = 2'b10; #10 $display("%b  %b | %b", en, a, d);
        a = 2'b11; #10 $display("%b  %b | %b", en, a, d);
        $finish;
    end
endmodule
