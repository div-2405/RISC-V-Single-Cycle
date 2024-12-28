`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2024 01:01:29 PM
// Design Name: 
// Module Name: PC_ADDER_1
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


module PC_ADDER_1(
input [31:0] PC,
output reg [31:0] PCPlus4
    );
    
    always_comb begin
    PCPlus4 = PC + 4;
    end
endmodule
