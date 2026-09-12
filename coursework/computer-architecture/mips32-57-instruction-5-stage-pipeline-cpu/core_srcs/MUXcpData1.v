`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 10:24:15
// Design Name: 
// Module Name: MUXcpData1
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


module MUXcpData1(
    input [31:0] V1, wd_m, wd_w,
    input [1:0] cpsrcA,
    
    output [31:0] cpdata1
    );
    assign cpdata1 = (cpsrcA == 2'b11) ? wd_m :
                       (cpsrcA == 2'b10) ? wd_w : V1; 
endmodule
