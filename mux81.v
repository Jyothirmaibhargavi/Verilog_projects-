//using dataflow- we use assign 
module mux81(i,s,y);
input [7:0] i;
input [2:0]s;
output y;
assign y= (s== 3'b000)? i[0]:
          (s== 3'b001)? i[1]:
          (s== 3'b010)? i[2]:
          (s== 3'b011)? i[3]:
          (s== 3'b100)? i[4]:
          (s== 3'b101)? i[5]:
          (s== 3'b110)? i[6]:
                        i[7];
endmodule

//using behavioural model 
//if=else
module mux81(i,s,y);
input [7:0] i;
input [2:0]s;
output reg y;
always @(*)begin
if (s==3'b000) y=i[0];
else if (s==3'b001) y=i[1];
else if (s==3'b010) y=i[2];
else if (s==3'b011) y=i[3];
else if (s==3'b100) y=i[4];
else if (s==3'b101) y=i[5];
else if (s==3'b110) y=i[6];
else                y=i[7];
end
endmodule 

//using case 
module mux81(i,s,y);
input [7:0] i;
input [2:0]s;
output reg y;
always@(*)begin
case(s)
3'b000: y=i[0];
3'b001: y=i[1];
3'b010: y=i[2];
3'b011: y=i[3];
3'b100: y=i[4];
3'b101: y=i[5];
3'b110: y=i[6];
3'b111: y=i[7];
endcase
end
endmodule 



//mux81 using mmux1 and mux21
module mux81(i,s,y);
input [7:0] i;
input [2:0]s;
output y;
wire w0,w1;
mux41 m0 (.i(i[3:0]),.s(s[1:0]),.y(w0));
mux41 m1 (.i(i[7:4]),.s(s[1:0]),.y(w1));
mux21 m2 (.i0(w0),.i1(w1),.s(s[2]),.y(y));
endmodule 


// Loading work.mux81_tb
//# Loading work.mux81
//# i         s  | y
//# 00010010 000 | 0
//# 00010010 001 | 1
//# 00010010 010 | 0
//# 00010010 011 | 0
//# 00010010 100 | 1
//# 00010010 101 | 0
//# 00010010 110 | 0
//# 00010010 111 | 0
