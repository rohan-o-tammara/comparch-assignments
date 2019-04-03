`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Instruction Fetch

// Author: Rohan Tammara
// Last Modified: 2/4/19
//////////////////////////////////////////////////////////////////////////////////


module instruction_fetch(
    input clk,
    input rst,
    output [31:0] instruction_code
    );
    
    reg [31:0] PC;
    
    instruction_mem IM(.PC(PC), .rst(rst), .instruction_code(instruction_code));
    
    always@(rst)
    begin
    if(rst == 1)
        begin
        PC <= 0;
        end
    end
    
    always@(posedge clk)
    begin
    PC <= PC + 4;
    end
    
endmodule
