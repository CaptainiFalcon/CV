`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/21 00:02:19
// Design Name: 
// Module Name: dmrext
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


module dmr(
    input [31:0] in_dmrd,
    input full, half, byte, sign,
    input [31:0] addr,
    output [31:0] dmrd
    );
    assign dmrd = (full==1) ? in_dmrd :
    
                  (half==1 && sign==1 && addr[1]==0) ? { {16{in_dmrd[15]}}, in_dmrd[15:0]} :
                  (half==1 && sign==1 && addr[1]==1) ? { {16{in_dmrd[31]}}, in_dmrd[31:16]} :
                  (half==1 && sign==0 && addr[1]==0) ? { {16{1'b0}}, in_dmrd[15:0]} :
                  (half==1 && sign==0 && addr[1]==1) ? { {16{1'b0}}, in_dmrd[31:16]} :
                  
                  (byte==1 && sign==1 && addr[1]==0 && addr[0]==0) ? { {24{in_dmrd[7]}}, in_dmrd[7:0]} : 
                  (byte==1 && sign==1 && addr[1]==0 && addr[0]==1) ? { {24{in_dmrd[15]}}, in_dmrd[15:8]} : 
                  (byte==1 && sign==1 && addr[1]==1 && addr[0]==0) ? { {24{in_dmrd[23]}}, in_dmrd[23:16]} : 
                  (byte==1 && sign==1 && addr[1]==1 && addr[0]==1) ? { {24{in_dmrd[31]}}, in_dmrd[31:24]} :  
                  
                  
                  (byte==1 && sign==0 && addr[1]==0 && addr[0]==0) ? { {24{1'b0}}, in_dmrd[7:0]} :
                  (byte==1 && sign==0 && addr[1]==0 && addr[0]==1) ? { {24{1'b0}}, in_dmrd[15:8]} :
                  (byte==1 && sign==0 && addr[1]==1 && addr[0]==0) ? { {24{1'b0}}, in_dmrd[23:16]} :
                  (byte==1 && sign==0 && addr[1]==1 && addr[0]==1) ? { {24{1'b0}}, in_dmrd[31:24]} 
                  : 32'b0;
endmodule
