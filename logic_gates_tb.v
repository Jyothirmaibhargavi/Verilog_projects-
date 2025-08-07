`include "logic_gates.v"

module logic_gates_tb;
reg a,b;
wire and_out,or_out,nand_out,nor_out,xor_out,xnor_out,not_out;

logic_gates dut (.a(a),.b(b),.and_out(and_out),.or_out(or_out),.nand_out(nand_out),.nor_out(nor_out),.xor_out(xor_out),.xnor_out(xnor_out),.not_out(not_out));

 initial begin
    $display("a b | AND OR NAND NOR XOR XNOR NOT");
    $monitor("%b %b |  %b   %b   %b    %b    %b    %b    %b",
              a, b, and_out, or_out,nand_out, nor_out, xor_out, xnor_out,not_out);

    // Apply all input combinations
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
  end
endmodule

