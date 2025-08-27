//en = 0 → Output is high-impedance (Z) regardless of input.
//en = 1 → Output follows the input (out = in).

module tristate_buffer(in,en,out);
input in,en;output out;
assign out=en?in:1'bz;
endmodule


//# Loading work.tristate_buffer
//# in=0, en=0,out=z
//# in=1, en=0,out=z
//# in=0, en=1,out=0
//# in=1, en=1,out=1
