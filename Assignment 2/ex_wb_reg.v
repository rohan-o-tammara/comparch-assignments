`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// EX/WB Register
//
// Author: Rohan Tammara
// Last Modified: 8/4/19
//////////////////////////////////////////////////////////////////////////////////


module ex_wb_reg(
    input clk,
    input rst,
    input jmp,
    input [7:0] ex_in,
    input [2:0] rdst_in,
    input [2:0] rsrc_in,
    input [1:0] opcode_in,
    input reg_write_in,
    input [7:0] rdat1,
    input [7:0] rdat2,
    output reg reg_write_out,
    output reg [2:0] rdst_out,
    output reg [2:0] rsrc_out,
    output reg [1:0] opcode_out,
    output reg [7:0] rdat1_out,
    output reg [7:0] rdat2_out,
    output reg [7:0] wb_out
    );
    
    always@(jmp, rst)
    begin
    if(jmp == 1 || rst == 1)
    begin
    wb_out <= 0;
    rdat1_out <= 0;
    rdat2_out <= 0;
    opcode_out <= 2'b10;
    rdst_out <= 3'b0;
    rsrc_out <= 3'b0;
    end
    end
    
    always@(posedge clk)
    begin
    reg_write_out <= reg_write_in;
    wb_out <= ex_in;
    rdat1_out <= rdat1;
    rdat2_out <= rdat2;
    rdst_out <= rdst_in;
    rsrc_out <= rsrc_in;
    opcode_out <= opcode_in;
    end
    
endmodule
