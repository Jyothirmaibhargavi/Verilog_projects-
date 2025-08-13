////dataflow 
module demux14 (i,s,y);
 input i;
 input [1:0]s;
 output [3:0]y;
assign y[0]=~s[1]&~s[0]&i;
assign y[1]=~s[1]&s[0]&i;
assign y[2]=s[1]&~s[0]&i;
assign y[3]=s[1]&s[0]&i;
endmodule 


//behavioural 
module demux14(i,s,y);
input i;
input [1:0]s;
output reg [3:0]y;
always@(*)begin
y=4'b0000;
case(s)
2'b00: y[0]=i;
2'b01: y[1]=i;
2'b10: y[2]=i;
2'b11: y[3]=i;
default: y=4'b0000;
endcase
end
endmodule

//using demux12 
module demux14(i,s,y);
input i;
input [1:0]s;
output [3:0] y;
wire n1,n2;
demux12 d0(.i(i),.s(s[1]),.y0(n1),.y1(n2));
demux12 d1(.i(n1),.s(s0),.y0(y[0]),.y1(y[1]));
demux12 d2(.i(n2),.s(s0),.y0(y[2]),.y1(y[3]));
endmodule

// Loading work.demux12
//# i=1,s=00,y=0010
//# i=1,s=01,y=0010
//# i=1,s=01,y=0010
//# i=1,s=11,y=1000
//# i=1,s=01,y=0010
//# i=1,s=01,y=0010
//# i=1,s=01,y=0010
//# i=1,s=10,y=1000
//# i=1,s=01,y=0010


