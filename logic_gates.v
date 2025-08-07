//gate level 
module logic_gates(a,b,and_out,or_out,
                    and_out,nor_out,xor_out,
					xnor_out,not_out);
input a,b;
output and_out,or_out,nand_out,
       nor_out,xor_out,xnor_out,not_out;
and  g1 (and_out,a,b);
or   g2 (or_out,a,b);
nand g3 (nand_out,a,b);
nor  g4 (nor_out,a,b);
xor  g5 (xor_out,a,b);
xnor g6 (xnor_out,a,b);
not  g7 (not_out,a); 
endmodule 


//dataflow
module logic_gates(a,b,and_out,or_out,
                    and_out,nor_out,xor_out,
					xnor_out,not_out);
input a,b;
output and_out,or_out,nand_out,
       nor_out,xor_out,xnor_out,not_out;
always @(*) begin
    and_out  = a & b;
    or_out   = a | b;
    not_out  = ~a;
    nand_out = ~(a & b);
    nor_out  = ~(a | b);
    xor_out  = a ^ b;
    xnor_out = ~(a ^ b);
  end
endmodule


// Behavioral Modeling
module logic_gates(a,b,and_out,or_out,
                    and_out,nor_out,xor_out,
					xnor_out,not_out);
input a,b;
output and_out,or_out,nand_out,
       nor_out,xor_out,xnor_out,not_out;
always @(*) begin
    and_out  = a & b;
    or_out   = a | b;
    not_out  = ~a;
    nand_out = ~(a & b);
    nor_out  = ~(a | b);
    xor_out  = a ^ b;
    xnor_out = ~(a ^ b);
  end
endmodule

