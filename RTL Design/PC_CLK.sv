`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2024 12:07:09 PM
// Design Name: 
// Module Name: PC_CLK
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


module PC_CLK(
input clk,rst,
input [31:0] PCNext,
output logic [31:0] PC
    );
    
    always_ff @(posedge clk) begin
    if(!rst) PC <= 0;
    else PC <= PCNext;
    end
endmodule
