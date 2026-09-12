`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 23:59:45
// Design Name: 
// Module Name: cp0
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
`define bva cp00[8]
`define st cp00[12]
`define stexl cp00[12][1]
`define stie cp00[12][0]
`define cabd cp00[13][31]
`define caip1 cp00[13][9]
`define caip0 cp00[13][8]
`define stim1 cp00[12][9]
`define stim0 cp00[12][8]
`define exccode cp00[13][6:2]
`define epc cp00[14]
`define Int 5'h00
`define AdEL 5'h04
`define AdES 5'h05
`define Sys 5'h08
`define Bp 5'h09
`define RI 5'h0a
`define Ov 5'h0c
`define ca cp00[13]


module cp0(
    input clk,
    input reset,
    input [4:0] rcp0addr,
    input [2:0] sel,
    input [31:0] dmaddr,
    input [8:0] except,
    input [31:0] pc,
    input memrm,
    input slot,
    input [31:0] mtcp0data,
    input cp0write,
    output [31:0] oepc,
    output [31:0] cp0rdata,
    output stie,
    output stexl,
    output sw1, sw0
    );
    reg [31:0] cp00[31:0];
    
    assign sw1 = `caip1&`stim1;
    assign sw0 = `caip0&`stim0;
    assign oepc = `epc;
    assign cp0rdata = cp00[rcp0addr];
    assign stexl = `stexl;
    assign stie = `stie;
    
    always @(posedge clk) begin

        if(cp0write==1) begin           // cp0write
            cp00[rcp0addr] <= mtcp0data;
        end
        
        
        
        if(except[8]==1'b1) begin       //break
                   `exccode<=`Bp;
        end
            
            
            
        if(`stexl==0) begin

            if(except[8]==0 && except[7]==1) begin
                 `bva <= pc;
                `exccode<=`AdEL;
            end
            else if(except[8:2]==7'b0000000 && except[1]==1) begin
                 `bva = dmaddr;
                 `exccode<=`AdEL;
            end

            else if(except[8:3]==6'b000000 && (except[2]==1)) begin
                 `bva <= dmaddr;
               `exccode<=`AdES;
            end

            else if(except[8:7]==2'b00 && except[6]==1) begin
               `exccode<=`RI;
            end

            else if(except[8:6]==3'b000 && except[5]==1) begin
                `exccode<=`Ov;
            end

            else if(except[8:5]==4'b0000 && except[4]==1) begin
              //`exccode<=`Sys;
            end

            else if(except[8:4]==5'b00000 && except[3]==1) begin
                  `exccode<=`Sys;
            end

            
            if(except[8:1] != 8'b0 && `stexl==0) begin      //不是bubble
                `stexl <= 1;
                if(slot==1) begin
                    `epc <= pc-4;
                    `cabd <= 1;
                end
                else begin
                      `epc <= pc;
                      `cabd <= 0;
                end
            end
            if( (sw0==1 || sw1==1) && `stexl==0 && `stie==1) begin
                 `stexl <= 1;
                 `epc <= pc+4;
                 `exccode = `Int;
                 if(slot==1) begin
                    `cabd <= 1;
                end
                else begin
                      `cabd <= 0;
                end
            end
            
            
           
            
         
            
            
            
//            if(except[8:1]!=8'b0000000) begin   // 是否是延迟槽指令
//                `stexl <= 1;
//                if(slot==1) begin
//                    `cabd <= 1; 
//                end
//                else begin
//                    `cabd <= 0;
//                end
//            end
            
           


         end
         
        if(except== 9'b000000001) begin //eret
            `stexl <= 0;
        end
        
        
       
    end
    
    
    
    
    
    
     initial begin
        `st[31:23] = 0;
        `st[22] = 1;
        `st[21:16] = 0;
        `st[15:8] = 0;
        `st[7:2] =0;
        `st[1] = 0;
        `st[0] = 0;
        `ca[31] = 0;
        `ca[30] =0;
        `ca[30:16]=0;
        `ca[15:8] =0;
        `ca[7] = 0;
        `ca[6:2] = 0;
        `ca[1:0] =0;
     end
endmodule
