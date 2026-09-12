`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 23:34:35
// Design Name: 
// Module Name: MUXalua_imm
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


module MUXalua_imm(
    input [31:0] rdata1,
    input [31:0] imm_ext,
    input ALUsrc1,
    output [31:0] busA_imm
);
    assign busA_imm = (ALUsrc1==0) ? imm_ext : rdata1;

endmodule
