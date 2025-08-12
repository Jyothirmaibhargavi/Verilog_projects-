`include "gray_binary.v"
module binary_gray_tb;
parameter N=4;
reg [N-1:0]g;
wire[N-1:0]b;
gray_binary dut (.b(b),.g(g));
initial begin
repeat (5) begin
g=$random;
#1;
$display("b=%b,g=%b",b,g);
end
end
endmodule 


