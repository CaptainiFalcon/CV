`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 13:15:10
// Design Name: 
// Module Name: npc
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

module npc(
    input [31:0] pc_IF,
    input [31:0] pc_IF_ID,
    input [25:0] ins_imm_26,        // for j 
    input [31:0] imm_sexted_32,     // for br
    input Jump,
    input [31:0] comd1, comd2,
    input Branch,
    input [2:0] brctr,
    input [8:0] except_M,
    input [31:0] EPC,
    input [31:0] rsdata,
    input jr,
    input stexl,
    input stie,
    input sw1, sw0,
    output [31:0] npc,
    output PCSrc
    );
    wire [1:0] comre;
    wire [31:0] p4 = pc_IF + 4;
    wire lastbug;
    assign lastbug = sw0|sw1;
    wire [31:0] immforbr = {{14{ins_imm_26[15]}}, ins_imm_26[15:0], {2{1'b0}}};
    compare_br      compare_br_1(comd1, comd2, comre);
    assign npc = //(except_M[8]==1) ? 32'hBFC00380 :
                 (except_M[8:4]!=5'b00000) ?  32'hBFC00380 :
                 ((sw1==1 || sw0==1) && stexl==0 && stie==1) ?  32'hBFC00380 :
                 (except_M[0]==1) ? EPC :
                 (except_M[3:1]!=3'b000) ?   32'hBFC00380 :
                 (Jump==1&&jr==0) ? {{pc_IF[31:28]}, ins_imm_26, {2'b00}} :
                 (Branch==1 && brctr==`beq && comre==2'b00) ? pc_IF_ID + 4+immforbr :
                 (Branch==1 && brctr==`bne && comre!=2'b00) ?pc_IF_ID + 4+immforbr :
                 (Branch==1 && brctr==`bgez && (comre==2'b10 || comre==2'b00)) ? pc_IF_ID + 4+immforbr :
                 (Branch==1 && brctr==`bgtz && comre==2'b10) ?  pc_IF_ID + 4+immforbr :
                 (Branch==1 && brctr==`blez && (comre==2'b01 || comre==2'b00)) ? pc_IF_ID + 4+immforbr :
                 (Branch==1 && brctr==`bltz && comre==2'b01) ? pc_IF_ID + 4+immforbr :
                 (Branch==1 && brctr==`bgezal && (comre==2'b10 || comre==2'b00)) ? pc_IF_ID + 4+immforbr :
                 (Branch==1 && brctr==`bltzal && comre==2'b01) ? pc_IF_ID + 4+immforbr :
                 (jr==1) ? rsdata : p4;
                 
endmodule
