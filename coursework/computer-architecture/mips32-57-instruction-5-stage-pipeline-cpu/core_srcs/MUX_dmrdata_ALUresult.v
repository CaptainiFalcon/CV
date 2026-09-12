`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 15:09:25
// Design Name: 
// Module Name: MUX_dmrdata_ALUresult
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


module MUX_pc8_mdata(
    input [31:0] mdata,
    input jback,
    input [31:0] pc,
    output [31:0] wdata
);
    assign wdata = (jback==1) ? pc+8 : mdata;
endmodule
