`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2024 02:47:16 PM
// Design Name: 
// Module Name: RegFile
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


module RegFile(
    input clk,
    input WE3,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD3,
    output reg [31:0] RD1,
    output reg [31:0] RD2
    );
    
    reg [31:0] registers [31:0];
    
    initial begin 
    $readmemh("C:/Users/Shadow/RISC_V/RISC_V.srcs/sim_1/new/Registers.mem",registers);
    end 
    always_comb begin
    RD1 = registers[A1];
    RD2 = registers[A2];
    end
    
    always_ff @(posedge clk) begin
    if(WE3) registers[A3] <= WD3;
    end
endmodule
