`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Register File

// Author: Rohan Tammara
// Last Modified: 2/4/19
//////////////////////////////////////////////////////////////////////////////////


module register_file(
    input [4:0] read_reg_num1,
    input [4:0] read_reg_num2,
    input [4:0] write_reg_num,
    input [31:0] write_data,
    output [31:0] read_data1,
    output [31:0] read_data2,
    input reg_write,
    input clk,
    input rst
    );
    
    reg [31:0] reg_mem [31:0];
    
    always@(rst)
    begin
    if(rst == 1)
        begin
        reg_mem[0] = 32'h01;
        reg_mem[1] = 32'h02;
        reg_mem[2] = 32'h03;
        reg_mem[3] = 32'h04;
        end
    end
    
    assign read_data1 = reg_mem[read_reg_num1];
    assign read_data2 = reg_mem[read_reg_num2];
    
    always@(posedge clk)
    begin
    if(reg_write == 1)
        begin
        reg_mem[write_reg_num] = write_data;
        end
    end
    
endmodule