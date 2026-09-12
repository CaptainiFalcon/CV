`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 10:12:40
// Design Name: 
// Module Name: br_forward_unit
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
`define beq 3'b000
`define bne 3'b001
`define bgez 3'b010
`define bgtz 3'b011
`define blez 3'b100
`define bltz 3'b101
`define bgezal 3'b110
`define bltzal 3'b111

module br_forward_unit(
    input [4:0] rdm,// rd_fromMEM_WB,
    input regwm,// RegWrite_fromMEM_WB,
    input [4:0] A1D, A2D,
    input [4:0] rdw,
    input regww,
    input [2:0] brctr,
    
    output [1:0] cpsrcA, cpsrcB,
    output as, at
    );
 //   assign cpsrcA = (RegWrite_fromEX_MEM == 1'b1 && rd_fromEX_MEM != 0 && rd_fromEX_MEM == rs_fromIF_ID) ? 2'b01 :
   // assign cpsrcB = (RegWrite_fromEX_MEM == 1'b1 && rd_fromEX_MEM != 0 && rd_fromEX_MEM == rt_fromIF_ID) ? 2'b01 :
   assign cpsrcA = (regwm==1 && rdm!=0 && rdm==A1D) ? 2'b11 :
                    (regww==1 && rdw!=0 && rdw==A1D) ? 2'b10 : 2'b01;
   assign cpsrcB =  (brctr==`bgez || brctr==`bgtz || brctr==`blez || brctr==`bltz || brctr==`bgezal || brctr==`bltzal) ? 2'b00 :
                    (regwm==1 && rdm!=0 && rdm==A2D) ? 2'b11 : 
                    (regww==1 && rdw!=0 && rdw==A2D) ? 2'b10 : 2'b01;
   assign as = (cpsrcA==2'b10) ? 1 : 0;
   assign at = (cpsrcB==2'b10) ? 1 : 0;
endmodule