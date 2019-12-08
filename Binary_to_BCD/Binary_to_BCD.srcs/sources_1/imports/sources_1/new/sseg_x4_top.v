`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2019 06:03:24 PM
// Design Name: 
// Module Name: sseg_x4 _top
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


module sseg_x4_top(
    input clk,
    input btnC,
    input [15:0] sw,
    output [6:0] seg,
    output [3:0] an,
    output dp,
    output [4:0] JA
    );
    wire clkd;
    wire NOCONNECT;
    wire [3:0] hex_num;
    //Instantiate Modules
    clk_gen cg0(.clk(clk), .rst(btnC), .clk_div(clkd));
    digit_selector ds0(.clk(clkd), .rst(btnC), .digit_sel(an));
    seven_seg ss0(.sw(hex_num), .an(NOCONNECT), .dp(dp), .seg(seg));
    hex_num_gen hng0(.digit_sel(an),.sw(sw),.hex_num(hex_num));
    assign JA = {clkd,an[3:0]};
endmodule
