`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 00:21:37
// Design Name: 
// Module Name: ALU_DataB
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


module ALU_DataB(
    input [31:0] rm_rdata2, EX_MEMdata, MEM_WBdata,
    input [1:0] ALUsrcB,
    
    output [31:0] MUX_dataB_one
    );
    assign MUX_dataB_one = (ALUsrcB == 2'b11) ? EX_MEMdata :
                       (ALUsrcB == 2'b10) ? MEM_WBdata :
                        rm_rdata2 ; 
endmodule
