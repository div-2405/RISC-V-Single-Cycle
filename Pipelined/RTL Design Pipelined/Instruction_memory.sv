`timescale 1ns / 1ps


module Instruction_memory(
input rst,
input [31:0] A,
output reg [31:0] RD
    );
    reg [31:0] mem [1023:0];
    initial begin
    $readmemh("C:/Users/Shadow/RISC_V_Pipelined/RISC_V_Pipelined.srcs/sim_1/new/Inst_Mem.mem",mem);
    end
    always_comb begin
    if(!rst) RD = 0;
    else RD = mem[A[31:0]>>2];
    end
endmodule
