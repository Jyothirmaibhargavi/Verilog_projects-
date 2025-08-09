//2:4 decoder with enable high using dataflow modeling 
module dec24(en,a,d);
input [1:0]a;
input en;
output [3:0]d;
assign d[0]= en & ~a[1] & ~a[0];
assign d[1]= en & ~a[1] &  a[0];
assign d[2]= en &  a[1] & ~a[0];
assign d[3]= en &  a[1] &  a[0];
endmodule 

//uisng condition operator and assign
module dec24(en,a,d);
input [1:0]a;
input en;
output [3:0]d;
    assign d[0] = (en) ? ((a == 2'b00) ? 1'b1 : 1'b0) : 1'b0; 
    assign d[1] = (en) ? ((a == 2'b01) ? 1'b1 : 1'b0) : 1'b0;
    assign d[2] = (en) ? ((a == 2'b10) ? 1'b1 : 1'b0) : 1'b0;
    assign d[3] = (en) ? ((a == 2'b11) ? 1'b1 : 1'b0) : 1'b0;
endmodule


//we can also use the shift operator and assign
module dec24(en,a,d);
input [1:0]a;
input en;
output [3:0]d;
assign d = en ? (4'b0001<<a):4'b0000;  //(4'b0001 << a) shifts 0001 left by the value of a.
endmodule 


//using behavioural modeling - we use always and for output we use reg 
//using if-else
module dec24(en,a,d);
input [1:0]a;
input en;
output reg [3:0]d;
always @(*) begin
if (en==1'b1)begin 
     if (a==2'b00)   d=4'b0001;
else if (a==2'b01)   d=4'b0010;
else if (a==2'b10)   d=4'b0100;
else                 d=4'b1000;
end else begin
d=4'b0000;
end 
end
endmodule 


//using case 
module dec24(en,a,d);
input [1:0]a;
input en;
output reg [3:0] d;
always @(*) begin
case ({en,a})
 3'b100: d = 4'b0001;
 3'b101: d = 4'b0010;
 3'b110: d = 4'b0100;
 3'b111: d = 4'b1000;
 default: begin
 d=4'b0000;
end 
endcase
end 
endmodule 


//# Loading work.dec24_tb
//# Loading work.dec24
//# EN A  |  D
//# --------------
//# 1  00 | 0001
//# 1  01 | 0010
//# 1  10 | 0100
//# 1  11 | 1000
