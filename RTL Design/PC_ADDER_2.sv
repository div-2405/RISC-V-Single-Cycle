`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2024 01:11:01 PM
// Design Name: 
// Module Name: PC_ADDER_2
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


module PC_ADDER_2(
 input [31:0] PC,
 input [31:0] ImmExt,
output reg [31:0] PCTarget
    );
   
    always_comb begin
    PCTarget = PC + ImmExt;
    end
endmodule
