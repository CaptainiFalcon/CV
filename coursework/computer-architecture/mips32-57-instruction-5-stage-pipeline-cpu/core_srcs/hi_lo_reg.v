`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 22:06:05
// Design Name: 
// Module Name: hi_lo_reg
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


module hi_lo_reg(
    input clk,
    input hiwrite,
    input lowrite,
    input [31:0] in_hid, in_lod,
    output [31:0] hid, lod
    );
    reg [31:0] HI, LO;
    always @(posedge clk) begin
        if(hiwrite) begin
        HI <= in_hid;
        end
        
        if(lowrite) begin
        LO <= in_lod;
        end
     end
     assign hid = HI;
     assign lod = LO;
endmodule
