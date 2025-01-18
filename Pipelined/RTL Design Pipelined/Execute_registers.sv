`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////


module Execute_registers(
    input [31:0] RD1,
    input [31:0] RD2,
    input [31:0] PCD,
    input [4:0] Rs1D,
    input [4:0] Rs2D,
    input [4:0] RdD,
    input [31:0] ImmExtD,
    input [31:0] PCPlus4D,
    input CLR,
    input clk,rst,
    output reg [31:0] RD1E,
    output reg[31:0] RD2E,
    output reg [31:0] PCE,
    output reg [4:0] Rs1E,
    output reg [4:0] Rs2E,
    output reg [4:0] RdE,
    output reg [31:0] ImmExtE,
    output reg [31:0] PCPlus4E,
    input RegWriteD,
    output reg RegWriteE,
    input [1:0] ResultSrcD,
    output reg [1:0] ResultSrcE,
    input MemWriteD,
    output reg MemWriteE,
    input JumpD,
    output reg JumpE,
    input BranchD,
    output reg BranchE,
    input [2:0] ALUControlD,
    output reg [2:0] ALUControlE,
    input ALUSrcD,
    output reg ALUSrcE
    );
    
    always_ff @(posedge clk) begin
    if(rst) begin
            RD1E <= 0;
            RD2E <= 0;
            PCE <= 0;
            Rs1E <= 0;
            Rs2E <= 0;
            RdE <= 0;
            ImmExtE <= 0;
            PCPlus4E <= 0;
            RegWriteE <= 0;
			MemWriteE <= 0;
			JumpE <= 0;
			BranchE <= 0; 
			ALUSrcE <= 0;
			ResultSrcE <= 0;
			ALUControlE <= 0;
    end
    else if (CLR) begin
            RD1E <= 0;
            RD2E <= 0;
            PCE <= 0;
            Rs1E <= 0;
            Rs2E <= 0;
            RdE <= 0;
            ImmExtE <= 0;
            PCPlus4E <= 0;
            RegWriteE <= 0;
			MemWriteE <= 0;
			JumpE <= 0;
			BranchE <= 0; 
			ALUSrcE <= 0;
			ResultSrcE <= 0;
			ALUControlE <= 0;
    end
    else begin
            RD1E <= RD1;
            RD2E <= RD2;
            PCE <= PCD;
            Rs1E <= Rs1D;
            Rs2E <= Rs2D;
            RdE <= RdD;
            ImmExtE <= ImmExtD;
            PCPlus4E <= PCPlus4D;
            RegWriteE <= RegWriteD;
			MemWriteE <= MemWriteD;
			JumpE <= JumpD;
			BranchE <= BranchD; 
			ALUSrcE <= ALUSrcD;
			ResultSrcE <= ResultSrcD;
			ALUControlE <= ALUControlD; 
    end
    end
    
endmodule
