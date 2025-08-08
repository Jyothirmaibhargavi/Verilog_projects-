`include "mux21.v"
module mux21_tb;
reg i1,i0,s;
wire y;
mux21 dut (i1,i0,s,y);
initial begin
   $display("i1  i0 | s | y ");
 repeat (4) begin 
 {i0,i1,s}=$random; // give 32 bit random value
 #1; // delay propagation
 $display("  %b  %b   %b  %b", i1,i0,s,y);
end
end
endmodule
