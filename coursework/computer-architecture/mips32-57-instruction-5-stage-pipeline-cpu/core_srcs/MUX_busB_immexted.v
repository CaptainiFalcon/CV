`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 14:39:11
// Design Name: 
// Module Name: MUX_busB_immexted
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


module MUX_busB_immexted(
    input [31:0] rdata2,
    input [31:0] imm_ext,
    input ALUsrc2,
    output [31:0] busB_imm
);
    assign busB_imm = (ALUsrc2==0) ? imm_ext : rdata2;
endmodule
