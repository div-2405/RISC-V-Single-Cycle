`timescale 1ns / 1ps

module Hazard_Unit(
                input logic [4:0] Rs1D, Rs2D, Rs1E, Rs2E,
                input logic [4:0] RdE, RdM, RdW,
                input logic RegWriteM, RegWriteW,
				input logic ResultSrcE0, PCSrcE,
                output logic [1:0] ForwardAE, ForwardBE,
                output logic StallD, StallF, FlushD, FlushE
    );
    wire lwstall;
     always_comb begin
	    ForwardAE = 2'b00;
		ForwardBE = 2'b00;
        if ((Rs1E == RdM) & (RegWriteM) & (Rs1E != 0)) ForwardAE = 2'b10; 
        else if ((Rs1E == RdW) & (RegWriteW) & (Rs1E != 0)) ForwardAE = 2'b01; 
                    
        if ((Rs2E == RdM) & (RegWriteM) & (Rs2E != 0)) ForwardBE = 2'b10;

        else if ((Rs2E == RdW) & (RegWriteW) & (Rs2E != 0)) ForwardBE = 2'b01;   
	  end
	  
	  assign lwStall = (ResultSrcE0 == 1) & ((RdE == Rs1D) | (RdE == Rs2D));
	  assign StallF = lwStall;
	  assign StallD = lwStall;
	  assign FlushE = lwStall | PCSrcE;
	  assign FlushD = PCSrcE;
endmodule
