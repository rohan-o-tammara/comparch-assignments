`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Instruction Fetch
//
// Rohan Tammara
// 23/4/19
//////////////////////////////////////////////////////////////////////////////////


module instruction_fetch(
    input clk,
    input rst,
    input jmp,
    output [7:0] instruction_code
    );
    
    reg [31:0] PC;
    
    wire [31:0] PADD;
    assign PADD = {24'b0, instruction_code[5:0]};
    
    instruction_mem IM(PC, rst, instruction_code);
    
    always@(rst)
    begin
    if(rst == 0)
        begin
        PC <= 0;
        end
    end
    
    always@(posedge clk)
    begin
    if(jmp == 1'b0)
        //PC = PC + 1;
        PC <= PC + 1;
    else
        PC <= PC + PADD;
    end
    
endmodule
