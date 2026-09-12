`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/10 23:47:29
// Design Name: 
// Module Name: Forward_unit
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


module Forward_unit(
    input [4:0] rd_fromEX_MEM, rd_fromMEM_WB,
    input RegWrite_fromEX_MEM, RegWrite_fromMEM_WB,
    input [4:0] rs_fromID_EX, rt_fromID_EX,
    input [4:0] rsd, rtd,
//    input [4:0] rdm, rdw, 
//    input regwm, regww, alusrc1, alusrc2,
//    input [4:0] rse, rte,
    
    output [1:0] ALUsrcA, ALUsrcB,
    output [1:0] jumpsrcA
    );
    assign ALUsrcA = (RegWrite_fromEX_MEM == 1'b1 && rd_fromEX_MEM != 0 && (rd_fromEX_MEM == rs_fromID_EX)) ? 2'b11 :
                     (RegWrite_fromMEM_WB == 1'b1 && rd_fromMEM_WB != 0 && (rd_fromMEM_WB == rs_fromID_EX)) ? 2'b10 :
                      2'b01;
    assign ALUsrcB = (RegWrite_fromEX_MEM == 1'b1 && rd_fromEX_MEM != 0 && (rd_fromEX_MEM == rt_fromID_EX)) ? 2'b11 :
                     (RegWrite_fromMEM_WB == 1'b1 && rd_fromMEM_WB != 0 && (rd_fromMEM_WB == rt_fromID_EX)) ? 2'b10 :
                      2'b01;
    assign jumpsrcA = (RegWrite_fromEX_MEM == 1'b1 && rd_fromEX_MEM != 0 && (rd_fromEX_MEM == rsd)) ? 2'b11 :
                      (RegWrite_fromMEM_WB == 1'b1 && rd_fromMEM_WB != 0 && (rd_fromMEM_WB == rsd)) ? 2'b10 :
                       2'b01;
endmodule
