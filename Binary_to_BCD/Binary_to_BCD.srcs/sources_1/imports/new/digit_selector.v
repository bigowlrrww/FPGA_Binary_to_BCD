`timescale 1ns / 1ps

module digit_selector(
    input clk,
    input rst,
    output reg [3:0] digit_sel
    );
    
    reg [1:0] counter;
    initial
        counter = 0;
    
    always @(posedge clk, posedge rst)
    begin
		if (rst)
			counter <= 0;
        counter <= counter + 1;
    end
    
    always @(counter)
    begin
        case (counter)
            2'b00 : digit_sel = 4'b0111;
            2'b01 : digit_sel = 4'b1011;
            2'b10 : digit_sel = 4'b1101;
            2'b11 : digit_sel = 4'b1110;
            default : digit_sel = 4'bxxxx;
        endcase
    end
endmodule
