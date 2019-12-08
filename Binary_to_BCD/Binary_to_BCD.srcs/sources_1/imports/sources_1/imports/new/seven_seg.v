`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2019 04:45:35 PM
// Design Name: 
// Module Name: seven_seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seven_seg(
    input [3:0] sw,
    output [3:0] an,
    output dp,
    output reg [6:0] seg
    );
    assign an = 4'b1110;
    assign dp = 1'b1;
    // -a-
    //|   |
    //f   b
    //|   |
    // -g-
    //|   |
    //e   c
    //|   |
    // -d-
   
    always @(sw)
    begin
        if (sw == 4'h0) begin seg <= 7'b100_0000; end //abcdefg
        else if (sw == 4'h1) begin seg <= 7'b111_1001; end 
        else if (sw == 4'h2) begin seg <= 7'b010_0100; end 
        else if (sw == 4'h3) begin seg <= 7'b011_0000; end 
        else if (sw == 4'h4) begin seg <= 7'b001_1001; end 
        else if (sw == 4'h5) begin seg <= 7'b001_0010; end 
        else if (sw == 4'h6) begin seg <= 7'b000_0010; end 
        else if (sw == 4'h7) begin seg <= 7'b111_1000; end 
        else if (sw == 4'h8) begin seg <= 7'b000_0000; end 
        else if (sw == 4'h9) begin seg <= 7'b001_1000; end 
        else if (sw == 4'hA) begin seg <= 7'b000_1000; end 
        else if (sw == 4'hB) begin seg <= 7'b000_0011; end 
        else if (sw == 4'hC) begin seg <= 7'b010_0111; end 
        else if (sw == 4'hD) begin seg <= 7'b010_0001; end 
        else if (sw == 4'hE) begin seg <= 7'b000_0110; end 
        else if (sw == 4'hF) begin seg <= 7'b000_1110; end 
        else
            seg <= 7'b111_1111;
    end
endmodule
