`timescale 1ns / 1ps
module	Center_ctr(
	input			[31:0]			instruct,
	input           [8:0]			IFexcept,
	output	reg						regdes,
	output	reg						jump,
	output	reg						branch,
	output	reg						memread,
	output	reg						memwrite,
	output	reg						alusrc1,
	output	reg						alusrc2,
	output	reg						signextend,
	output	reg						regwrite,
	output	reg		[2:0]			branch_ctr,
	output	reg						jr,
	output	reg						hiread,
	output	reg						hiwrite,
	output	reg						loread,
	output	reg						lowrite,
	output	reg						cp0read,
	output	reg						cp0write,
	output	reg						full,
	output	reg						half,
	output	reg						bt,
	output	reg						signload,
	output	reg		[1:0]			T_rs,
	output	reg		[1:0]			T_rt,
	output	reg		[1:0]			T_new,
	output	reg		[8:0]			except,
	output	reg		[4:0]			aluctr,
	output	reg						jback
);
		
		
	wire [5:0] op;
	wire [5:0] func;
	wire [4:0] branch_flag;
	assign op = instruct[31:26];
	assign func = instruct[5:0];
	assign branch_flag = instruct[20:16];
	
	
	
	always@(*)
	begin
		case(op)
		6'b000000	:					//R
			begin
				case(func)		
				6'b100000	:			//add
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b00000;
					jback		=	0;
					end						
				
				6'b100001	:			//addu
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b00001;
					jback		=	0;
					end	
					
				6'b100010	:			//sub
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b00010;
					jback		=	0;
					end				
				
				6'b100011	:			//subu
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b00011;
					jback		=	0;
					end	
				
				6'b101010	:			//slt
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b00100;
					jback		=	0;
					end	
					
				6'b101011	:			//sltu
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b00101;
					jback		=	0;
					end	
					
				6'b011010	:			//div
					begin
					regdes		=	0;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	0;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	1;
					loread		=	0;
					lowrite		=	1;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b00110;
					jback		=	0;
					end	
					
				6'b011011	:			//divu
					begin
					regdes		=	0;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	0;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	1;
					loread		=	0;
					lowrite		=	1;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b00111;
					jback		=	0;
					end	
					
				6'b011000	:			//mult
					begin
					regdes		=	0;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	0;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	1;
					loread		=	0;
					lowrite		=	1;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b01000;
					jback		=	0;
					end	
					
				6'b011001	:			//multu
					begin
					regdes		=	0;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	0;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	1;
					loread		=	0;
					lowrite		=	1;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b01001;
					jback		=	0;
					end
					
				6'b100100	:			//and
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b01010;
					jback		=	0;
					end
					
				6'b100111	:			//nor
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b01100;
					jback		=	0;
					end
					
				6'b100101	:			//or
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b01101;
					jback		=	0;
					end
					
				6'b100110	:			//xor
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b01110;
					jback		=	0;
					end
					
				6'b000100	:			//sllv
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b01111;
					jback		=	0;
					end
				
				6'b000000	:			//sll
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	0;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b11;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b10000;
					jback		=	0;
					end
					
				6'b000111	:			//srav
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b10001;
					jback		=	0;
					end
					
				6'b000011	:			//sra
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	0;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b11;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b10010;
					jback		=	0;
					end
				
				6'b000110	:			//srlv
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b01;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b10011;
					jback		=	0;
					end
					
				6'b000010	:			//srl
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	0;
					alusrc2		=	1;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b11;
					T_rt		=	2'b01;
					T_new		=	2'b10;
					except		=	IFexcept;
					aluctr		=	5'b10100;
					jback		=	0;
					end
					
				6'b001000	:			//jr
					begin
					regdes		=	0;
					jump		=	1;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	0;
					signextend	=	0;
					regwrite	=	0;
					branch_ctr	=	3'b000;
					jr			=	1;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b00;
					T_rt		=	2'b11;
					T_new		=	2'b01;
					except		=	IFexcept;
					aluctr		=	5'b00000;
					jback		=	0;
					end
					
				6'b001001	:			//jalr
					begin
					regdes		=	1;
					jump		=	1;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	0;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	1;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b00;
					T_rt		=	2'b11;
					T_new		=	2'b01;
					except		=	IFexcept;
					aluctr		=	5'b00000;
					jback		=	1;
					end
					
				6'b010000	:			//mfhi
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	0;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	1;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b11;
					T_rt		=	2'b11;
					T_new		=	2'b11;
					except		=	IFexcept;
					aluctr		=	5'b00000;
					jback		=	0;
					end
				
				6'b010010	:			//mflo
					begin
					regdes		=	1;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	0;
					signextend	=	0;
					regwrite	=	1;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	1;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b11;
					T_rt		=	2'b11;
					T_new		=	2'b11;
					except		=	IFexcept;
					aluctr		=	5'b00000;
					jback		=	0;
					end
					
				6'b010001	:			//mthi
					begin
					regdes		=	0;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	0;
					signextend	=	0;
					regwrite	=	0;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	1;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b10;
					T_rt		=	2'b11;
					T_new		=	2'b01;
					except		=	IFexcept;
					aluctr		=	5'b00000;
					jback		=	0;
					end
					
				6'b010011	:			//mtlo
					begin
					regdes		=	0;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	0;
					signextend	=	0;
					regwrite	=	0;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	1;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b10;
					T_rt		=	2'b11;
					T_new		=	2'b01;
					except		=	IFexcept;
					aluctr		=	5'b00000;
					jback		=	0;
					end
					
				6'b001101	:			//break
					begin
					regdes		=	0;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	0;
					signextend	=	0;
					regwrite	=	0;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b11;
					T_rt		=	2'b11;
					T_new		=	2'b00;
					except		=	{1'b1,IFexcept[7:0]};
					aluctr		=	5'b00000;
					jback		=	0;
					end
					
				6'b001100	:			//syscall
					begin
					regdes		=	0;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	1;
					alusrc2		=	0;
					signextend	=	0;
					regwrite	=	0;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b11;
					T_rt		=	2'b11;
					T_new		=	2'b00;
					except		=	{IFexcept[8:4],1'b1,IFexcept[2:0]};
					aluctr		=	5'b00000;
					jback		=	0;
					end
				default	:
					begin
					regdes		=	0;
					jump		=	0;
					branch		=	0;
					memread		=	0;
					memwrite	=	0;
					alusrc1		=	0;
					alusrc2		=	0;
					signextend	=	0;
					regwrite	=	0;
					branch_ctr	=	3'b000;
					jr			=	0;
					hiread		=	0;
					hiwrite		=	0;
					loread		=	0;
					lowrite		=	0;
					cp0read		=	0;
					cp0write	=	0;
					full		=	0;
					half		=	0;
					bt			=	0;
					signload	=	0;
					T_rs		=	2'b11;
					T_rt		=	2'b11;
					T_new		=	2'b00;
					except		=	{IFexcept[8:7],1'b1,IFexcept[5:0]};
					aluctr		=	5'b00000;
					jback		=	0;
					end
			endcase
		end
		6'b001000:					//addi
			begin
			regdes		=	0;
			jump		=	0;
			branch		=	0;
			memread		=	0;
			memwrite	=	0;
			alusrc1		=	1;
			alusrc2		=	0;
			signextend	=	1;
			regwrite	=	1;
			branch_ctr	=	3'b000;
			jr			=	0;
			hiread		=	0;
			hiwrite		=	0;
			loread		=	0;
			lowrite		=	0;
			cp0read		=	0;
			cp0write	=	0;
			full		=	0;
			half		=	0;
			bt			=	0;
			signload	=	0;
			T_rs		=	2'b01;
			T_rt		=	2'b11;
			T_new		=	2'b10;
			except		=	IFexcept;
			aluctr		=	5'b00000;
			jback		=	0;
			end
		
		6'b001001:					//addiu
			begin
			regdes		=	0;
			jump		=	0;
			branch		=	0;
			memread		=	0;
			memwrite	=	0;
			alusrc1		=	1;
			alusrc2		=	0;
			signextend	=	1;
			regwrite	=	1;
			branch_ctr	=	3'b000;
			jr			=	0;
			hiread		=	0;
			hiwrite		=	0;
			loread		=	0;
			lowrite		=	0;
			cp0read		=	0;
			cp0write	=	0;
			full		=	0;
			half		=	0;
			bt			=	0;
			signload	=	0;
			T_rs		=	2'b01;
			T_rt		=	2'b11;
			T_new		=	2'b10;
			except		=	IFexcept;
			aluctr		=	5'b00001;
			jback		=	0;
			end
			
		6'b001010:					//slti
			begin
			regdes		=	0;
			jump		=	0;
			branch		=	0;
			memread		=	0;
			memwrite	=	0;
			alusrc1		=	1;
			alusrc2		=	0;
			signextend	=	1;
			regwrite	=	1;
			branch_ctr	=	3'b000;
			jr			=	0;
			hiread		=	0;
			hiwrite		=	0;
			loread		=	0;
			lowrite		=	0;
			cp0read		=	0;
			cp0write	=	0;
			full		=	0;
			half		=	0;
			bt			=	0;
			signload	=	0;
			T_rs		=	2'b01;
			T_rt		=	2'b11;
			T_new		=	2'b10;
			except		=	IFexcept;
			aluctr		=	5'b00100;
			jback		=	0;
			end	
			
		6'b001011:					//sltiu
			begin
			regdes		=	0;
			jump		=	0;
			branch		=	0;
			memread		=	0;
			memwrite	=	0;
			alusrc1		=	1;
			alusrc2		=	0;
			signextend	=	1;
			regwrite	=	1;
			branch_ctr	=	3'b000;
			jr			=	0;
			hiread		=	0;
			hiwrite		=	0;
			loread		=	0;
			lowrite		=	0;
			cp0read		=	0;
			cp0write	=	0;
			full		=	0;
			half		=	0;
			bt			=	0;
			signload	=	0;
			T_rs		=	2'b01;
			T_rt		=	2'b11;
			T_new		=	2'b10;
			except		=	IFexcept;
			aluctr		=	5'b00101;
			jback		=	0;
			end	
			
		6'b001100:					//andi
			begin
			regdes		=	0;
			jump		=	0;
			branch		=	0;
			memread		=	0;
			memwrite	=	0;
			alusrc1		=	1;
			alusrc2		=	0;
			signextend	=	0;
			regwrite	=	1;
			branch_ctr	=	3'b000;
			jr			=	0;
			hiread		=	0;
			hiwrite		=	0;
			loread		=	0;
			lowrite		=	0;
			cp0read		=	0;
			cp0write	=	0;
			full		=	0;
			half		=	0;
			bt			=	0;
			signload	=	0;
			T_rs		=	2'b01;
			T_rt		=	2'b11;
			T_new		=	2'b10;
			except		=	IFexcept;
			aluctr		=	5'b01010;
			jback		=	0;
			end	
		
		6'b001111:					//lui
			begin
			regdes		=	0;
			jump		=	0;
			branch		=	0;
			memread		=	0;
			memwrite	=	0;
			alusrc1		=	1;
			alusrc2		=	0;
			signextend	=	0;                             
			regwrite	=	1;
			branch_ctr	=	3'b000;
			jr			=	0;
			hiread		=	0;
			hiwrite		=	0;
			loread		=	0;
			lowrite		=	0;
			cp0read		=	0;
			cp0write	=	0;
			full		=	0;
			half		=	0;
			bt			=	0;
			signload	=	0;
			T_rs		=	2'b11;
			T_rt		=	2'b11;
			T_new		=	2'b10;
			except		=	IFexcept;
			aluctr		=	5'b01011;
			jback		=	0;
			end	
			
		6'b001101:					//ori
			begin
			regdes		=	0;
			jump		=	0;
			branch		=	0;
			memread		=	0;
			memwrite	=	0;
			alusrc1		=	1;
			alusrc2		=	0;
			signextend	=	0;
			regwrite	=	1;
			branch_ctr	=	3'b000;
			jr			=	0;
			hiread		=	0;
			hiwrite		=	0;
			loread		=	0;
			lowrite		=	0;
			cp0read		=	0;
			cp0write	=	0;
			full		=	0;
			half		=	0;
			bt			=	0;
			signload	=	0;
			T_rs		=	2'b01;
			T_rt		=	2'b11;
			T_new		=	2'b10;
			except		=	IFexcept;
			aluctr		=	5'b01101;
			jback		=	0;
			end	
			
		6'b001110:					//xori
			begin
			regdes		=	0;
			jump		=	0;
			branch		=	0;
			memread		=	0;
			memwrite	=	0;
			alusrc1		=	1;
			alusrc2		=	0;
			signextend	=	0;
			regwrite	=	1;
			branch_ctr	=	3'b000;
			jr			=	0;
			hiread		=	0;
			hiwrite		=	0;
			loread		=	0;
			lowrite		=	0;
			cp0read		=	0;
			cp0write	=	0;
			full		=	0;
			half		=	0;
			bt			=	0;
			signload	=	0;
			T_rs		=	2'b01;
			T_rt		=	2'b11;
			T_new		=	2'b10;
			except		=	IFexcept;
			aluctr		=	5'b01110;
			jback		=	0;
			end	
		
		6'b000100:					//beq
			begin
			regdes		=	0;
			jump		=	0;
			branch		=	1;
			memread		=	0;
			memwrite	=	0;
			alusrc1		=	1;
			alusrc2		=	0;
			signextend	=	0;
			regwrite	=	0;
			branch_ctr	=	3'b000;
			jr			=	0;
			hiread		=	0;
			hiwrite		=	0;
			loread		=	0;
			lowrite		=	0;
			cp0read		=	0;
			cp0write	=	0;
			full		=	0;
			half		=	0;
			bt			=	0;
			signload	=	0;
			T_rs		=	2'b00;
			T_rt		=	2'b00;
			T_new		=	2'b01;
			except		=	IFexcept;
			aluctr		=	5'b00000;
			jback		=	0;
			end
	
		//
		6'b000101:begin//bne
				regdes = 0;
				jump = 0;
				branch = 1;
				memread = 0;
				memwrite = 0;
				alusrc1 = 1;
				alusrc2 = 0;
				signextend = 0;
				regwrite = 0;
				branch_ctr = 3'b001;
				hiread = 0;
				hiwrite = 0;
				loread = 0;
				lowrite = 0;
				cp0read = 0;
				cp0write = 0;
				full = 0;
				half = 0;
				bt = 0;
				jr = 0;
				signload = 0;
				T_rs = 2'b00;
				T_rt = 2'b00;
				T_new = 2'b01;
				except = IFexcept;
				aluctr = 5'b00000;
				jback		=	0;
			end
			6'b000001:begin
				case(branch_flag)
					5'b00001:begin//bgez
						regdes = 0;
						jump = 0;
						branch = 1;
						memread = 0;
						memwrite = 0;
						alusrc1 = 1;
						alusrc2 = 0;
						signextend = 0;
						regwrite = 0;
						branch_ctr = 3'b010;
						hiread = 0;
						hiwrite = 0;
						loread = 0;
						lowrite = 0;
						cp0read = 0;
						cp0write = 0;
						full = 0;
						half = 0;
						bt = 0;
						jr = 0;
						signload = 0;
						T_rs = 2'b00;
						T_rt = 2'b11;
						T_new = 2'b01;
						except = IFexcept;
						aluctr = 5'b00000;
						jback		=	0;
					end
					5'b00000:begin//bltz
						regdes = 0;
						jump = 0;
						branch = 1;
						memread = 0;
						memwrite = 0;
						alusrc1 = 1;
						alusrc2 = 0;
						signextend = 0;
						regwrite = 0;
						branch_ctr = 3'b101;
						hiread = 0;
						hiwrite = 0;
						loread = 0;
						lowrite = 0;
						cp0read = 0;
						cp0write = 0;
						full = 0;
						half = 0;
						bt = 0;
						jr = 0;
						signload = 0;
						T_rs = 2'b00;
						T_rt = 2'b11;
						T_new = 2'b01;
						except = IFexcept;
						aluctr = 5'b00000;
						jback		=	0;
					end
					5'b10001:begin//bgezal
						regdes = 1;
						jump = 0;
						branch = 1;
						memread = 0;
						memwrite = 0;
						alusrc1 = 1;
						alusrc2 = 0;
						signextend = 0;
						regwrite = 1;
						branch_ctr = 3'b110;
						hiread = 0;
						hiwrite = 0;
						loread = 0;
						lowrite = 0;
						cp0read = 0;
						cp0write = 0;
						full = 0;
						half = 0;
						bt = 0;
						jr = 0;
						signload = 0;
						T_rs = 2'b00;
						T_rt = 2'b11;
						T_new = 2'b01;
						except = IFexcept;
						aluctr = 5'b00000;
						jback		=	1;
					end
					5'b10000:begin//bltzal
						regdes = 1;
						jump = 0;
						branch = 1;
						memread = 0;
						memwrite = 0;
						alusrc1 = 1;
						alusrc2 = 0;
						signextend = 0;
						regwrite = 1;
						branch_ctr = 3'b111;
						hiread = 0;
						hiwrite = 0;
						loread = 0;
						lowrite = 0;
						cp0read = 0;
						cp0write = 0;
						full = 0;
						half = 0;
						bt = 0;
						jr = 0;
						signload = 0;
						T_rs = 2'b00;
						T_rt = 2'b11;
						T_new = 2'b01;
						except = IFexcept;
						aluctr = 5'b00000;
						jback		=	1;
					end
					default	:
						begin
							regdes		=	0;
							jump		=	0;
							branch		=	0;
							memread		=	0;
							memwrite	=	0;
							alusrc1		=	0;
							alusrc2		=	0;
							signextend	=	0;
							regwrite	=	0;
							branch_ctr	=	3'b000;
							jr			=	0;
							hiread		=	0;
							hiwrite		=	0;
							loread		=	0;
							lowrite		=	0;
							cp0read		=	0;
							cp0write	=	0;
							full		=	0;
							half		=	0;
							bt			=	0;
							signload	=	0;
							T_rs		=	2'b11;
							T_rt		=	2'b11;
							T_new		=	2'b00;
							except		=	{IFexcept[8:7],1'b1,IFexcept[5:0]};
							aluctr		=	5'b00000;
							jback		=	0;
						end
					endcase
			end
			6'b000111:begin//bgtz
				regdes = 0;
				jump = 0;
				branch = 1;
				memread = 0;
				memwrite = 0;
				alusrc1 = 1;
				alusrc2 = 0;
				signextend = 0;
				regwrite = 0;
				branch_ctr = 3'b011;
				hiread = 0;
				hiwrite = 0;
				loread = 0;
				lowrite = 0;
				cp0read = 0;
				cp0write = 0;
				full = 0;
				half = 0;
				bt = 0;
				jr = 0;
				signload = 0;
				T_rs = 2'b00;
				T_rt = 2'b11;
				T_new = 2'b01;
				except = IFexcept;
				aluctr = 5'b00000;
				jback		=	0;
			end
			6'b000110:begin//blez
				regdes = 0;
				jump = 0;
				branch = 1;
				memread = 0;
				memwrite = 0;
				alusrc1 = 1;
				alusrc2 = 0;
				signextend = 0;
				regwrite = 0;
				branch_ctr = 3'b100;
				hiread = 0;
				hiwrite = 0;
				loread = 0;
				lowrite = 0;
				cp0read = 0;
				cp0write = 0;
				full = 0;
				half = 0;
				bt = 0;
				jr = 0;
				signload = 0;
				T_rs = 2'b00;
				T_rt = 2'b11;
				T_new = 2'b01;
				except = IFexcept;
				aluctr = 5'b00000;
				jback		=	0;
			end
			6'b000010:begin//j
				regdes = 0;
				jump = 1;
				branch = 0;
				memread = 0;
				memwrite = 0;
				alusrc1 = 1;
				alusrc2 = 0;
				signextend = 0;
				regwrite = 0;
				branch_ctr = 3'b000;
				hiread = 0;
				hiwrite = 0;
				loread = 0;
				lowrite = 0;
				cp0read = 0;
				cp0write = 0;
				full = 0;
				half = 0;
				bt = 0;
				jr = 0;
				signload = 0;
				T_rs = 2'b11;
				T_rt = 2'b11;
				T_new = 2'b01;
				except = IFexcept;
				aluctr = 5'b00000;
				jback		=	0;
			end
			6'b000011:begin//jal
				regdes = 1;
				jump = 1;
				branch = 0;
				memread = 0;
				memwrite = 0;
				alusrc1 = 1;
				alusrc2 = 0;
				signextend = 0;
				regwrite = 1;
				branch_ctr = 3'b000;
				hiread = 0;
				hiwrite = 0;
				loread = 0;
				lowrite = 0;
				cp0read = 0;
				cp0write = 0;
				full = 0;
				half = 0;
				bt = 0;
				jr = 0;
				signload = 0;
				T_rs = 2'b11;
				T_rt = 2'b11;
				T_new = 2'b01;
				except = IFexcept;
				aluctr = 5'b00000;
				jback		=	1;
			end
			6'b100000:begin//lb
				regdes = 0;
				jump = 0;
				branch = 0;
				memread = 1;
				memwrite = 0;
				alusrc1 = 1;
				alusrc2 = 0;
				signextend = 1;
				regwrite = 1;
				branch_ctr = 3'b000;
				hiread = 0;
				hiwrite = 0;
				loread = 0;
				lowrite = 0;
				cp0read = 0;
				cp0write = 0;
				full = 0;
				half = 0;
				bt = 1;
				jr = 0;
				signload = 1;
				T_rs = 2'b01;
				T_rt = 2'b11;
				T_new = 2'b11;
				except = IFexcept;
				aluctr = 5'b00001;
				jback		=	0;
			end
			6'b100100:begin//lbu
				regdes = 0;
				jump = 0;
				branch = 0;
				memread = 1;
				memwrite = 0;
				alusrc1 = 1;
				alusrc2 = 0;
				signextend = 1;
				regwrite = 1;
				branch_ctr = 3'b000;
				hiread = 0;
				hiwrite = 0;
				loread = 0;
				lowrite = 0;
				cp0read = 0;
				cp0write = 0;
				full = 0;
				half = 0;
				bt = 1;
				jr = 0;
				signload = 0;
				T_rs = 2'b01;
				T_rt = 2'b11;
				T_new = 2'b11;
				except = IFexcept;
				aluctr = 5'b00001;
				jback		=	0;
			end
			6'b100001:begin//lh
				regdes = 0;
				jump = 0;
				branch = 0;
				memread = 1;
				memwrite = 0;
				alusrc1 = 1;
				alusrc2 = 0;
				signextend = 1;
				regwrite = 1;
				branch_ctr = 3'b000;
				hiread = 0;
				hiwrite = 0;
				loread = 0;
				lowrite = 0;
				cp0read = 0;
				cp0write = 0;
				full = 0;
				half = 1;
				bt = 0;
				jr = 0;
				signload = 1;
				T_rs = 2'b01;
				T_rt = 2'b11;
				T_new = 2'b11;
				except = IFexcept;
				aluctr = 5'b00001;
				jback		=	0;
			end
			6'b100101:begin//lhu
				regdes = 0;
				jump = 0;
				branch = 0;
				memread = 1;
				memwrite = 0;
				alusrc1 = 1;
				alusrc2 = 0;
				signextend = 1;
				regwrite = 1;
				branch_ctr = 3'b000;
				hiread = 0;
				hiwrite = 0;
				loread = 0;
				lowrite = 0;
				cp0read = 0;
				cp0write = 0;
				full = 0;
				half = 1;
				bt = 0;
				jr = 0;
				signload = 0;
				T_rs = 2'b01;
				T_rt = 2'b11;
				T_new = 2'b11;
				except = IFexcept;
				aluctr = 5'b00001;
				jback		=	0;
			end
			6'b100011:begin//lw
				regdes = 0;
				jump = 0;
				branch = 0;
				memread = 1;
				memwrite = 0;
				alusrc1 = 1;
				alusrc2 = 0;
				signextend = 1;
				regwrite = 1;
				branch_ctr = 3'b000;
				hiread = 0;
				hiwrite = 0;
				loread = 0;
				lowrite = 0;
				cp0read = 0;
				cp0write = 0;
				full = 1;
				half = 0;
				bt = 0;
				jr = 0;
				signload = 0;
				T_rs = 2'b01;
				T_rt = 2'b11;
				T_new = 2'b11;
				except = IFexcept;
				aluctr = 5'b00001;
				jback		=	0;
			end
			6'b101000:begin//sb
				regdes = 0;
				jump = 0;
				branch = 0;
				memread = 0;
				memwrite = 1;
				alusrc1 = 1;
				alusrc2 = 0;
				signextend = 1;
				regwrite = 0;
				branch_ctr = 3'b000;
				hiread = 0;
				hiwrite = 0;
				loread = 0;
				lowrite = 0;
				cp0read = 0;
				cp0write = 0;
				full = 0;
				half = 0;
				bt = 1;
				jr = 0;
				signload = 0;
				T_rs = 2'b01;
				T_rt = 2'b10;
				T_new = 2'b01;
				except = IFexcept;
				aluctr = 5'b00001;
				jback		=	0;
			end
			6'b101001:begin//sh
				regdes = 0;
				jump = 0;
				branch = 0;
				memread = 0;
				memwrite = 1;
				alusrc1 = 1;
				alusrc2 = 0;
				signextend = 1;
				regwrite = 0;
				branch_ctr = 3'b000;
				hiread = 0;
				hiwrite = 0;
				loread = 0;
				lowrite = 0;
				cp0read = 0;
				cp0write = 0;
				full = 0;
				half = 1;
				bt = 0;
				jr = 0;
				signload = 0;
				T_rs = 2'b01;
				T_rt = 2'b10;
				T_new = 2'b01;
				except = IFexcept;
				aluctr = 5'b00001;
				jback		=	0;
			end
			6'b101011:begin//sw
				regdes = 0;
				jump = 0;
				branch = 0;
				memread = 0;
				memwrite = 1;
				alusrc1 = 1;
				alusrc2 = 0;
				signextend = 1;
				regwrite = 0;
				branch_ctr = 3'b000;
				hiread = 0;
				hiwrite = 0;
				loread = 0;
				lowrite = 0;
				cp0read = 0;
				cp0write = 0;
				full = 1;
				half = 0;
				bt = 0;
				jr = 0;
				signload = 0;
				T_rs = 2'b01;
				T_rt = 2'b10;
				T_new = 2'b01;
				except = IFexcept;
				aluctr = 5'b00001;
				jback		=	0;
			end
			6'b010000:begin
				case(instruct[25:21])
					5'b10000:begin//eret
						regdes = 0;
						jump = 0;
						branch = 0;
						memread = 0;
						memwrite = 0;
						alusrc1 = 1;
						alusrc2 = 0;
						signextend = 0;
						regwrite = 0;
						branch_ctr = 3'b000;
						hiread = 0;
						hiwrite = 0;
						loread = 0;
						lowrite = 0;
						cp0read = 0;
						cp0write = 0;
						full = 0;
						half = 0;
						bt = 0;
						jr = 0;
						signload = 0;
						T_rs = 2'b11;
						T_rt = 2'b11;
						T_new = 2'b00;
						except = {IFexcept[8:1],1'b1};
						aluctr = 5'b00000;
						jback		=	0;
					end
					5'b00000:begin//mfc0
						regdes = 0;
						jump = 0;
						branch = 0;
						memread = 0;
						memwrite = 0;
						alusrc1 = 1;
						alusrc2 = 0;
						signextend = 0;
						regwrite = 1;
						branch_ctr = 3'b000;
						hiread = 0;
						hiwrite = 0;
						loread = 0;
						lowrite = 0;
						cp0read = 1;
						cp0write = 0;
						full = 0;
						half = 0;
						bt = 0;
						jr = 0;
						signload = 0;
						T_rs = 2'b11;
						T_rt = 2'b11;
						T_new = 2'b11;
						except = IFexcept;
						aluctr = 5'b00000;
						jback		=	0;
					end
					5'b00100:begin//mtc0
						regdes = 0;
						jump = 0;
						branch = 0;
						memread = 0;
						memwrite = 0;
						alusrc1 = 1;
						alusrc2 = 0;
						signextend = 0;
						regwrite = 0;
						branch_ctr = 3'b000;
						hiread = 0;
						hiwrite = 0;
						loread = 0;
						lowrite = 0;
						cp0read = 0;
						cp0write = 1;
						full = 0;
						half = 0;
						bt = 0;
						jr = 0;
						signload = 0;
						T_rs = 2'b11;
						T_rt = 2'b10;
						T_new = 2'b01;
						except = IFexcept;
						aluctr = 5'b00000;
						jback		=	0;
					end
					default	:
						begin
							regdes		=	0;
							jump		=	0;
							branch		=	0;
							memread		=	0;
							memwrite	=	0;
							alusrc1		=	0;
							alusrc2		=	0;
							signextend	=	0;
							regwrite	=	0;
							branch_ctr	=	3'b000;
							jr			=	0;
							hiread		=	0;
							hiwrite		=	0;
							loread		=	0;
							lowrite		=	0;
							cp0read		=	0;
							cp0write	=	0;
							full		=	0;
							half		=	0;
							bt			=	0;
							signload	=	0;
							T_rs		=	2'b11;
							T_rt		=	2'b11;
							T_new		=	2'b00;
							except		=	{IFexcept[8:7],1'b1,IFexcept[5:0]};
							aluctr		=	5'b00000;
							jback		=	0;
						end
					endcase
			end
			
		default	:
			begin
				regdes		=	0;
				jump		=	0;
				branch		=	0;
				memread		=	0;
				memwrite	=	0;
				alusrc1		=	0;
				alusrc2		=	0;
				signextend	=	0;
				regwrite	=	0;
				branch_ctr	=	3'b000;
				jr			=	0;
				hiread		=	0;
				hiwrite		=	0;
				loread		=	0;
				lowrite		=	0;
				cp0read		=	0;
				cp0write	=	0;
				full		=	0;
				half		=	0;
				bt			=	0;
				signload	=	0;
				T_rs		=	2'b11;
				T_rt		=	2'b11;
				T_new		=	2'b00;
				except		=	{IFexcept[8:7],1'b1,IFexcept[5:0]};
				aluctr		=	5'b00000;
				jback		=	0;
			end
			endcase
	end
		



endmodule