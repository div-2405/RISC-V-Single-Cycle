`timescale 1ns / 1ps



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
