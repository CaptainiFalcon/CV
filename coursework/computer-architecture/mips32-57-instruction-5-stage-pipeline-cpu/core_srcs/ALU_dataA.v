`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 00:31:40
// Design Name: 
// Module Name: ALU_dataA
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


module ALU_DataA(
    input [31:0] rm_rdata1, EX_MEMdata, MEM_WBdata,
    input [1:0] ALUsrcA,
    
    output [31:0] ALU_DataAout
    );
    assign ALU_DataAout = (ALUsrcA == 2'b11) ? EX_MEMdata :
                       (ALUsrcA == 2'b10) ? MEM_WBdata : rm_rdata1; 
endmodule
