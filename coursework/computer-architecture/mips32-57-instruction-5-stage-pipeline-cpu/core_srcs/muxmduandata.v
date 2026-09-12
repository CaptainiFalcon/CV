`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/23 19:48:23
// Design Name: 
// Module Name: muxmduandata
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


module muxmduandata(
    input jbackm,
    input [31:0] alurem,
    input [31:0] pcm,
    output [31:0] mduandata
    );
    assign mduandata = (jbackm==1) ? pcm : alurem;
endmodule
