`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 10:30:16
// Design Name: 
// Module Name: MUXcpData2
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

module MUXcpData2(
    input [31:0] V2d, wdm, wbw,
    input [1:0] cpsrcB,
    
    output [31:0] cpdata2
    );
    assign cpdata2 = (cpsrcB == 2'b11) ? wdm :
                       (cpsrcB == 2'b10) ? wbw :
                       (cpsrcB==2'b01) ? V2d : 32'b0;
endmodule
