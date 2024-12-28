`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2024 02:25:01 PM
// Design Name: 
// Module Name: Datamemory
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


module Datamemory(
input [31:0] A,
input [31:0] WD,
input rst,clk,WE,
output reg [31:0] RD
    );
    reg [31:0] RAM [1023:0];
    initial begin
    $readmemh("C:/Users/Shadow/RISC_V/RISC_V.srcs/sim_1/new/D_mem.mem",RAM);
    end
    
    always_comb begin
    if(!rst) begin
    RD = 0;
    end
    else begin
     RD = RAM[A[31:0]>>2];
     end
    end
    
    always_ff @(posedge clk) begin
    if(WE) RAM[A[31:0]>>2] <= WD;
    end
endmodule
