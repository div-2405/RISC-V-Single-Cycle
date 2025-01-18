`timescale 1ns / 1ps

module Memory_register(
                input logic clk, reset,
                input logic [31:0] ALUResultE, WriteDataE, 
                input logic [4:0] RdE, 
                input logic [31:0] PCPlus4E,
                output logic [31:0] ALUResultM, WriteDataM,
                output logic [4:0] RdM, 
                output logic [31:0] PCPlus4M,
                input logic RegWriteE, MemWriteE,
                input logic [1:0] ResultSrcE,  
                output logic RegWriteM, MemWriteM,
                output logic [1:0] ResultSrcM
    );
    always_ff @( posedge clk, posedge reset ) begin 
    if (reset) begin
        ALUResultM <= 0;
        WriteDataM <= 0;
        RdM <= 0; 
        PCPlus4M <= 0;
        RegWriteM <= 0;
        MemWriteM <= 0;
        ResultSrcM <= 0;
    end

    else begin
        ALUResultM <= ALUResultE;
        WriteDataM <= WriteDataE;
        RdM <= RdE; 
        PCPlus4M <= PCPlus4E;   
        RegWriteM <= RegWriteE;
        MemWriteM <= MemWriteE;
        ResultSrcM <= ResultSrcE;     
    end
    
end
endmodule
