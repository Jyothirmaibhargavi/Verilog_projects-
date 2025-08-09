// 8:3 Encoder - Dataflow
module enc83(d,y);
input [7:0] d;
output [2:0] y;
    assign y[2] = d[4] | d[5] | d[6] | d[7];
    assign y[1] = d[2] | d[3] | d[6] | d[7];
    assign y[0] = d[1] | d[3] | d[5] | d[7];
endmodule

// 8:3 Encoder - Behavioral using if-else
module enc83(d,y);
input [7:0] d;
output reg [2:0] y;
    always @(*) begin
        if      (d[0]) y = 3'b000;
        else if (d[1]) y = 3'b001;
        else if (d[2]) y = 3'b010;
        else if (d[3]) y = 3'b011;
        else if (d[4]) y = 3'b100;
        else if (d[5]) y = 3'b101;
        else if (d[6]) y = 3'b110;
        else if (d[7]) y = 3'b111;
        else           y = 3'bxxx;
    end
endmodule

// 8:3 Encoder - Behavioral using case
module enc83(d,y);
input [7:0] d;
output reg [2:0] y;
    always @(*) begin
        case (d)
            8'b00000001: y = 3'b000;
            8'b00000010: y = 3'b001;
            8'b00000100: y = 3'b010;
            8'b00001000: y = 3'b011;
            8'b00010000: y = 3'b100;
            8'b00100000: y = 3'b101;
            8'b01000000: y = 3'b110;
            8'b10000000: y = 3'b111;
            default:     y = 3'bxxx;
        endcase
    end
endmodule




