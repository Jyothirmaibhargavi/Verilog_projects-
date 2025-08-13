//gate-level 
module demux12(i,s,y0,y1);
input i,s;
output y0,y1;
wire n1;
not g1(n1,s);
and g2 (y0,i,n1);
and g3(y1,i,s);
endmodule 

//behavioural
module demux12(i,s,y0,y1);
input i,s;
output reg  y0,y1;
always @(*)begin
if (s==1'b00)begin
y0=i;
y1=1'b0;
end
else begin
y0=1'b0;
y1=i;
end
end
endmodule 

















//dataflow model
module demux12(i,s,y0,y1);
input i,s;
output reg y0,y1;
assign y0=i&~s;
assign y1=i&s;
endmodule 




