`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Arithmetic Logic Unit
//
// Author: Rohan Tammara
// Last Modified: 8/4/19
//////////////////////////////////////////////////////////////////////////////////


module alu(
    input [7:0] A,
    input [7:0] B,
    input control,
    output reg [7:0] result
    );
    
    always@(A, B, control)
    begin
        case(control)
        1'b0:
            begin
            result = A + B;
            end
        1'b1:
            begin
            result = A << B;
            end
        endcase
    end
    
endmodule
