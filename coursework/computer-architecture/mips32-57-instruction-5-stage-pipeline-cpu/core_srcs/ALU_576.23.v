`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:   dx
// 
// Create Date: 2019/06/19 21:31:17
// Design Name: 
// Module Name: ALU_57
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

`define add 5'b00000
`define addu 5'b00001
`define sub 5'b00010
`define subu 5'b00011
`define slt 5'b00100
`define sltu 5'b00101
`define div 5'b00110
`define divu 5'b00111
`define mult 5'b01000
`define multu 5'b01001
`define andd 5'b01010
`define lui 5'b01011
`define norr 5'b01100
`define orr 5'b01101
`define xorr 5'b01110
`define sllv 5'b01111
`define sll 5'b10000
`define srav 5'b10001
`define sra 5'b10010
`define srlv 5'b10011
`define srl 5'b10100



module ALU_57(
    input [31:0] ind1, ind2,
    input [4:0] aluctr,
    output [31:0] alure,
    output ov_ex
    );
    
    wire signed [31:0] d1_s = ind1;
    wire signed [31:0] d2_s = ind2;
    wire [32:0] add_re = d1_s+d2_s;
    wire [32:0] sub_re = d1_s-d2_s;
    wire [31:0] da1 = d2_s >>> {27'b0,ind1[4:0]};
    wire [31:0] da2 = d2_s >>> {27'b0,ind1[10:6]};
    assign alure = (aluctr==`slt) ? d1_s < d2_s :
                    (aluctr==`sltu) ? ind1 < ind2 :
                    (aluctr==`andd) ? ind1&ind2 :
                    (aluctr==`lui) ? {{ind2[15:0]}, {16{1'b0}}} :
                    (aluctr==`norr) ? ~(ind1|ind2) :
                    (aluctr==`orr) ? ind1|ind2 :
                    (aluctr==`xorr) ? ind1^ind2 :
                    (aluctr==`sllv) ? ind2<<ind1[4:0] :   
                    (aluctr==`sll) ? ind2<<ind1[10:6] :
                    //(aluctr==`sll) ? d2_s<<ind1[10:6] :
                    (aluctr==`add || aluctr==`addu) ? add_re[31:0] :
                    (aluctr==`sub || aluctr==`subu) ? sub_re[31:0] :
                    (aluctr==`srav) ? da1 :
                    (aluctr==`sra) ?  da2 :
                    (aluctr==`srlv) ? ind2>>ind1[4:0] :
                    (aluctr==`srl) ? ind2>>ind1[10:6] : 32'b0;
    assign ov_ex = ((aluctr==`add) && add_re[32]!=add_re[31]) ? 1 :
                   ((aluctr==`sub) && sub_re[32]!=sub_re[31]) ? 1 : 0; 
                    
    
                    
                    
                    
    
endmodule
