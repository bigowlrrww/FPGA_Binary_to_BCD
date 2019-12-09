`timescale 1ns / 1ps

module hex_num_gen(
    input [3:0] digit_sel,
    input [15:0] sw,
    output reg [3:0] hex_num
    );
    
    always @(digit_sel)
    begin
        case(~digit_sel)
            4'b0001: hex_num = sw[3:0];
            4'b0010: hex_num = sw[7:4];
            4'b0100: hex_num = sw[11:8];
            4'b1000: hex_num = sw[15:12];
            default: hex_num = 4'bxxxx;
        endcase
    end
endmodule
