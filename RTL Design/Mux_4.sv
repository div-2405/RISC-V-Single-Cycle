`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2024 01:33:01 PM
// Design Name: 
// Module Name: Mux_4
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


module Mux_4(
   input [31:0] ALUResult , ReadData , PCPlus4 ,
    input [1:0] ResultSrc,
    output reg [31:0] out
    );
    always_comb begin
   case(ResultSrc)
   2'b00: out = ALUResult;
   2'b01: out = ReadData;
   2'b10: out = PCPlus4;
   default: out = ALUResult;  
   endcase
   end
endmodule
