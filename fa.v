//full adder using dataflow
module fa(a,b,cin,s,co);
input a,b,cin;
output s,co;
assign s=a^b^cin;
assign co=a&b|b&cin|cin&a;
endmodule 


//behavioural 
module fa(a,b,cin,s,co);
input a,b,cin;
output reg s,co;
always@(a or b or cin)begin
s =  a^b^cin;
co = a&b|b&cin|cin&a;
end 
endmodule

//Implement in structural modelling using only logic gates
module xor_gate(input a, input b, output y);
    assign y = a ^ b;
	endmodule
module and_gate(input a, input b, output y);
    assign y = a & b;
endmodule
module or_gate(input a, input b, output y);
  assign y = a | b;
endmodule

module fa (a,b,cin,s,co);
input a,b,cin;
output s,co;

wire x1, x2, x3, a1, a2, a3;

  // Sum Logic
  xor_gate u1 (.a(a),    .b(b),    .y(x1));  // x1 = a ^ b
  xor_gate u2 (.a(x1),   .b(cin),  .y(s)); // s = x1 ^ cin

  // Carry Logic
  and_gate u3 (.a(a),    .b(b),    .y(a1));  // a1 = a & b
  and_gate u4 (.a(b),    .b(cin),  .y(a2));  // a2 = b & cin
  and_gate u5 (.a(a),    .b(cin),  .y(a3));  // a3 = a & cin

  or_gate  u6 (.a(a1),   .b(a2),   .y(x2));  // x2 = a1 | a2
  or_gate  u7 (.a(x2),   .b(a3),   .y(co)); // co = x2 | a3

endmodule

// implementing full adder using  Half Adder  logic gates
module half_adder(input a, input b, output sum, output carry);
  xor_gate u1 (.a(a), .b(b), .y(sum));
  and_gate u2 (.a(a), .b(b), .y(carry));
endmodule

module fa ( a,b,cin,s,co);
  input a,b,cin;
  output s,co;
  wire sum1, c1, c2;
  half_adder ha1 (.a(a), .b(b), .sum(sum1), .carry(c1));
  half_adder ha2 (.a(sum1), .b(cin), .sum(s), .carry(c2));

  or_gate u1 (.a(c1), .b(c2), .y(co));

endmodule


//Loading work.tb_fa
//# Loading work.fa
//# 0 0 0 |  0    0
//# 0 0 1 |  1    0
//# 0 1 0 |  1    0
//# 0 1 1 |  0    1
//# 1 0 0 |  1    0
//# 1 0 1 |  0    1
//# 1 1 0 |  0    1
//# 1 1 1 |  1    1
