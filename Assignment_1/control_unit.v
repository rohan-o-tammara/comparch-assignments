`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Control Unit 

// Author: Rohan Tammara
// Last Modified: 2/4/19
//////////////////////////////////////////////////////////////////////////////////


module control_unit(
    input [5:0] opcode,
    input [5:0] funct,
    output instruction_class,
    output reg_write,
    output shift,
    output reg [3:0] alu_control
    );
    
    assign instruction_class = (opcode == 6'b000000) ? 0:1;
    assign reg_write = 1;
    assign shift = (funct[6:3] == 4'b0000) ? 1:0;
    
    always@(*)
    begin
        if(opcode == 6'b000000)
        begin
            case(funct)
                6'b100000:
                begin
                alu_control <= 4'b0010;
                end
                6'b100010:
                begin
                alu_control <= 4'b0100;
                end
                6'b100100:
                begin
                alu_control <= 4'b0000;
                end
                6'b100101:
                begin
                alu_control <= 4'b0001;
                end
                6'b000000:
                begin
                alu_control <= 4'b1000;
                end
                6'b000010:
                begin
                alu_control <= 4'b1001;
                end
            endcase    
        end
        else
        begin
            alu_control <= 4'b0010;
        end
    end
    
endmodule
