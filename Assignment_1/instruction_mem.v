`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Instruction Memory

// Author: Rohan Tammara
// Last Modified: 2/4/19
//////////////////////////////////////////////////////////////////////////////////

module instruction_mem(
    input [31:0] PC,
    input rst,
    output [31:0] instruction_code
    );
    
    reg [7:0] mem [31:0];
    
    assign instruction_code = {mem[PC], mem[PC+1], mem[PC+2], mem[PC+3]};
    
    always@(rst)
    begin
    if (rst == 1)
        begin
        mem[0] = 8'b00000000 ; mem[1] = 8'b00000001 ; mem[2] = 8'b00010000 ; mem[3] = 8'b00100000;
        mem[4] = 8'b00000000 ; mem[5] = 8'b10000101 ; mem[6] = 8'b00110000 ; mem[7] = 8'b00100010;
        mem[8] = 8'b00000001 ; mem[9] = 8'b00001001 ; mem[10] = 8'b01010000 ; mem[11] = 8'b00100100;
        mem[12] = 8'b00000001 ; mem[13] = 8'b00101000 ; mem[14] = 8'b01010000 ; mem[15] = 8'b00100101;
        mem[16] = 8'b00000001 ; mem[17] = 8'b01100110 ; mem[18] = 8'b00000001 ; mem[19] = 8'b10000000;
        mem[20] = 8'b00000001 ; mem[21] = 8'b10101001 ; mem[22] = 8'b00000010 ; mem[23] = 8'b10000010; 
        end
    end
endmodule
