`timescale 1ns / 1ps


module Mux_2(
    input [31:0] a,
    input [31:0] b,
    input sel,
    output [31:0] out
    );
   assign out = (sel) ? b : a;
endmodule
