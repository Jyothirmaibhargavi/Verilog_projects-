//tb using vector 
`include "mux41.v"
module mux41_tb;
reg [3:0] i;
reg [1:0]s;
wire y;
mux41 dut (i,s,y);
initial begin
$display(" i   s   | y ");
$display("---------|---");
repeat (8)begin
{i,s}=$random;
#1;
$display("%b  %b  %b", i,s,y);
end
end
endmodule 


`include "mux41.v"
module mux41_tb;
   reg i0,i1,i2,i3;
   reg s1,s0;
   wire y;
 mux41 dut(i0,i1,i2,i3,s1,s0,y);   
  initial begin
   repeat (8) begin
       {i0,i1,i2,i3,s0,s1}=$random;
	   #1;
	   $display("i0=%b, i1=%b , i2=%b, i3=%b ,s1=%b, s0=%b,  y=%b", i0,i1,i2,i3,s0,s1,y);
	   end
	  end
endmodule 
