`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/10 21:44:32
// Design Name: 
// Module Name: IF_ID
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


module D(
    input clk,
    input resetn,
    input [31:0] in_instruction,
    input [31:0] in_pc,
    input keepD,
    input clD,
    input [8:0] in_except,
    input branchfromD,   //����d��ָ���Ƿ���branchָ��
    input j,
    output slot,        //��ָ���Ƿ����ӳٲ�ָ��
    output [31:0] instruction_D,
    output [31:0] pc_D,
    output [8:0] except_D
    );
    reg sl;
    reg [31:0] ins;
    reg [31:0] pc;
    reg [8:0] except;
    initial begin
    sl<=0;
    ins <= 0;
    pc <= 0;
    except <= 0;
    end
    always @(posedge clk) begin
       if(keepD == 0 && clD==0) begin
            ins <= in_instruction;
            pc <= in_pc;
            except <= in_except;
            if(branchfromD==1 || j==1)
            begin
                 sl<=1;
            end
            else
            sl<=0;
       end
       if((keepD==0&&clD==1) || resetn==0 ) begin
       ins <= 0;
       pc<=0;
       except<=0;
       sl<=0;
       end
    end
    assign slot = sl;
    assign instruction_D = ins;
    assign pc_D = pc;
    assign except_D = except;
endmodule
