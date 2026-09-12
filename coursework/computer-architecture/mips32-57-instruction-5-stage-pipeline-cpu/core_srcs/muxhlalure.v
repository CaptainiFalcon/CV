`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/21 20:43:56
// Design Name: 
// Module Name: muxhlalure
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


module muxhlmt(
    input [31:0] hidmd, lodmd,
    input [31:0] busa,
    input [31:0] instruction,
    output [31:0] tohi, tolo
    );
    wire mthi;
    wire mtlo;
    assign mthi=(instruction[31:26]==6'b000000 && instruction[5:0]==6'b010001) ? 1 : 0;
    assign mtlo=(instruction[31:26]==6'b000000 && instruction[5:0]==6'b010011) ? 1 : 0;
    assign tohi = (mthi==1)?busa:hidmd;
    assign tolo =(mtlo==1)?busa:lodmd;
endmodule
