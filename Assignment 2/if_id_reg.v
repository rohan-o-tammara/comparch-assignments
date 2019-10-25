`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// IF/ID Register
//
// Author: Rohan Tammara
// Last Modified: 8/4/19
//////////////////////////////////////////////////////////////////////////////////


module if_id_reg(
    input clk,
    input rst,
    input jmp,
    input [7:0] instr_code,
    output reg [2:0] rd,
    output reg [2:0] rs,
    output reg [1:0] opcode
    );
    
    always@(jmp, rst)
    begin
    if(jmp == 1 || rst == 1)
    begin
    opcode <= 2'b10;
    rd <= 3'b0;
    rs <= 3'b0;
    end
    end
    
    always@(posedge clk)
    begin
    opcode <= instr_code[7:6];
    rd <= instr_code[5:3];
    rs <= instr_code[2:0];
    end
    
endmodule
