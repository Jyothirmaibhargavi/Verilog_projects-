//using demmux14
`include "demux14.v"
module demux18(i,s,y);
 input i;
 input [2:0]s;
 output [7:0]y;
 wire [3:0]n;
demux14 g1 (.i(i),.s({1'b0,s[2]}),.y(n));
demux14 g2 (.i(n[0]),.s(s[1:0]),.y(y[3:0]));
demux14 g3 (.i(n[1]),.s(s[1:0]),.y(y[7:4]));
endmodule 
