`timescale 1ns / 1ps

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
    $readmemh("C:/Users/Shadow/RISC_V_Pipelined/RISC_V_Pipelined.srcs/sim_1/new/Registers.mem",registers);
    end 
    always_comb begin
    RD1 = registers[A1];
    RD2 = registers[A2];
    end
    
    always_ff @(negedge clk) begin
    if(WE3) registers[A3] <= WD3;
    end
endmodule
