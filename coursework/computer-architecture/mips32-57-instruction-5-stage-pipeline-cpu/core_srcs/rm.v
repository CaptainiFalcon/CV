`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 00:12:54
// Design Name: 
// Module Name: rm
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


module rm(
    input clk,
    input RegWrite,
    input [4:0]  raddr1, raddr2, waddr,
    input [31:0] wdata,
    output [31:0] rdata1, rdata2
    );
    reg [31:0] rm[31:0];
    integer i;
    initial
    begin
        for(i=0; i<32; i=i+1)
            rm[i] <= 0;
    end
    assign rdata1 = rm[raddr1];
    assign rdata2 = rm[raddr2];
    always @(posedge clk) begin
        if(RegWrite && waddr != 5'b00000) rm[waddr] <= wdata; 
    end
endmodule
