`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Forwarding Unit
//
// Author: Rohan Tammara
// Last Modified: 8/4/19
//////////////////////////////////////////////////////////////////////////////////


module forwarding_unit(
    input exwb_regwrite,
    input exwb_dst,
    input idex_src,
    output reg fwd
    );
    
    always@(*)
    begin
    if(exwb_regwrite == 1 && exwb_dst == idex_src)
    begin
    fwd <= 1;
    end
    end
    
endmodule
