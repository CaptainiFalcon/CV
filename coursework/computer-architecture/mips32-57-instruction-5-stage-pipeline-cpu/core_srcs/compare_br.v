`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 10:10:27
// Design Name: 
// Module Name: compare_br
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


module compare_br(
    input [31:0] data1, data2,
    output [1:0] comre
    );
    wire signed [31:0] d1 = data1;
    wire signed [31:0] d2 = data2;
    assign comre = (d1 < d2) ? 2'b01 :
                   (d1==d2) ? 2'b00 : 2'b10; 
endmodule
