`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2024 01:27:19 PM
// Design Name: 
// Module Name: 2_1_MUX
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


module Mux_2(
    input [31:0] a,
    input [31:0] b,
    input sel,
    output [31:0] out
    );
   assign out = (sel) ? b : a;
endmodule
