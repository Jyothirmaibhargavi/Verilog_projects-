module binary_gray(b,g);
parameter N=4;
input [N-1:0]b;
output [N-1:0]g;
assign g={b[N-1],b[N-1:1]^b[N-2:0]};
endmodule

//Loading work.binary_gray_tb
//# Loading work.binary_gray
//# b=0100,g=0110
//# b=0001,g=0001
//# b=1001,g=1101
//# b=0011,g=0010
//# b=1101,g=1011

