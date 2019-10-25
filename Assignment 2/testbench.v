`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench
//
// Rohan Tammara
// 23/4/19 
//////////////////////////////////////////////////////////////////////////////////


module testbench();

    reg clk;
    reg rst;
    
    datapath uut(clk, rst);
    
    initial begin
    clk = 0;
    repeat(10)
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
