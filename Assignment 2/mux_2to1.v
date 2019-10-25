`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2019 12:02:27 PM
// Design Name: 
// Module Name: mux_2to1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_2to1(
    input [7:0] a,
    input [7:0] b,
    input select,
    output [7:0] out
    );

assign out = select ? a:b;

endmodule
