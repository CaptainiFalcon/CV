`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 14:22:27
// Design Name: 
// Module Name: MUX_rt_rd
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


module MUXrde(
    input [4:0] rt, rd,
    input RegDST,
    input jback,
    output [4:0] rde
    );
    assign rde = (jback==1) ? 5'd31 :
                (RegDST==1) ? rd : rt;
endmodule
