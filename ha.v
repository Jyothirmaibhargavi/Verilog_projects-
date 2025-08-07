//dataflow 
module ha(a,b,s,co);
  input a,b;
  output s,co;
  assign s = a^b;
  assign co = a&b;
endmodule


//dataflow assign using vector 
module ha(a,b,s,co);
  input [7:0] a;
  input [7:0] b;
  output [7:0]s;
  output [7:0] co;

 assign {co, s} = a + b;

//assign s = a ^ b;              // Sum is XOR of a and b
//assign co= a & b;             // Carry is AND of a and b

endmodule 


//behavioural always
module ha(a,b,s,co);
  input [7:0] a;
  input [7:0] b;
  output reg [7:0]s;
  output reg [7:0] co;
always @(a or b) begin 
 s = a ^ b;              // Sum is XOR of a and b
 co= a & b;             // Carry is AND of a and b
end
endmodule 


// A B | Sum  Carry
//# --------------
//# 0 0 |  0    0
//# 0 1 |  1    0
//# 1 0 |  1    0
//# 1 1 |  0    1

//a+b
//Loading work.ha
//# a=00001111 b=00110011 | s=01000010 | co=0
//# a=10101010 b=01010101 | s=11111111 | co=0
//# a=00100100 b=10000001 | s=10100101 | co=0
//# a=00001001 b=01100011 | s=01101100 | co=0
//# a=00001101 b=10001101 | s=10011010 | co=0


////bitwise and xor 
//a=00001111 b=00110011 | s=00111100 | co=00000011
//# a=10101010 b=01010101 | s=11111111 | co=00000000
//# a=00100100 b=10000001 | s=10100101 | co=00000000
//# a=00001001 b=01100011 | s=01101010 | co=00000001
//# a=00001101 b=10001101 | s=10000000 | co=00001101

