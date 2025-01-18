`timescale 1ns / 1ps



module Datamemory(
input [31:0] A,
input [31:0] WD,
input rst,clk,WE,
output reg [31:0] RD
    );
    reg [31:0] RAM [1023:0];
    initial begin
    $readmemh("C:/Users/Shadow/RISC_V_Pipelined/RISC_V_Pipelined.srcs/sim_1/new/D_mem.mem",RAM);
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
