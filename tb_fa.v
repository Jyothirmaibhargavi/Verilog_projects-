`include "fa.v"
module  tb_fa;
reg a,b,cin;
wire s,co;
fa dut(a,b,cin,s,co);
initial begin
a = 0; b = 0; cin = 0; #10;  $display("%b %b %b |  %b    %b", a, b,cin, s, co);
a = 0; b = 0; cin = 1; #10;  $display("%b %b %b |  %b    %b", a, b,cin, s, co);
a = 0; b = 1; cin = 0; #10;  $display("%b %b %b |  %b    %b", a, b,cin, s, co);
a = 0; b = 1; cin = 1; #10;  $display("%b %b %b |  %b    %b", a, b,cin, s, co);
a = 1; b = 0; cin = 0; #10;  $display("%b %b %b |  %b    %b", a, b,cin, s, co);
a = 1; b = 0; cin = 1; #10;  $display("%b %b %b |  %b    %b", a, b,cin, s, co);
a = 1; b = 1; cin = 0; #10;  $display("%b %b %b |  %b    %b", a, b,cin, s, co);
a = 1; b = 1; cin = 1; #10;  $display("%b %b %b |  %b    %b", a, b,cin, s, co);
$finish();
end                
endmodule

