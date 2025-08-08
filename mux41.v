//dataflow - we use assign 
module mux41(i0,i1,i2,i3,s0,s1,y);
input i0,i1,i2,i3,s0,s1;
output y;
//assign y= ~s1&~s0&i0| ~s1&s0&i1| s1&~s0&i2| s1&s0&i3;
//using condition operator 
assign y=  ({s1,s0}==2'b00)? i0:
           ({s1,s0}==2'b01)? i1:
		   ({s1,s0}==2'b10)? i2: 
		                     i3;
endmodule 

//behavioural model with vector - we use always and for output we use reg
//if-else 
module mux41(i,s,y);
input [3:0]i;
input [1:0]s;
output reg y;
always @(*) begin
if (s==2'b00)
       y=i[0];
else if (s==2'b01)
       y=i[1];
else if (s==2'b10)
       y=i[2];
else   
       y=i[3];
end
endmodule 



//using case 
module mux41(i,s,y);
input [3:0]i;
input [1:0]s;
output reg y;
always @(*) begin
case (s)
2'b00: y=i[0];
2'b01: y=i[1];
2'b10: y=i[2];
2'b11: y=i[3];
endcase 
end
endmodule


//mux41 using mux21 / structural 

module mux41(i0,i1,i2,i3,s0,s1,y);
input i0,i1,i2,i3,s0,s1;
output y;
wire y0,y1;
mux21 m0(.i0(i0),.i1(i1),.s(s0),.y(y0));
mux21 m1(.i0(i2),.i1(i3),.s(s0),.y(y1));
mux21 m2(.i0(y0),.i1(y1),.s(s1),.y(y));
endmodule 



// Loading work.mux41_tb
//# Loading work.mux41
//# i0=1, i1=0 , i2=0, i3=1 ,s1=0, s0=0,  y=1
//# i0=0, i1=0 , i2=0, i3=0 ,s1=0, s0=1,  y=0
//# i0=0, i1=0 , i2=1, i3=0 ,s1=0, s0=1,  y=0
//# i0=1, i1=0 , i2=0, i3=0 ,s1=1, s0=1,  y=0
//# i0=0, i1=0 , i2=1, i3=1 ,s1=0, s0=1,  y=0
//# i0=0, i1=0 , i2=1, i3=1 ,s1=0, s0=1,  y=0
//# i0=1, i1=0 , i2=0, i3=1 ,s1=0, s0=1,  y=0
//# i0=0, i1=1 , i2=0, i3=0 ,s1=1, s0=0,  y=0


//#  i   s   | y 
//# ---------|---
//# 1001  00  1
//# 0000  01  0
//# 0010  01  1
//# 1000  11  1
//# 0011  01  1
//# 0011  01  1
//# 1001  01  0
//# 0100  10  1
