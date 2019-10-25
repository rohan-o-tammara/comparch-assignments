`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Datapath
//
// Author: Rohan Tammara
// Last Modified: 8/4/19
//////////////////////////////////////////////////////////////////////////////////


module datapath(
    input clk,
    input rst
    );
    
    wire jmp, alu_control, shift, fwd;
    wire [7:0] instr_code;
    wire [1:0] opcode2_in, opcode3_in, opcode1_out, opcode2_out, opcode3_out;
    wire [2:0] rdst1_out, rdst2_out, rdst3_out;
    wire [2:0] rsrc1_out, rsrc2_out, rsrc3_out;
    wire reg_write2_in, reg_write2_out, reg_write3_out;
    wire [7:0] rdat1, rdat2, shamt;
    wire [7:0] rdat1_out2, rdat2_out2, rdat1_out3, rdat2_out3, shamt_out, alu_res, wb_out;
    
    control_unit CU(opcode1_out, jmp, reg_write2_in, alu_control, shift);
    
    forwarding_unit FU(reg_write3_out, rdst3_out, rdst2_out, fwd);
    
    instruction_fetch IF(clk, rst, jmp, instr_code);
    
    if_id_reg IFID(clk, rst, jmp, instr_code, rdst1_out, rsrc1_out, opcode1_out);
    
    register_file RF(rdst1_out, rsrc1_out, rdst1_out, wb_out, rdat1, rdat2, reg_write2_in, rst);
    
    id_ex_reg IDEX(clk, rst, jmp, rdat1, rdat2, shamt, rdst1_out, rsrc1_out, opcode2_in, reg_write2_in,
                    reg_write2_out, rdst2_out, rsrc2_out, opcode2_out, rdat1_out, rdat2_out, shamt_out);
    
    sign_extend SE(rsrc1_out, shamt);
    
    mux_2to1 MUX1(rdat1_out2, rdat1_out3, fwd, mux1_out);
    
    mux_2to1 MUX2(rdat2_out2, shamt_out, shift, rdat2_in3);
    
    mux_2to1 MUX3(rdat2_out2, rdat2_out3, fwd, mux3_out);
    
    alu ALU(mux1_out, mux3_out, alu_control, alu_res);
    
    ex_wb_reg EXWB(clk, rst, jmp, alu_res, rdst2_out, rsrc2_out, opcode3_in, reg_write2_out, rdat1_out2, rdat2_out2, reg_write3_out,
                    rdst3_out, rsrc3_out, opcode3_out, rdat1_out3, rdat2_out3, wb_out);
    
endmodule
