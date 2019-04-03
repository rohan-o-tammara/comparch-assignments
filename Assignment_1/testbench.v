`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench file for Datapath

// Author: Rohan Tammara
// Last modified: 2/4/19
//////////////////////////////////////////////////////////////////////////////////


module testbench();

reg clk;
reg rst;

datapath uut(.clk(clk), .rst(rst));

initial begin
clk = 0;
repeat(6)
    begin
    #5
    clk = ~clk;
    end
$finish;
end

initial begin
rst = 1;
#2
rst = 0;
end

endmodule
