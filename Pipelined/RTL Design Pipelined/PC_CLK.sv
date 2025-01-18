`timescale 1ns / 1ps

module PC_CLK(
input clk,rst,
input EN,
input [31:0] PCNext,
output logic [31:0] PC
    );
    
    always_ff @(posedge clk) begin
    if(!rst) PC <= 0;
    else if(EN) begin 
    PC <= PCNext;
    end
    end
endmodule
