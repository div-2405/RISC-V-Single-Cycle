`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 01:59:13 PM
// Design Name: 
// Module Name: RISC_V_tb
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

module RISC_V_tb();
    reg rst, clk;

    // Instantiate the DUT
    RISC_V_Wrapper dut(rst, clk);

    // Probes for internal signals
    wire [31:0] PC,PCNext, Result, Instr, PCPlus4, SrcA, RD2, ImmExt, SrcB, ALUResult, PCTarget, ReadData;
    wire [2:0] ALUControl;
    wire [1:0] ImmSrc, ResultSrc;
    wire PCSrc, MemWrite, ALUSrc, RegWrite, Jump, Branch, Zero;

    // Assign DUT signals to probes
    assign PC =dut.PC;
    assign PCNext = dut.PCNext;
    assign Result = dut.Result;
    assign Instr = dut.Instr;
    assign PCPlus4 = dut.PCPlus4;
    assign SrcA = dut.SrcA;
    assign RD2 = dut.RD2;
    assign ImmExt = dut.ImmExt;
    assign SrcB = dut.SrcB;
    assign ALUResult = dut.ALUResult;
    assign PCTarget = dut.PCTarget;
    assign ReadData = dut.ReadData;
    assign ALUControl = dut.ALUControl;
    assign ImmSrc = dut.ImmSrc;
    assign ResultSrc = dut.ResultSrc;
    assign PCSrc = dut.PCSrc;
    assign MemWrite = dut.MemWrite;
    assign ALUSrc = dut.ALUSrc;
    assign RegWrite = dut.RegWrite;
    assign Jump = dut.Jump;
    assign Branch = dut.Branch;
    assign Zero = dut.Zero;

    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 20ns period clock
    end

    initial begin
        rst = 0;
        #20;
        rst = 1;
        #160;
        $stop;
    end
endmodule
