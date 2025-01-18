`timescale 1ns / 1ps


module PC_ADDER_2(
 input [31:0] PC,
 input [31:0] ImmExt,
output reg [31:0] PCTarget
    );
   
    always_comb begin
    PCTarget = PC + ImmExt;
    end
endmodule
