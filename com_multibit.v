module com_multibit(a,b,eq,lt,gt);
parameter N=4;
input[N-1:0] a;
input [N-1:0] b;
output reg eq,lt,gt;
always @(*) begin
if(a==b) begin
eq=1;
lt=0;
gt=0;
end 
else
if(a<b) begin
eq=0;
lt=1;
gt=0;
end 
else begin
eq=0;
lt=0;
gt=1;
end 
end 
endmodule 



