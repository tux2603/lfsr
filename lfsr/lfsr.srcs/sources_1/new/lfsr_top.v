`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 01:07:19 PM
// Design Name: 
// Module Name: lfsr_top
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


module lfsr_top(
    input reset_btn,
    input seed_btn,
    input clk,
    output [3:0] leds
    );
    
    wire slow_clk;
    wire lfsr_in;
    wire shift_register_in;
    wire [7:0] shift_register_data;
    wire xor_0, xor_1, xor_2;
    
    clk_divider divider(.clk_in(clk), .ratio(31'h00400000), .clk_out(slow_clk));
    hc164 shift_register(.data_in(seed_btn | xor_2), .reset(reset_btn), .clk(slow_clk), .data_out(shift_register_data));
    
    assign leds = {shift_register_data[3], shift_register_data[1], shift_register_data[4], shift_register_data[7]};
    assign xor_0 = shift_register_data[7] ^ shift_register_data[5];
    assign xor_1 = shift_register_data[4] ^ shift_register_data[3];
    assign xor_2 = xor_0 ^ xor_1;
   
endmodule
