`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/10 21:50:21
// Design Name: 
// Module Name: ID_EX
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


module E(
    input clk,
    input resetn,
    input [31:0] ibusa, ibusb,
    input [31:0] iins_imm,
    input [31:0] iinstruction,
    input [4:0] ialuctr,
    input iregw,
    input [4:0] irs, irt, ird,
    input iregdst, imemr, imemw, ialusrc1, ialusrc2, ijr, ihir, ihiw, ilor, ilow, icp0r, icp0w, ifull, ihalf, ibyte, isignload,  ijback, //in_SignExt,
    input clE,
    input keepE,
    input [31:0] ipc,
    input [8:0] iexcept,
    input islot,
    
    output [31:0] busae, busbe, ins_imme, instructione,
    output [4:0] aluctre,
    output regwe,
    output [4:0] rse, rte, rde,
    output regdste, memre, memwe, alusrc1e, alusrc2e, jre, hire, lowe,hiwe, lore, cp0re, cp0we, fulle, halfe, bytee, signloade, jbacke,
    output [31:0] pce,
    output [8:0] excepte,
    output slote
    );
    reg [31:0] busa, busb, ins_imm, instruction;
    reg [4:0] aluctr;
    reg regdst, memr, alusrc1, alusrc2, jr, hir, hiw, lor, low, cp0r, cp0w, full, half, byte, signload, jback;
    reg [31:0] pc;
    reg [4:0] rs, rt, rd;
    reg regw;
    reg slot;
    reg memw;
    reg [8:0] except;
    initial begin
    busa=0;
    busb=0;
    ins_imm=0;
    regw=0;
    instruction=0;
    aluctr=0;
    regdst=0;
    memr=0; alusrc1=0;  alusrc2=0; jr=0;   hir=0;  hiw=0;  lor=0;  low=0; cp0r=0;
    cp0w=0; full=0; half=0; byte=0; signload=0;jback=0;
    slot=0;
    memw=0;
    except=0;
    end
    always @(posedge clk) begin 
    if(keepE==0 && clE==0) begin
        busa <= ibusa;
        busb <= ibusb;
        ins_imm <= iins_imm;
        instruction<=iinstruction;
        aluctr <= ialuctr;
        regdst <= iregdst;
        memr <= imemr;
        alusrc1 <= ialusrc1;
        alusrc2 <= ialusrc2;
        jr<=ijr;
        hir<=ihir;
        hiw<=ihiw;
        lor<=ilor;
        low<=ilow;
        cp0r<=icp0r;
        cp0w<=icp0w;
        full<=ifull;
        half<=ihalf;
        byte<=ibyte;
        signload <= isignload;
        jback<=ijback;
        pc<=ipc;
        except<= iexcept;
        rs<=irs;
        rt<=irt;
        rd<=ird;
        regw<=iregw;
        slot<=islot;
        memw<=imemw;
        end
        
        
        if((keepE==0&&clE==1) || resetn==0) begin
        busa <= 0;
        busb <= 0;
        ins_imm <= 0;
        instruction<=0;
        aluctr <= 0;
        regdst <= 0;
        memr <= 0;
        alusrc1 <= 0;
        alusrc2 <= 0;
        jr<=0;
        hir<=0;
        hiw<=0;
        lor<=0;
        low<=0;
        cp0r<=0;
        cp0w<=0;
        full<=0;
        half<=0;
        byte<=0;
        signload <= 0;
        jback<=0;
        pc<=0;
        except<= 0;
        rs<=0;
        rt<=0;
        rd<=0;
        regw<=0;
        slot<=0;
        memw<=0;
        
        end
    end
    assign busae=busa;
    assign busbe=busb;
    assign ins_imme=ins_imm;
    assign instructione=instruction;
    assign aluctre=aluctr;
    assign rse=rs;
    assign rte=rt;
    assign rde=rd;
    assign regdste=regdst;
    assign memre=memr;
    assign alusrc1e=alusrc1;
    assign alusrc2e=alusrc2;
    assign jre = jr;
    assign hiwe=hiw;
    assign hire=hir;
    assign lowe=low;
    assign lore=lor;
    assign cp0re=cp0r;
    assign cp0we=cp0w;
    assign fulle=full;
    assign halfe=half;
    assign bytee=byte;
    assign signloade=signload;
    assign jbacke=jback;
    assign pce=pc;
    assign regwe = regw;
    assign slote=slot;
    assign memwe=memw;
    assign excepte=except;
endmodule
