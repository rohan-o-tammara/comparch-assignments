`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Arithmetic and Logic Unit

// Author: Rohan Tammara
// Last Modified: 2/4/19
//////////////////////////////////////////////////////////////////////////////////


module alu(
    input [31:0] A,
    input [31:0] B,
    input [3:0] control,
    output reg zero,
    output reg [31:0] result
    );
    
    always@(A, B, control)
    begin
        case(control)
        4'b0000:
            begin
            result = A & B;
            end
        4'b0001:
            begin
            result = A | B;
            end
        4'b0010:
            begin
            result = A + B;
            end
        4'b0100:
            begin
            result = A - B;
            end
        4'b1000:
            begin
            result = A << B;
            end
        4'b1001:
            begin
            result = A >> B;
            end
        default:
            begin
            result = 0;
            end
        endcase
    end
    
    always@(result)
    begin
    if(result == 0)
        zero = 1;
    else
        zero = 0;
    end
    
endmodule
