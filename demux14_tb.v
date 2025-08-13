`include "demux14.v"
module demux14_tb;
reg i;
reg [1:0]s;
wire [3:0]y;
demux14 dut (.i(i),.s(s),.y(y));
initial begin
i=1;
repeat(10) begin
{s}=$random;
#1;
$display("i=%b,s=%b,y=%b", i,s,y);
end
end
endmodule 

