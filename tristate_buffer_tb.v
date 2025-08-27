`include "tristate_buffer.v"
module tristate_buffer_tb;
reg in,en; 
wire out;
tristate_buffer uut(in,en,out);
initial
begin
in=0; en=0;
#10
$display("in=%b, en=%b,out=%b",in,en,out);
in=1; en=0;
#10
$display("in=%b, en=%b,out=%b",in,en,out);
in=0; en=1; 
#10
$display("in=%b, en=%b,out=%b",in,en,out);
in=1; en=1; 
#10
$display("in=%b, en=%b,out=%b",in,en,out);
$finish;
end
endmodule
