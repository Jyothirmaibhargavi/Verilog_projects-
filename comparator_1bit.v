//Implement 1 bit comparator
//behavioural model (always - output reg)
module comparator_1bit(a,b,eq,lt,gt);
input a,b;
output reg eq;
output reg lt;
output reg gt;

always@(a or b)begin
case({a,b}) //using case 
2'b00: begin eq=1; lt=0; gt=0 ; end
2'b01: begin eq=0; lt=1; gt=0 ; end
2'b10: begin eq=0; lt=0; gt=1 ; end
2'b11: begin eq=1; lt=0; gt=0 ; end
 default: begin eq = 0; lt = 0; gt = 0; end
endcase 
end
endmodule

//dataflow modeling 
module comparator_1bit(a,b,eq,lt,gt);
input a,b;
output lt,gt,eq;
assign eq =~(a^b); // (a==b); 
assign lt = ~a & b; //(a<b); 
assign gt =  a & ~b; //(a>b);
xnor a1(eq,a,b);
endmodule 


//stutural model 

module comparator_1bit_structural (
  input a, b,
  output eq, lt, gt
);

  wire na, nb, axorb;

  // Inverters
  not (na, a);      // na = ~a
  not (nb, b);      // nb = ~b

  // Equality using XOR and NOT: eq = ~(a ^ b)
  xor (axorb, a, b);
  not (eq, axorb);

  // Greater than: gt = a & ~b
  and (gt, a, nb);

  // Less than: lt = ~a & b
  and (lt, na, b);

endmodule


// A B | EQ LT GT
//# 0 0 |  1  0  0
//# 0 1 |  0  1  0
//# 1 0 |  0  0  1
//# 1 1 |  1  0  0
