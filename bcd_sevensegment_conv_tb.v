`include "bcd_sevensegment_conv.v"
module bcd_sevensegment_conv_tb;
reg[3:0]D;
wire a,b,c,d,e,f,g;
bcd_sevensegment_conv uut(D,a,b,c,d,e,f,g);
initial begin
$monitor("a=%b b=%b c=%b d=%b e=%b f=%b g=%b D=%d",a,b,c,d,e,f,g,D);
D=4'b0000; 
#10
//$display("a=%b b=%b c=%b d=%b e=%b f=%b g=%b D=%d",a,b,c,d,e,f,g,D);
D=4'b1000; #10
D=4'b0111; #10
D=4'b1001; #10
D=4'b1100; #10
$finish;
end
endmodule
