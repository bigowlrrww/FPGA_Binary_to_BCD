`timescale 1ns / 1ps

module clk_gen(
    input clk,
    input rst,
    output clk_div
    );
    //LSB is 50MHz MSB is 2.98 Hz
    reg [24:0] counter;
    initial
        counter = 0;
    
    always @(posedge clk, posedge rst)
    begin
		if (rst)
			counter <= 0;
        else
            counter <= counter + 1;
    end
    assign clk_div = counter[17]; // Hz
endmodule
