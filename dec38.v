//uisng dataflow 
module dec38 (en,a,d);
    input        en;
    input   [2:0] a;  
    output  [7:0] d;   
//assign d = en ? (8'b00000001<<a):4'b00000000; //using shift operator 
    assign d[0] = en & ~a[2] & ~a[1] & ~a[0]; // 000
    assign d[1] = en & ~a[2] & ~a[1] &  a[0]; // 001
    assign d[2] = en & ~a[2] &  a[1] & ~a[0]; // 010
    assign d[3] = en & ~a[2] &  a[1] &  a[0]; // 011
    assign d[4] = en &  a[2] & ~a[1] & ~a[0]; // 100
    assign d[5] = en &  a[2] & ~a[1] &  a[0]; // 101
    assign d[6] = en &  a[2] &  a[1] & ~a[0]; // 110
    assign d[7] = en &  a[2] &  a[1] &  a[0]; // 111
endmodule

//using behvaioural model 
using if 
module dec38 (en,a,d);
    input        en;
    input   [2:0] a;  
    output reg [7:0] d;
always @ (*) begin
if (en==1'b1)begin
    if (a == 3'b000) d = 8'b00000001;
	else if (a == 3'b001) d = 8'b00000010;
    else if (a == 3'b010) d = 8'b00000100;
    else if (a == 3'b011) d = 8'b00001000;
    else if (a == 3'b100) d = 8'b00010000;
    else if (a == 3'b101) d = 8'b00100000;
    else if (a == 3'b110) d = 8'b01000000;
    else                  d = 8'b10000000; 
end else begin
	d = 8'b00000000;
end
end
endmodule 

//using case 
module dec38(en,a,d);
    input        en;
    input   [2:0] a;  
    output reg [7:0] d;
always@(*)begin
if (en == 1'b1) begin
            case (a)
                3'b000: d = 8'b00000001;
                3'b001: d = 8'b00000010;
                3'b010: d = 8'b00000100;
                3'b011: d = 8'b00001000;
                3'b100: d = 8'b00010000;
                3'b101: d = 8'b00100000;
                3'b110: d = 8'b01000000;
                3'b111: d = 8'b10000000;
            endcase
        end else begin
            d = 8'b00000000;
        end
    end
endmodule


//decoder 3:8 using 2:4 
module dec38(en,a,d);
    input  [2:0] a;
	input en;
    output [7:0] d;
	wire [3:0] y0,y1;
dec24 d0 (.en(en&~a[2]),.a(a[1:0]),.d(y0));
dec24 d1 (.en(en& a[2]),.a(a[1:0]),.d(y1));
assign d={y1,y0};
endmodule 

// Loading work.dec38_tb
//# Loading work.dec38
//#  a   |   d
//# --------------
//# 000 | 00000001
//# 001 | 00000010
//# 010 | 00000100
//# 011 | 00001000
//# 100 | 00010000
//# 101 | 00100000
//# 110 | 01000000
//# 111 | 10000000


