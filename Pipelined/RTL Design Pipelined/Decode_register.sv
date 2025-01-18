`timescale 1ns / 1ps


module Decode_register(
    input clk,
    input [31:0] RD,
    input EN,
    input [31:0] PC,
    input [31:0] PCPlus4,
    input CLR,
    input rst,
    output reg [31:0] InstrD,
    output reg [31:0] PCD,
    output reg [31:0] PCPlus4D
    );
    
    always_ff @(posedge clk) begin
    if(rst) begin
     InstrD <= 0; 
     PCD <= 0;
     PCPlus4D <= 0;
    end
    else if (EN) begin
     if(CLR) begin
     InstrD <= 0; 
     PCD <= 0;
     PCPlus4D <= 0;
     end
     else begin
     InstrD <= RD; 
     PCD <= PC;
     PCPlus4D <= PCPlus4;
     end
    end 
    end
endmodule
