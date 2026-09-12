`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/23 11:02:11
// Design Name: 
// Module Name: muxdforjr
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


module muxdforjr(
    input [1:0] jumpsrcA,
    input [31:0] mduanduandata,
    input [31:0] wduandata,
    input [31:0] rmrdata,
    output [31:0] tonpcrmdata
    );
    assign tonpcrmdata = (jumpsrcA==2'b11) ? mduanduandata :
                         (jumpsrcA==2'b10) ? wduandata :
                         rmrdata;
endmodule
