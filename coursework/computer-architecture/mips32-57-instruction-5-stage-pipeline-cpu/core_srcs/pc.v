`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 00:19:59
// Design Name: 
// Module Name: pc
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


module pc(
    input clk,
    input reset,
    input [31:0] npc,
    input keepPC,
    output [31:0] pc
    );
    reg [31:0] nowpc;
    assign pc = nowpc;
    initial
        nowpc <= 32'b10010000000000000000000000000000;
    always @(posedge clk) begin
           if(keepPC == 0) begin
           nowpc <= (reset==1'b0) ? 32'hbfc00000 : npc;
           end
    end
endmodule
