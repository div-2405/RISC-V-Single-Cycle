`timescale 1ns / 1ps


module RISC_V_tb();
    reg rst, clk;

    // Instantiate the DUT
    RISC_V_Wrapper dut(rst, clk);

    // Probes for internal signals
    wire [31:0] PC,PCNext,ALUResultM,ReadData;
    wire MemWriteM;

    // Assign DUT signals to probes
    assign PC =dut.PC;
    assign PCNext = dut.PCNext;
    assign ALUResultM = dut.ALUResultM;
    assign MemWriteM = dut.MemWriteM;
    assign RegWrite = dut.RegWrite;

    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 20ns period clock
    end

    initial begin
        rst = 0;
        #20;
        rst = 1;
    end
endmodule
