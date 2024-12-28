`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 02:03:38 PM
// Design Name: 
// Module Name: RISC_V_Wrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RISC_V_Wrapper(
input rst,clk
    );
    wire [31:0] PCNext;
    wire [31:0] PC;
    PC_CLK inst1(clk,rst,PCNext,PC);
    wire [31:0] Instr;
    Instruction_memory inst2(rst,PC,Instr);
    wire [31:0] ImmExt;
    wire [1:0] ImmSrc , ResultSrc ;
    Extend inst4(Instr[31:7],ImmSrc,ImmExt);
    wire [31:0] Result;
    wire PCSrc , MemWrite , ALUSrc , RegWrite , Jump , Branch ;
    wire [2:0] ALUControl ;
    wire [31:0] SrcA;
    wire [31:0] RD2;
     RegFile inst3(clk, RegWrite,Instr[19:15],Instr[24:20],Instr[11:7],Result,SrcA,RD2);

     wire [31:0] SrcB;
     Mux_2 inst5(RD2,ImmExt,ALUSrc,SrcB);
     wire Zero;
     wire [31:0] ALUResult;
     ALU inst6(SrcA,SrcB,ALUControl,Zero,ALUResult);
     wire [31:0] ReadData;
     Datamemory inst7(ALUResult,RD2,rst,clk,MemWrite,ReadData);
     wire [31:0] PCPlus4;
     Mux_4 inst8(ALUResult , ReadData , PCPlus4 ,ResultSrc,Result);
     PC_ADDER_1 inst9(PC,PCPlus4);
     wire [31:0] PCTarget;
     PC_ADDER_2 inst10(PC,ImmExt,PCTarget);
     Mux_2 inst11(PCPlus4,PCTarget,PCSrc,PCNext);
     Control_Unit inst12(Instr[6:0],Instr[14:12],Instr[30],Zero,PCSrc,ResultSrc,MemWrite, Branch, Jump,ALUControl,ALUSrc,ImmSrc,RegWrite);
     
endmodule