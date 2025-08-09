`include "comparator_1bit.v"
module comparator_tb;
reg a,b;
wire eq,lt,gt;

comparator_1bit dut (
  .a(a),
  .b(b),
  .eq(eq),
  .lt(lt),
  .gt(gt)
);

initial begin
    $display("A B | EQ LT GT");
    a = 0; b = 0; #1 $display("%b %b |  %b  %b  %b", a, b, eq, lt, gt);
    a = 0; b = 1; #1 $display("%b %b |  %b  %b  %b", a, b, eq, lt, gt);
    a = 1; b = 0; #1 $display("%b %b |  %b  %b  %b", a, b, eq, lt, gt);
    a = 1; b = 1; #1 $display("%b %b |  %b  %b  %b", a, b, eq, lt, gt);
    $finish;
  end
endmodule



`include "com_multibit.v"
module comparator_tb;
reg [3:0]a;
reg [3:0]b;
wire eq,lt,gt;

com_multibit dut(.a(a),.b(b),.eq(eq),.lt(lt),.gt(gt));

initial begin
 $display("A  B  |  EQ LT GT");

repeat (16) begin
  a= $random ;
 b= $random;
 #1;
 $display("%b %b |  %b  %b  %b", a, b, eq, lt, gt);
end
end
endmodule 

