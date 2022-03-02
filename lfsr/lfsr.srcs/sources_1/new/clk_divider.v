`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 01:13:26 PM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
    input clk_in,
    input [31:0] ratio,
    output reg clk_out
    );
    
    initial clk_out = 1'b0;
    reg [31:0] counter = 16'h0000;
    
    always @(posedge clk_in) begin
        if (counter == ratio) begin
            clk_out = ~clk_out;
            counter = 16'h0000;
        end
        
        else begin
            counter = counter + 1'b1;
        end
    end
endmodule
