`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Instruction Memory
//
// Author: Rohan Tammara
// Last Modified: 8/4/19
//////////////////////////////////////////////////////////////////////////////////


module instruction_mem(
    input [31:0] PC,
    input rst,
    output [7:0] instruction_code
    );
    
    reg [7:0] i_mem [7:0];
    
    assign instruction_code = i_mem[PC];
    
    always@(rst)
    begin
    if (rst == 1)
        begin
        i_mem[0] = 8'b00011101;
        i_mem[1] = 8'b01011001;
        i_mem[2] = 8'b00101011;
        i_mem[3] = 8'b11000010;
        i_mem[4] = 8'b01101011;
        i_mem[5] = 8'b00101101;
        end
    end
    
endmodule
