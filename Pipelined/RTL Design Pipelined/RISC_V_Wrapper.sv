`timescale 1ns / 1ps


module RISC_V_Wrapper(
input rst,clk
    );
    wire [31:0] PCNext;
    wire [31:0] PC;
    wire StallF;
    PC_CLK inst1(clk,rst,!StallF,PCNext,PC);
    wire [31:0] Instr;
    wire [31:0] PCD,PCPlus4D;
    wire [31:0] PCPlus4;
    wire FlushD;
    wire StallD;
    wire [31:0] InstrD;
    Instruction_memory inst2(rst,PC,Instr);
    Decode_register inst13(clk,Instr,!StallD,PC,PCPlus4,FlushD,rst,InstrD,PCD,PCPlus4D);
    wire [31:0] ImmExt;
    wire [1:0] ImmSrc , ResultSrc ;
    Extend inst4(InstrD [31:7],ImmSrc,ImmExt);
    wire [31:0] Result;
    wire PCSrc , MemWrite , ALUSrc , RegWrite , Jump , Branch ;
    wire [2:0] ALUControl ;
    wire [31:0] RD1;
    wire [31:0] RD2;
    wire FlushE;
    wire [31:0] RD1E,RD2E;
    wire [31:0] PCE,ImmExtE,PCPlus4E;
    wire [4:0] Rs1E,Rs2E,RdE;
    wire RegWriteE,MemWriteE,JumpE,BranchE,ALUSrcE;
    wire [1:0] ResultSrcE;
    wire [2:0] ALUControlE;
    wire RegWriteW;
    wire [31:0] ALUResultM;
    wire [4:0] RdW;
     RegFile inst3(clk, RegWriteW,InstrD [19:15],InstrD [24:20],RdW,Result,RD1,RD2);
     Execute_registers inst14(RD1,RD2,PCD,InstrD [19:15],InstrD [24:20],InstrD [11:7],ImmExt,PCPlus4D,FlushE,clk,rst,RD1E,RD2E,PCE,Rs1E,Rs2E,RdE,ImmExtE,PCPlus4E,RegWrite,RegWriteE,ResultSrc,ResultSrcE,MemWrite,MemWriteE,Jump,JumpE,Branch,BranchE,ALUControl,ALUControlE,ALUSrc,ALUSrcE);
     wire [31:0] SrcAE;
     wire [31:0] WriteDataE;
     wire [1:0] ForwardAE, ForwardBE;
     Mux_4 inst15(RD1E, Result , ALUResultM, ForwardAE, SrcAE);
     Mux_4 inst16(RD2E , Result , ALUResultM ,ForwardBE, WriteDataE);
     wire [31:0] SrcBE;
     Mux_2 inst5(WriteDataE,ImmExtE,ALUSrcE,SrcBE);
     wire Zero;
     wire [31:0] ALUResult;
     ALU inst6(SrcAE ,SrcBE ,ALUControlE ,Zero,ALUResult);
     wire [31:0] ReadData,ReadDataW;
     wire RegWriteM, MemWriteM;
     wire [4:0] RdM;
     wire [1:0] ResultSrcM,ResultSrcW;
     wire [31:0] PCPlus4M,ALUResultW,PCPlus4W;
     wire [31:0] WriteDataM;
     Memory_register inst17(clk, rst,ALUResult, WriteDataE, RdE, PCPlus4E, ALUResultM, WriteDataM, RdM, PCPlus4M,RegWriteE, MemWriteE,ResultSrcE, RegWriteM, MemWriteM,ResultSrcM);
     Datamemory inst7(ALUResultM,WriteDataM,rst,clk,MemWriteM,ReadData);
     Writeback_register inst18(clk, rst, ALUResultM, ReadData, RdM, PCPlus4M,ALUResultW, ReadDataW,RdW, PCPlus4W,RegWriteM, ResultSrcM, RegWriteW, ResultSrcW);
     Mux_4 inst8(ALUResultW , ReadDataW , PCPlus4W ,ResultSrcW,Result);
     PC_ADDER_1 inst9(PC,PCPlus4);
     wire [31:0] PCTarget;
     PC_ADDER_2 inst10(PCE,ImmExtE,PCTarget);
     Mux_2 inst11(PCPlus4,PCTarget,PCSrc,PCNext);
     assign PCSrc = (JumpE | (BranchE & Zero)) ; //PCSrc flag 
     Control_Unit inst12(InstrD [6:0],InstrD [14:12],InstrD [30],ResultSrc,MemWrite, Branch , Jump ,ALUControl,ALUSrc,ImmSrc,RegWrite);
     Hazard_Unit inst19(InstrD [19:15], InstrD [24:20], Rs1E, Rs2E, RdE, RdM, RdW,RegWriteM, RegWriteW,ResultSrcE[0], PCSrc ,ForwardAE, ForwardBE,StallD, StallF, FlushD, FlushE);
endmodule