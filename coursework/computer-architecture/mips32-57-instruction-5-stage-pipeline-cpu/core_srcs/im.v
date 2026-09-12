`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/19 21:07:02
// Design Name: 
// Module Name: im
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


module im(
    input clk,
    input [31:0] pc,
    input [31:0] inst_ram_rdata,
    output en,
    output [3:0] wen,
    output [31:0] rdata,
    output [8:0] except,
    output im_com
    );
    reg [31:0] prepc;
    assign im_com = (prepc==pc) ? 1 : 0;
    always @(posedge clk) begin
    prepc <= pc;
    end
    assign en = (pc[0]==0 && pc[1]==0) ? 1 : 0;
    wire [3:0] wea = 4'b0000;  //not write im
    assign except = (en) ? 9'b000000000 : 9'b010000000;
                                                                                                // inst_ram inst_ram_1(clk, en, wea, pc, wdata, rdata);//�涨�˲�����ʱ�ӵ��½���
    assign rdata = inst_ram_rdata;
    assign wen = 4'b0000;
    
endmodule
