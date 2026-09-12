`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 00:12:06
// Design Name: 
// Module Name: ext_unit
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


module ext_unit(
    input [15:0] imm,
    input SignExt,
    output [31:0] imm_exted
    );
    assign imm_exted = (SignExt) ? {{16{imm[15]}},imm} :{{16{1'b0}},imm} ;
endmodule
