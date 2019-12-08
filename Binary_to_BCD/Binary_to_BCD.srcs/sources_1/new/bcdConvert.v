`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 04:31:35 PM
// Design Name: 
// Module Name: bcdConvert
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


module bcdConvert(input clk,
    input btnC,
    input [15:0] sw,
    output [6:0] seg,
    output [3:0] an,
    output dp
    );
    
    wire clkd;
    wire NOCONNECT;
    wire [3:0] hex_num;
    //Instantiate Modules
    clk_gen cg0(.clk(clk), .rst(btnC), .clk_div(clkd));
    digit_selector ds0(.clk(clkd), .rst(btnC), .digit_sel(an));
    seven_seg ss0(.sw(hex_num), .an(NOCONNECT), .dp(dp), .seg(seg));
endmodule