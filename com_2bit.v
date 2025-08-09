//implement 2 bit comparator
module com_2bit(a,b,eq,lt,gt);
input [1:0]a;
input [1:0]b;
output reg eq,lt,gt;
always@(a or b) begin
 if (a == b) begin 
    eq = 1;
    gt = 0;
    lt = 0;
  end
  else if (a > b) begin
    eq = 0;
    gt = 1;
    lt = 0;
  end
  else begin
    eq = 0;
    gt = 0;
    lt = 1;
  end
end

//dataflow 
assign eq = (a==b);
assign lt = (a<b);
assign gt = (a>b);
endmodule

// 2-bit using 1-bit

module com_2bit(a,b,eq,lt,gt);
input [1:0]a;
input [1:0]b;
output  eq,lt,gt;
wire n1,n2,n3,n4,n5,n6,n7,n8;

comparator_1bit c1(a[0],b[0],n1,n2,n3);
comparator_1bit c2(a[1],b[1],n4,n5,n6);
 assign n7 = n4 & n3; // eq1 & gt0
  assign n8 = n4 & n2; // eq1 & lt0
  assign eq = n1 & n4;
  assign gt = n6 | n7;
  assign lt = n5 | n8;
endmodule 


//Loading work.com_2bit
//# A  B  |  EQ LT GT
//# 00 01 |  0  1  0
//# 01 11 |  0  1  0
//# 01 01 |  1  0  0
//# 01 10 |  0  1  0
//# 01 01 |  1  0  0
//# 10 01 |  0  0  1
//# 01 00 |  0  0  1
//# 01 10 |  0  1  0
//# 01 10 |  0  1  0
//# 01 11 |  0  1  0
//# 10 11 |  0  1  0
//# 10 10 |  1  0  0
//# 00 01 |  0  1  0
//# 00 01 |  0  1  0
//# 01 01 |  1  0  0
//# 11 10 |  0  0  1
