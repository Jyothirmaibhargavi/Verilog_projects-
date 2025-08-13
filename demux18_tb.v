`include "demux18.v"
module demux18_tb;
reg i;
reg [2:0]s;
wire [7:0]y;
demux18 dut (.i(i),.s(s),.y(y));
initial begin
repeat(10) begin
i=1'b1;
{s}=$random;
#1;
$display("i=%b,s=%b,y=%b", i,s,y);
end
end
endmodule 



