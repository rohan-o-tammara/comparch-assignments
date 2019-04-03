`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Datapath

// Author: Rohan Tammara
// Last Modified: 2/4/19
//////////////////////////////////////////////////////////////////////////////////

module datapath(
    input clk,
    input rst
    );
    
    wire [31:0] instruction_code;
    wire [5:0] opcode;
    wire [4:0] read_reg_num1;
    wire [4:0] read_reg_num2;
    wire [4:0] write_reg_num;
    wire [4:0] shamt;
    wire [5:0] funct;
    wire [20:0] constant;
    wire instruction_class;
    wire shift;
    wire zero;
    wire [3:0] alu_control;
    wire [31:0] alu_result;
    wire [31:0] read_data1;
    wire [31:0] read_data2;
    wire [31:0] const_extended, shamt_extended;
    wire [31:0] mux1_out, mux2_out, mux3_out;
    
    parameter z = 0;
    
    assign opcode = instruction_code[31:26];
    assign write_reg_num = instruction_code[25:21];
    assign read_reg_num1 = instruction_code[20:16];
    assign read_reg_num2 = instruction_code[15:11];
    assign shamt = instruction_code[10:6];
    assign funct = instruction_code[5:0];
    assign constant = instruction_code[20:0];
    assign shamt_extended = {27'd0, shamt};
    
    instruction_fetch IF(
        clk,
        rst,
        instruction_code
        );
    
    control_unit CTRL(
        opcode,
        funct,
        instruction_class,
        reg_write,
        shift,
        alu_control
        );
            
    register_file RF(
        read_reg_num1,
        read_reg_num2,
        write_reg_num,
        alu_result,
        read_data1,
        read_data2,
        reg_write,
        clk,
        rst
        );
    
    sign_extend SE(
        constant,
        const_extended
        );
    
    mux_2to1 MUX1(
        const_extended,
        read_data1,      
        instruction_class,
        mux1_out
        );
    
    mux_2to1 MUX2(
        shamt_extended,
        read_data2,
        shift,
        mux2_out
        );
    
    mux_2to1 MUX3(
        z,
        mux2_out,
        instruction_class,
        mux3_out
        );
        
    alu ALU(
        mux1_out,
        mux3_out,
        alu_control,
        zero,
        alu_result
        );
    
endmodule
