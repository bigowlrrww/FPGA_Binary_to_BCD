`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 05:03:33 PM
// Design Name: 
// Module Name: bin2BCD_4dig_TB
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


module bin2BCD_4dig_TB();
    reg clk;
    reg [15:0] sw;
    wire [6:0] seg;
    wire [3:0] an;
    wire dp;
    
    always
        #5 clk = !clk;
    
    initial
    begin
        sw = 0;
    end
    
    //UUT
    bin2BCD_4dig B2BCD4D(
    clk,
    sw,
    seg,
    an,
    dp
    );
endmodule
