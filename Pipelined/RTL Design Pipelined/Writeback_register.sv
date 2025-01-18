module Writeback_register (input logic clk, reset,
                input logic [31:0] ALUResultM, ReadDataM,  
                input logic [4:0] RdM, 
                input logic [31:0] PCPlus4M,
                output logic [31:0] ALUResultW, ReadDataW,
                output logic [4:0] RdW, 
                output logic [31:0] PCPlus4W,
                input logic RegWriteM, 
                input logic [1:0] ResultSrcM, 
                output logic RegWriteW, 
                output logic [1:0] ResultSrcW);

always_ff @( posedge clk, posedge reset ) begin 
    if (reset) begin
        ALUResultW <= 0;
        ReadDataW <= 0;
        RegWriteW <= 0;
        ResultSrcW <= 0; 
        RdW <= 0; 
        PCPlus4W <= 0;
    end

    else begin
        ALUResultW <= ALUResultM;
        ReadDataW <= ReadDataM;
        RegWriteW <= RegWriteM;
        ResultSrcW <= ResultSrcM;
        RdW <= RdM; 
        PCPlus4W <= PCPlus4M;        
    end
    
end

endmodule