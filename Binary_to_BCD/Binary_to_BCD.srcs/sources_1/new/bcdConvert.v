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
    //State Machine Variables
    
    
    
    
    
    
    
    //Seven Segment controller
    wire clkd;
    wire NOCONNECT;
    wire [3:0] hex_num;
    //Instantiate Modules
    clk_gen cg0(.clk(clk), .rst(btnC), .clk_div(clkd));
    digit_selector ds0(.clk(clkd), .rst(btnC), .digit_sel(an));
    seven_seg ss0(.sw(hex_num), .an(NOCONNECT), .dp(dp), .seg(seg));
endmodule

module bin2BCD_4dig(
    input clk,
    input [15:0] sw,
    output [6:0] seg,
    output [3:0] an,
    output dp
    );
    
    reg [3:0] bit_cnt;
    wire [3:0] dout;
    wire [3:0] BCD3, BCD2, BCD1, BCD0;
    reg [3:0] out3, out2, out1, out0;
    reg din;
    reg done;
    wire overflow;
    
    bin2BCD_1dig dig0 (.done(done), .d_in(din), .clk(clk), .d_out(dout[0]), .Q(BCD0));
    bin2BCD_1dig dig1 (.done(        ), .d_in(         ), .clk(     ), .d_out(       ), .Q(    ));
    bin2BCD_1dig dig2 (.done(        ), .d_in(         ), .clk(     ), .d_out(       ), .Q(    ));
    bin2BCD_1dig dig3 (.done(        ), .d_in(         ), .clk(     ), .d_out(       ), .Q(    ));
    display7segInterface disp0 (.sw({out3,   ,   ,   }), .dec_pnt(overflow), .seg(seg), .an(an), .dp(dp), .clk(clk));
    // An optional input to the 7-segment display may be added for an input to the decimal point to handle the overflow
    
    assign overflow = !(sw > 16'h270F);
    
    initial bit_cnt = 4'hF;
    always @ (posedge clk)
    begin
    bit_cnt = bit_cnt - 1;
    end
    
    initial {out3, out2, out1, out0} = 16'h0000;
    always @ (posedge clk)
    begin 
    if (done)
    {out3, out2, out1, out0} <= {BCD3[2:0], BCD2[3:0], BCD1[3:0], BCD0[3:0], din};
    end
    
    always @ (bit_cnt, sw)
    begin
    din = sw[bit_cnt];
    done = (bit_cnt == 4'b0000);
    end
endmodule

 
module bin2BCD_1dig(
    input done,
    input d_in,
    input clk,
    output d_out,
    output reg [3:0] Q
    );
    
    parameter wait2strt = 2'b00;
    parameter shift = 2'b01;
    parameter add3_shift = 2'b10;
    
    reg [1:0] state, next_state;
    wire [3:0] next_data, next_data3;
    reg [3:0] D;
    wire GT4;
    
    assign GT4 = next_data > 4;
    assign next_data3 = next_data + 3;
    assign next_data = {Q[2:0], d_in};
    assign d_out = Q[3];
    
    always @ (state)
    case (state)
        wait2strt:
        begin
            if (!done)
            begin 
                next_state = shift;         
                D = next_data; 
            end
            else
            begin 
                next_state = wait2strt; 
                D = 4'b0000;    
            end
        end
        shift:
        begin
            if(GT4 && !done)
            begin
                next_state =                 ;
                D =               ;
            end
            else if (!GT4&& !done)
            begin 
                next_state =                ;
                D =               ;
            end
            else
            begin 
                next_state =                 ; 
                D = 4'b0000;
            end
        end
        add3_shift: 
        begin
            if (GT4 && !done)
            begin 
                next_state =                 ;
                D =               ;
            end
            else if (!GT4 && !done)
            begin
                next_state =                 ; 
                D =               ;
            end
            else
            begin 
                next_state =                 ; 
                D = 4'b0000;
            end
        end
    endcase
    
    initial state = 2'b00;
    always @ (posedge clk)
        state <= next_state;
    
    initial Q = 4'b0000;
    always @ (posedge clk)
        Q <= D;
endmodule
