`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2024 12:20:21 PM
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_memory(
input rst,
input [31:0] A,
output reg [31:0] RD
    );
    reg [31:0] mem [1023:0];
    initial begin
    $readmemh("C:/Users/Shadow/RISC_V/RISC_V.srcs/sim_1/new/Inst_Mem.mem",mem);
    end
    always_comb begin
    if(!rst) RD = 0;
    else RD = mem[A[31:0]>>2];
    end
endmodule
