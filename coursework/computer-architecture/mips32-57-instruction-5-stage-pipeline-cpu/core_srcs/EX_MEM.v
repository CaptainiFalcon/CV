`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/10 22:14:24
// Design Name: 
// Module Name: EX_MEM
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


module M(
    input clk,
    input resetn,
    input [4:0] ird, realrd,
    input imemr, ihir, ihiw, ilor, ilow, icp0r, icp0w, ifull, ihalf, ibyte, isignload,
    input [31:0] ialure,
    input [8:0] iexcept,
    input [31:0] ihi,ilo,
    input clM,
    input keepM,
    input iregw,
    input [31:0] ipc,
    input [31:0] ibusb,
    input islot,
    input ijback,
    input imemw,

    output regwm,
    output [4:0] rsm, rtm, rdm,
    output memrm, hirm, hiwm, lorm, lowm, cp0rm, cp0wm, fullm, halfm, bytem, signloadm,
    output [31:0] pcm,
    output [31:0] busbm,
    output [4:0] realrdforrcp0,
    output [31:0] alurem,
    output [8:0] exceptm,
    output [31:0] him, lom,
    output slotm,
    output jbackm,
    output memwm
    );
    reg memr, hir, hiw, lor, low, cp0r, cp0w, full, half, byte, signload;
    reg [31:0] pc;
    reg [4:0] rd;
    reg [4:0] reard;
    reg [31:0] alure;
    reg [8:0] except;
    reg [31:0] hi, lo;
    reg [31:0] busb;
    reg regw;
    reg slot;
    reg jback;
    reg memw;
    initial begin
     memr=0;   hir=0;  hiw=0;  lor=0;  low=0; cp0r=0;
    cp0w=0; full=0; half=0; byte=0; signload=0;
    pc=0;
    rd=0;
    except=0;
    alure=0;
    regw=0;
    hi=0;
    busb=0;
    lo=0;
    slot=0;
    jback=0;
    memw=0;
    end
    always @(posedge clk) begin 
       if(clM==0 && keepM==0) begin
        memr <= imemr;
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
        pc <= ipc;
        busb<=ibusb;
        rd<=ird;
        reard<=realrd;
        alure<=ialure;
        except<=iexcept;
        hi<=ihi;
        lo<=ilo;
        regw <=iregw;
        slot<=islot;
        jback<=ijback;
        memw<=imemw;
        end
        if((keepM==0&&clM==1) || resetn==0) begin
        memr <= 0;
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
        pc <= 0;
        busb<=0;
        rd<=0;
        reard<=0;
        alure<=0;
        except<=0;
        hi<=0;
        lo<=0;
        regw <=0;
        slot<=0;
        jback<=0;
        memw<=0;
        end
    end
    assign rdm=rd;
    assign memrm=memr;
    assign hiwm=hiw;
    assign hirm=hir;
    assign lorm=lor;
    assign lowm=low;
    assign cp0rm=cp0r;
    assign cp0wm=cp0w;
    assign fullm=full;
    assign halfm=half;
    assign bytem=byte;
    assign signloadm=signload;
    assign pcm=pc;
    assign busbm=busb;
    assign realrdforrcp0 = reard;
    assign alurem=alure;
    assign exceptm=except;
    assign him=hi;
    assign lom=lo;
    assign regwm = regw;
    assign slotm=slot;
    assign jbackm=jback;
    assign memwm=memw;
endmodule
