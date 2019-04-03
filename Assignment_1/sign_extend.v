`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Sign Extend

// Author: Rohan Tammara
// Last modified: 2/4/19
//////////////////////////////////////////////////////////////////////////////////


module sign_extend(
    input [20:0] constant,
    output reg [31:0] extended_const
    );
    
    always@(*)
    begin
    extended_const <= { {11{constant[20]}}, constant[20:0]};
    end
    
endmodule