`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/21 19:58:04
// Design Name: 
// Module Name: dat
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


module mycpu_top(
    input clk,
    input resetn,
    input [5:0] int,

    output inst_sram_en,
    output [3:0] inst_sram_wen,
    output [31:0] inst_sram_addr,
    output [31:0] inst_sram_wdata,
    input [31:0] inst_sram_rdata,
    
    output data_sram_en,
    output [3:0] data_sram_wen,
    output [31:0] data_sram_addr,
    output [31:0] data_sram_wdata,
    input [31:0] data_sram_rdata,

    output [31:0] debug_wb_pc,
    output [3:0] debug_wb_rf_wen,
    output [4:0] debug_wb_rf_wnum,
    output [31:0] debug_wb_rf_wdata
    );









    wire [31:0] pcf;
    wire [31:0] rd1rm, rd2rm;
    wire [31:0] imm_exted;
    wire [31:0] hidhlreg, lodhlreg;
   // wire [31:0] hidmuxhl, lodmuxhl;
    wire keepPC, keepD, keepE, keepM, keepW;
    wire  clD, clE, clM, clW;
    wire [31:0] dmrddmext;
    wire regdstcon;
    wire jumpcon;
    wire branchcon;
    wire memreadcon;
    wire memwritecon;
    wire alusrc1con;
    wire alusrc2con;
    wire signextcon;
    wire regwcon;
    wire [2:0] branchctrcon;
    wire jrcon;
    wire hireadcon;
    wire hiwritecon;
    wire loreadcon;
    wire lowritecon;
    wire cp0readcon;
    wire cp0writecon;
    wire fullcon;
    wire halfcon;
    wire bytecon;
    wire signloadcon;
    wire [1:0] trs, trt, tnew;  //Ê≤°Êúâ‰ΩøÁî®
    wire [8:0] exceptioncon;
    wire [4:0] aluctrcon;
    wire jbackcon;
    wire [31:0] oepccp0;
    wire [31:0] cp0rdatacp0;
    wire stiecp0;
    wire stexlcp0;
    wire sw1cp0;
    wire sw0cp0;
    wire [1:0] cpsrcAbf;
    wire [1:0] cpsrcBbf;
    wire asbf;
    wire atbf;
    wire [4:0] rderde;
    wire [31:0] cpdata1;
    wire [31:0] cpdata2;
    wire [31:0] busA_imm;
    wire [31:0] tohi, tolo;
    wire [31:0] dmraluhlcp0data;
    wire [31:0] wduandata;
    wire [31:0] busb_imm;

    wire [4:0] rdw;
    wire regww;
    wire [31:0] pcw;
    wire [31:0] totalmdataw;
    wire jbackw;

    wire slotd;
    wire [31:0] instructiond;
    wire [31:0] pcd;
    wire [8:0] exceptd;

    wire [31:0] busae, busbe, ins_imme, instructione;
    wire [4:0] aluctre;
    wire regwe;
    wire [4:0] rse, rte, rde;
    wire regdste, memre, memwe, alusrc1e, alusrc2e, jre, hire, lowe,hiwe, lore;
    wire cp0re, cp0we, fulle, halfe, bytee, signloade, jbacke;
    wire [31:0] pce;
    wire [1:0] alusrca, alusrcb;


    wire regwm;
    wire [4:0] rsm, rtm, rdm;
    wire memrm, hirm, hiwm, lorm, lowm, cp0rm, cp0wm, fullm, halfm, bytem, signloadm;
    wire [31:0] pcm;
    wire [31:0] busbm;
    wire [4:0] realrdforrcp0;
    wire [31:0] alurem;
    wire [8:0] exceptm;
    wire [31:0] him, lom;
    wire jbackm;
    wire memwm;

    wire [31:0] muxbusbone;
    wire [31:0] muxbusaone;

    wire [31:0] alurealu;
    wire ovexalu;

    wire [31:0] npc;

    wire enim;
    wire [3:0] wenim;
    wire [31:0] rdataim;
    wire [8:0] exceptim;
    wire im_com;

    wire endm;
    wire [3:0] wendm;
    wire [31:0] dmrdata;
    wire [8:0] exceptM;         //ÂæàÈáçÔø??
    wire dm_com;

    wire [31:0] hifrommd;
    wire [31:0] lofrommd;
    wire md_com;
    wire slote;
    wire slotm;

    wire [4:0] rsd, rtd, rdd;
    wire [8:0] excepte;
    wire [15:0] immd;
    wire [25:0] ins_imm_26;
    assign ins_imm_26=instructiond[25:0];
    assign rsd = instructiond[25:21];
    assign rtd = instructiond[20:16];
    assign rdd = instructiond[15:11];
    assign immd = instructiond[15:0];
    wire [31:0] toersdata;
    wire [31:0] toertdata;
    assign toersdata = (asbf==1) ? wduandata : rd1rm;
    assign toertdata = (atbf==1) ? wduandata : rd2rm;
    wire [1:0] jumpsrcA;
    wire [31:0] tonpcrmdata;
    wire [31:0] mduandata;

    muxdforjr   muxdforjr_1(jumpsrcA, mduandata, wduandata, rd1rm,   tonpcrmdata);
    rm      rm_1(clk, regww, rsd, rtd, rdw, wduandata, rd1rm, rd2rm);
    pc      pc_1(clk, resetn, npc, keepPC, pcf);
    muxhlmt    muxhlmt_1(hifrommd, lofrommd, muxbusaone, instructione, tohi, tolo);
    muxhldmr   muxhldmr_1(hidhlreg, lodhlreg, dmrddmext, cp0rdatacp0, alurem, hirm, lorm, cp0rm,memrm, dmraluhlcp0data);
    hi_lo_reg   hi_lo_reg_1(clk, hiwm, lowm, him, lom, hidhlreg, lodhlreg);
    hazard_unit  hazard_unit_1(memre, hire, lore,  cp0re, rderde, rdm, rsd, rtd, regwe, memrm,cp0rm,hirm,lorm, branchcon,jumpcon,jrcon,memreadcon,
                               hireadcon,loreadcon,cp0readcon,    memre,  im_com,dm_com, md_com ,sw1cp0, sw0cp0, stexlcp0, stiecp0,exceptM,
                                keepPC, keepD, keepE, keepM, keepW,  clD, clE, clM, clW);
    ext_unit    ext_unit_1(immd, signextcon, imm_exted);
    dmr         dmr_1(dmrdata, fullm,halfm, bytem, signloadm,  alurem,    dmrddmext);
    wire [2:0] sel = 3'b111;    //ÈáåÈù¢Ê≤°Áî®Ôø??
   
    br_forward_unit         br_forward_unit_1(rdm, regwm, rsd, rtd, rdw, regww, branchctrcon, cpsrcAbf, cpsrcBbf,  asbf, atbf);
    MUXrde          MUXrde_1(rte, rde, regdste, jbacke, rderde);
    MUXcpData2      MUXcpData2_1(rd2rm, mduandata, wduandata, cpsrcBbf, cpdata2);
    MUXcpData1      MUXcpData1_1(rd1rm, mduandata, wduandata, cpsrcAbf, cpdata1);
    MUXalua_imm     MUXalua_imm_1(muxbusaone, ins_imme, alusrc1e, busA_imm);
    MUX_pc8_mdata   MUX_pc8_mdata_1(totalmdataw, jbackw, pcw, wduandata);
    MUX_busB_immexted       MUX_busB_immexted_1(muxbusbone, ins_imme, alusrc2e, busb_imm);
    
    W          W_1(clk,resetn, rdm, regwm, dmraluhlcp0data, clW, keepW, pcm, jbackm, rdw, regww, pcw, totalmdataw, jbackw);
    
    
    
    D           D_1(clk,resetn, rdataim, pcf, keepD, clD, exceptim, branchcon, jumpcon, slotd, instructiond, pcd, exceptd);
    wire [8:0] iexcepte;
    assign iexcepte = (exceptioncon[0]==1) ? {exceptd[8:1], 1'b1} : 
                        (exceptioncon[6]==1) ? {exceptd[8:7], 1'b1, exceptd[5:0]} :  // ±£¡Ù÷∏¡Ó
                     (exceptioncon[3]==1) ? {exceptd[8:4], 1'b1, exceptd[2:0]} :    //syscall
                     (exceptioncon[8]==1) ? {1'b1, exceptd[7:0]} :              //∂œµ„¿˝Õ‚
                     exceptd;
    E           E_1(clk,resetn,  toersdata, toertdata, imm_exted, instructiond, aluctrcon, regwcon, rsd, rtd, rdd, regdstcon, memreadcon,    memwritecon,      alusrc1con,
                            alusrc2con, jrcon, hireadcon, hiwritecon, loreadcon, lowritecon, cp0readcon, cp0writecon,fullcon,
                            halfcon, bytecon, signloadcon, jbackcon, clE, keepE, pcd, iexcepte, slotd, 
                            busae, busbe, ins_imme, instructione, aluctre, regwe, rse, rte, rde, regdste, memre, memwe, alusrc1e, alusrc2e, jre, hire, lowe,hiwe, lore, cp0re, cp0we, fulle, halfe, bytee, signloade, jbacke,
                            pce,excepte, slote);
    Forward_unit        Forward_unit_1(rdm, rdw, regwm, regww, rse, rte,rsd,rtd, alusrca, alusrcb, jumpsrcA);
    wire [4:0] realrde;
    assign realrde = instructione[15:11];
    wire [8:0] iexceptm;
    assign iexceptm = (ovexalu==1 && (instructione[31:26]==6'b000000 && instructione[5:0]==6'b100000)) ? { excepte[8:6], 1'b1,excepte[4:0] } :
                      (ovexalu==1 && (instructione[31:26]==6'b001000)) ? { excepte[8:6], 1'b1,excepte[4:0] } :
                      (ovexalu==1 && (instructione[31:26]==6'b000000 && instructione[5:0]==6'b100010)) ?{ excepte[8:6], 1'b1,excepte[4:0] } :  excepte;
    M          M_1(clk,resetn, rderde, realrde, memre, hire, hiwe, lore, lowe, cp0re, cp0we, fulle, halfe, bytee,
                            signloade, alurealu, iexceptm, tohi, tolo, clM, keepM, regwe, pce,    muxbusbone,    slote,jbacke,    memwe,    
                            regwm, rsm, rtm, rdm, memrm, hirm, hiwm, lorm, lowm, cp0rm, cp0wm, fullm, halfm, bytem, signloadm,
                            pcm,  busbm, realrdforrcp0, alurem, exceptm, him, lom, slotm, jbackm, memwm); 
    wire [8:0] IFexcept = 0;    //Ê≤°ÊúâÁî®Âà∞,‰ΩÜË¶Å‰º†ËøõÔø??          
    Center_ctr  Center_ctr_1(instructiond, IFexcept, regdstcon, jumpcon, branchcon, memreadcon, memwritecon,alusrc1con, alusrc2con, signextcon, regwcon, branchctrcon,
                             jrcon, hireadcon, hiwritecon, loreadcon, lowritecon, cp0readcon, cp0writecon, fullcon, halfcon, bytecon, signloadcon, trs, trt, tnew,
                             exceptioncon, aluctrcon, jbackcon );
     cp0         cp0_1(clk,resetn, realrdforrcp0, sel, alurem, exceptM, pcm,memrm, slotm,busbm, cp0wm,  oepccp0, cp0rdatacp0, stiecp0, stexlcp0, sw1cp0, sw0cp0);

    ALU_DataB       ALU_DataB_1(busbe, mduandata, wduandata, alusrcb, muxbusbone );
    ALU_DataA       ALU_DataA_1(busae, mduandata, wduandata, alusrca, muxbusaone );
    ALU_57          ALU_57_1(busA_imm, busb_imm, aluctre, alurealu, ovexalu );
    muxmduandata        muxmduandata_1(jbackm, alurem, pcm, mduandata);
    wire PCsrc = 0;//Ê≤°Áî®Ôø??
    npc     npc_1(pcf, pcd, ins_imm_26, imm_exted, jumpcon, cpdata1, cpdata2, branchcon, branchctrcon, exceptM, oepccp0, tonpcrmdata, jrcon,stexlcp0,stiecp0, sw1cp0, sw0cp0, npc, PCsrc );
    wire [31:0] readaddrinsram;
    assign readaddrinsram[28:0] = pcf[28:0];
    assign readaddrinsram[31:29] = 3'b000;
    im      im_1(clk, readaddrinsram, inst_sram_rdata, inst_sram_en, inst_sram_wen, rdataim, exceptim, im_com );
    assign enim=inst_sram_en;
    assign wenim=inst_sram_wen;
    assign inst_sram_addr=pcf;
    assign inst_sram_wdata=32'b0;
    wire [31:0] fakedmrdata;
    dm      dm_1(clk, busbm, alurem, memwm, memrm, pcm, exceptm, fullm, halfm, bytem,hirm, hiwm, lorm, lowm, cp0rm, cp0wm, endm, wendm, fakedmrdata, exceptM, dm_com);
    wire [31:0] readdataaddr;
    assign readdataaddr[28:2] = alurem[28:2];
   // assign readdataaddr[31:29] = (alurem[31:28]==4'b1000 || alurem[31:28]==4'b1001) ? 4'b0000 : alurem[31:28];
    assign readdataaddr[31:29] = 3'b000;
    assign readdataaddr[1:0] = 2'b00;
    assign data_sram_addr = readdataaddr;
    
    wire [31:0] realindmdata;
    assign realindmdata = //(wendm==4'b1111 || wendm==4'b0011 || wendm==4'b0001) ? busbm :
                          (wendm==4'b1100) ? {busbm[15:0], {16'b0}} :
                          (wendm==4'b0010) ? {{16'b0}, busbm[7:0], {8'b0}} :
                          (wendm==4'b0100) ? {{8'b0}, busbm[7:0], {16'b0}} :
                          (wendm==4'b1000) ? {busbm[7:0], {24'b0}} :busbm;
    assign data_sram_wdata = realindmdata;
    
    
    assign data_sram_en = endm;
    assign data_sram_wen = wendm;
    assign dmrdata = data_sram_rdata;
    M_D     M_D_1(clk, resetn, aluctre, muxbusaone, muxbusbone, pce, hifrommd, lofrommd ,md_com);
    
    wire [31:0] realwbpc;
    assign realwbpc[28:0] = pcw[28:0];
    assign debug_wb_pc = pcw;
    assign debug_wb_rf_wen = (regww==1) ? 4'b1111 : 4'b0000;
    assign debug_wb_rf_wnum=rdw;
    assign debug_wb_rf_wdata = wduandata;
endmodule
