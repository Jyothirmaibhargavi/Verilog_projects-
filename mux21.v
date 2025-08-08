//dataflow modeling  we use assign 

module mux21(i1,i0,s,y);
input i0,i1,s;
output y;
assign y=i0&~s|i1&s;
endmodule 


//behavioural modeling we use always block and also for output we use reg 
//using if- else

module mux21(i1,i0,s,y);
input i0,i1,s;
output reg y;
always @ (*) begin
if (s==1'b0) y=i0;
else 
   y=i1;
end 
endmodule 


//using case 
module mux21(i1,i0,s,y);
input i0,i1,s;
output reg y;
always @ (*) begin
case(s)
1'b0: y=i0;
1'b1: y=i1;
endcase
end 
endmodule 



//structural model using gates 

module mux21(i1,i0,s,y);
input i1,i0,s;
output y;
wire ns,d1,d2;
not (ns,s);
and (d0,ns,i0);
and (d1,s,i1);
or  (y,d0,d1);
endmodule 


// Loading work.mux21
//# i1  i0 | s | y 
//#   0  1   0  1
//#   0  0   1  0
//#   0  0   1  0
//#   1  0   1  1

