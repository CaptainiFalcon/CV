`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/10 22:44:21
// Design Name: 
// Module Name: MEM_WB
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


module W(
    input clk,
    input resetn,
    input [4:0] ird,
    input iregw,
    input [31:0] imdata,
    input clW,
    input keepW,
    input [31:0] ipc,
    input ijback,
    
    output [4:0] rdw,
    output regww,
    output [31:0] pcw,
    output [31:0] totalmdataw,
    output jbackw
    );
    reg [31:0] pc;
    reg [4:0] rd;
    reg regw;
    reg [31:0] mdata;
    reg jback;
    initial begin
    pc<=0;
    rd<=0;
    regw<=0;
    mdata<=0;
    jback<=0;
    end
    always @(posedge clk) begin 
    if(keepW==0 && clW==0) begin
        pc <= ipc;
        rd<=ird;
        mdata<=imdata;
        regw<=iregw;
        jback<=ijback;
        end
        
        if((keepW==0&&clW==1)|| resetn==0) begin
        pc <= 0;
        rd<=0;
        mdata<=0;
        regw<=0;
        jback<=0;
        end
    end
    assign rdw=rd;
    assign pcw=pc;
    assign totalmdataw = mdata;
    assign regww=regw;
    assign jbackw = jback;
endmodule
