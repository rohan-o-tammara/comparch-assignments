`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Control Unit
//
// Author: Rohan Tammara
// Last Modified: 8/4/19
//////////////////////////////////////////////////////////////////////////////////


module control_unit(
    input [1:0] opcode,
    output jmp,
    output reg_write,
    output reg alu_control,
    output reg shift
    );
    
    assign jmp = (opcode == 2'b11) ? 1:0;
    
    assign reg_write = (opcode == 2'b00 || opcode == 2'b01) ? 1:0;
    
    always@(*)
    begin
    case(opcode)
        2'b00:
        begin
        alu_control <= 1'b0;
        shift <= 1'b0;
        end
        2'b01:
        begin
        alu_control <= 1'b1;
        shift <= 1'b1;
        end
    endcase
    end
    
endmodule
