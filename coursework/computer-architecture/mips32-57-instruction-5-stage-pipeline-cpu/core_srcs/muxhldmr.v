`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/21 21:10:23
// Design Name: 
// Module Name: muxhldmr
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


module muxhldmr(
    input [31:0] hid, lod, dmrexted, cp0rdata, alure,
    input hiread, loread, 
    input cp0read, memread,
    output [31:0] hldmr
    );
    assign hldmr=(hiread==1)?hid:
                (loread==1)? lod:
                (cp0read==1) ? cp0rdata : 
                (memread==1) ? dmrexted : alure;
endmodule
