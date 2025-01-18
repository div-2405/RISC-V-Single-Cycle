`timescale 1ns / 1ps



module PC_ADDER_1(
input [31:0] PC,
output reg [31:0] PCPlus4
    );
    
    always_comb begin
    PCPlus4 = PC + 4;
    end
endmodule
