`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 08:30:12
// Design Name: 
// Module Name: hazard_unit
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


module hazard_unit(
    input mreade,
    input hireade, loreade, cp0reade,
    input [4:0] rde,
    input [4:0] rdm,
    input[4:0] rsd, rtd,
    input regwe,   mrm,
    input cp0readm, hireadm, loreadm,
    input Branch,
    input jump,
    input jr,
    input memrcon, hircon, lorcon, cp0rcon,
    input memre,
    input im_com,  dm_com,  md_com, 
    input sw1, sw0, stexl, stie,
    input [8:0] exceptm,
    
    output keepPC, keepD, keepE, keepM, keepW,
    output  clD, clE, clM, clW
    );
    
    wire readatm;
    wire lastbug;
    assign lastbug = ((sw1||sw0) && stexl==0 && stie==1);
    assign readatm = (mreade==1 || hireade==1 || loreade==1 || cp0reade==1) ? 1 : 0;
    assign keepPC = (!lastbug && exceptm==9'b000000000 && readatm == 1'b1 && (rsd==rde || rtd==rde)) ? 1 :  //load-use for ALU
                 //   (Branch==1 && regwe==1 && (rsd==rde || rtd==rde || rsd==rdm || rtd==rdm)) ? 1 :           //原来只有这一行
                 (!lastbug &&exceptm==9'b000000000 && Branch==1 && regwe==1 && (rsd==rde || rtd==rde)) ? 1 :
                 //(Branch==1 && mrm==1 && (rsd==rdm || rtd==rdm)) ? 1 : 
                 (!lastbug &&exceptm==9'b000000000 && (mrm || cp0readm==1 || hireadm || loreadm) && (rsd==rdm || rtd==rdm)) ? 1 :
                 //   (Branch==1 && mreade==1 && (rsd==rde || rtd==rde)) ? 1 :           //load-use for branch 1
                 //   (Branch==1 && mrm==1 && (rsd==rdm || rtd==rdm)) ? 1 : 0;      //load-use for branch 2
                    (!lastbug &&exceptm==9'b000000000 && jr==1 && regwe==1 && (rsd==rde || rtd==rde || rsd==rdm || rtd==rdm)) ? 1 :
                    (!lastbug &&exceptm==9'b000000000 && (im_com==0||dm_com==0||md_com==0)) ? 1 : 0;

    assign keepD = (!lastbug &&exceptm==9'b000000000 && (keepPC && Branch || keepPC&&jump==1 || keepPC&&(memre ||hireade||loreade||cp0reade) )) ? 1 : //&&(memrcon||hircon||lorcon||cp0rcon)
                    (!lastbug &&exceptm==9'b000000000 && (md_com==0 || dm_com==0)) ? 1 : 0; 
    assign keepE = (!lastbug &&exceptm==9'b000000000 && (dm_com==0||md_com==0)) ? 1:0;
    assign keepM = (!lastbug &&exceptm==9'b000000000 && (dm_com==0)) ? 1 : 0;
    assign keepW = 0;

    
    
    assign clD = (lastbug || exceptm!=9'b00000000) ? 1 : (keepPC==1) ? 1 :  0;
    assign clE = (lastbug ||exceptm!=9'b00000000) ? 1 : (keepD==1)  ? 1 : 0;
    assign clM = (lastbug ||exceptm!=9'b00000000) ? 1 : (keepE==1) ? 1 : 0;
    assign clW = (lastbug ||exceptm!=9'b00000000) ? 1 : (keepM==1) ? 1 : 0;   

endmodule
