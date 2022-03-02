`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 01:02:47 PM
// Design Name: 
// Module Name: hc164
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


module hc164(
    input data_in,
    input reset,
    input clk,
    output reg [7:0] data_out
    );
    
    initial data_out = 8'b00000001;
    
    always @(posedge clk) begin
        if (reset) begin
            data_out = 8'b00000000;
        end
        
        else begin
            data_out = {data_out[6:0], data_in};
        end
    end
endmodule
