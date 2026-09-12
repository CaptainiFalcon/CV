`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 00:14:03
// Design Name: 
// Module Name: dm
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


module dm(
    input clk,
    input [31:0] wd,
    input [31:0] addr,
    input MemWrite,
    input memr,
    input [31:0] pc,
    input [8:0] in_except,
    input full, half, byte,
    input hirm, hiwm, lorm, lowm, cp0rm, cp0wm,

    output endm,
    output [3:0] wendm,
    output [31:0] memrdata,
    output [8:0] except_M,
    output mem_com
    );
    wire [3:0] wea;
    wire ena;
    reg [31:0] prepc;
    assign ena = (full==1 && addr[0]==0 && addr[1]==0) ? 1 :
                (half==1 && addr[0]==0) ? 1 : 
                (byte==1) ? 1 : 0;
    assign endm = ena;
    assign wea = (full==1 && ena==1 && MemWrite==1) ? 4'b1111 : 
                 (half==1 && ena==1 && MemWrite==1 && addr[1]==0) ? 4'b0011 :
                 (half==1 && ena==1 && MemWrite==1 && addr[1]==1) ? 4'b1100 :
                 
                 (byte==1 && ena==1 && MemWrite==1 && addr[1:0]==2'b00) ? 4'b0001 :
                 (byte==1 && ena==1 && MemWrite==1 && addr[1:0]==2'b01) ? 4'b0010 :
                 (byte==1 && ena==1 && MemWrite==1 && addr[1:0]==2'b10) ? 4'b0100 :
                 (byte==1 && ena==1 && MemWrite==1 && addr[1:0]==2'b11) ? 4'b1000 :
                  4'b0000;
    assign wendm=wea;            
                                                                                                                                                 //data_ram        data_ram_1(clk, ena, wea, addr, wd, memdata);
    always @(posedge clk) begin
        prepc <= pc;
    end
   assign except_M = ((full==0&&half==0&&byte==0)) ? {{in_except[8:3]}, 1'b0, {in_except[1:0]}} :
                     (ena!=1 && MemWrite==1)  ? {{in_except[8:3]}, 1'b1, {in_except[1:0]}} : 
                     (ena!=1 && memr==1) ?    {{in_except[8:2]}, 1'b1, {in_except[0]}}    : {{in_except[8:3]}, 1'b0, {in_except[1:0]}};
                    
   assign mem_com = (memr==0&&MemWrite==0 &&!cp0wm) ? 1 :  (prepc==pc) ? 1 : 0;
                   
endmodule