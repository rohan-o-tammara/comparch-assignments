`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Register File
//
// Author: Rohan Tammara
// Last Modified: 8/4/19
//////////////////////////////////////////////////////////////////////////////////


module register_file(
    input [2:0] read_reg_num1,
    input [2:0] read_reg_num2,
    input [2:0] write_reg_num,
    input [7:0] write_data,
    output [7:0] read_data1,
    output [7:0] read_data2,
    input reg_write,
    input rst
    );
    
    reg [7:0] reg_mem [7:0];
    
    always@(rst)
    begin
    if(rst == 1)
    begin
    reg_mem[0] = 8'd0; 
    reg_mem[1] = 8'd1; 
    reg_mem[2] = 8'd2;
    reg_mem[3] = 8'd3; 
    reg_mem[4] = 8'd4; 
    reg_mem[5] = 8'd5; 
    reg_mem[6] = 8'd6; 
    reg_mem[7] = 8'd7;  
    end
    end
    
    assign read_data1 = reg_mem[read_reg_num1];
    assign read_data2 = reg_mem[read_reg_num2];
    
    always@(*)
    begin
    if(reg_write == 1)
    begin
    reg_mem[write_reg_num] = write_data;
    end
    end
    
endmodule
