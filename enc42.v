//using dataflow
module enc42(d,y);
input [3:0] d;
output [1:0] y;

assign y = (d== 4'b0001) ? 2'b00 :
           (d== 4'b0010) ? 2'b01 :
           (d== 4'b0100) ? 2'b10 :
           (d== 4'b1000) ? 2'b11 :
		   2'bxx;
endmodule 


//behavioural - using case 
module enc42(d,y);
input [3:0] d;
output reg [1:0] y;
always@(*) begin
case (d)
4'b0001: y=2'b00;
4'b0010: y=2'b01;
4'b0100: y=2'b10;
4'b1000: y=2'b11;
default: y=2'bxx;
endcase
end
endmodule


// behavioural - using if-else
module enc42(d, y);
    input  [3:0] d;
    output reg [1:0] y;
    always @(*) begin
        if (d == 4'b0001)
            y = 2'b00;
        else if (d == 4'b0010)
            y = 2'b01;
        else if (d == 4'b0100)
            y = 2'b10;
        else if (d == 4'b1000)
            y = 2'b11;
        else
            y = 2'bxx; 
    end
endmodule


// Structural 4:2 encoder
module enc42(d, y);
    input  [3:0] d;
    output [1:0] y;

    // y[1] = d[2] OR d[3]
    or (y[1], d[2], d[3]);

    // y[0] = d[1] OR d[3]
    or (y[0], d[1], d[3]);
endmodule



//4:2 encoder uisng 4:1 mux
module enc42(d,y);
input [3:0] d;
output[1:0]y;
wire [1:0] sel;

assign sel =   (d[0]) ? 2'b00 :
               (d[1]) ? 2'b01 :
               (d[2]) ? 2'b10 :
               (d[3]) ? 2'b11 : 2'bxx;

  // Use MUX to produce each output
  mux41 mux0 (.i(4'b1010), .s(sel), .y(y[0]));
  mux41 mux1 (.i(4'b1100), .s(sel), .y(y[1])); 
endmodule



//Loading work.enc42_tb
//# Loading work.enc42
//# Time=0 | d=0001 | y=00
//# Time=1 | d=0010 | y=01
//# Time=2 | d=0100 | y=10
//# Time=3 | d=1000 | y=11

