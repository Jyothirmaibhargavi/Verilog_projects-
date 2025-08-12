module gray_binary(b,g);
parameter N=4;
input [N-1:0]g;
output [N-1:0]b;
assign b={g[N-1],b[N-1:1]^g[N-2:0]};
endmodule


//b=0111,g=0100
//# b=0001,g=0001
//# b=1110,g=1001
//# b=0010,g=0011
//# b=1001,g=1101

