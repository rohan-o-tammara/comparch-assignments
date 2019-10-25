`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ID/EX Register
//
// Author: Rohan Tammara
// Last Modified: 8/4/19
//////////////////////////////////////////////////////////////////////////////////


module id_ex_reg(
    input clk,
    input rst,
    input jmp,
    input [7:0] rd1_in,
    input [7:0] rd2_in,
    input [7:0] shamt_in,
    input [2:0] rdst_in,
    input [2:0] rsrc_in,
    input [1:0] opcode_in,
    input reg_write_in,
    output reg reg_write_out,
    output reg [2:0] rdst_out,
    output reg [2:0] rsrc_out,
    output reg [1:0] opcode_out,
    output reg [7:0] rd1_out,
    output reg [7:0] rd2_out,
    output reg [7:0] shamt_out
    );
    
    always@(jmp, rst)
    begin
    if(jmp == 1 || rst == 1)
    begin
    rd1_out <= 0;
    rd2_out <= 0;
    shamt_out <= 0;
    opcode_out <= 2'b10;
    rdst_out <= 3'b0;
    rsrc_out <= 3'b0;
    end
    end
    
    always@(posedge clk)
    begin
    reg_write_out <= reg_write_in;
    rd1_out <= rd1_in;
    rd2_out <= rd2_in;
    shamt_out <= shamt_in;
    rdst_out <= rdst_in;
    rsrc_out <= rsrc_in;
    opcode_out <= opcode_in;
    end
    
endmodule
