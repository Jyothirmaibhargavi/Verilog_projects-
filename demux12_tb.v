`include "demux12.v"
module demux12_tb;
reg i,s;
wire y0,y1;
demux12 dut (.i(i),.s(s),.y0(y0),.y1(y1));
initial begin
repeat(10) begin
{i,s}=$random;
#1;
$display("i=%b,s=%b,y0=%b,y1=%b", i,s,y0,y1);
end
end
endmodule 

