`include "carry_look_ahead_adder.v"
module carry_look_ahead_adder_tb;
reg[3:0] A, B;
reg Cin;
wire[3:0] S;
wire Cout; 
wire [4:0]out;
carry_look_ahead_adder uut(A,B,Cin,S,Cout,out);
initial begin
A=4'b1000; B=4'b1000; Cin=1'b1;
$display(" A=%b,B=%b,Cin=%b, S=%b, Cout=%b,out=%b",A,B,Cin,S,Cout,out);
#10;
A=4'b1100; B=4'b0010; Cin=1'b1; 
$display(" A=%b,B=%b,Cin=%b, S=%b, Cout=%b,out=%b",A,B,Cin,S,Cout,out);
#10;
A=4'b0100; B=4'b0111; Cin=1'b0; 
$display(" A=%b,B=%b,Cin=%b, S=%b, Cout=%b,out=%b",A,B,Cin,S,Cout,out);
#10;
A=4'b1111; B=4'b1100; Cin=1'b1; 
$display(" A=%b,B=%b,Cin=%b, S=%b, Cout=%b,out=%b",A,B,Cin,S,Cout,out);
#10;
A=4'b1111; B=4'b1111; Cin=1'b1; #10
$display(" A=%b,B=%b,Cin=%b, S=%b, Cout=%b,out=%b",A,B,Cin,S,Cout,out);
$finish;
end
endmodule
