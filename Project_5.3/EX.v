`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:36:09 12/07/2016 
// Design Name: 
// Module Name:    EX 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define imm 15:0
`define op 31:26
`define func 5:0

module EX(
    input [31:0] RSE,
    input [31:0] RTE,
    input [31:0] IRE,
    input [31:0] EXTE,
    output [31:0] ALUout
    );
	
	parameter	op_r = 6'b000000,
				op_addi = 6'b001000,
				op_addiu = 6'b001001,
				op_ori = 6'b001101,
				op_lui = 6'b001111,

				op_lw = 6'b100011,
				op_sw = 6'b101011,

				op_beq = 6'b000100,
				op_bne = 6'b000101,
				op_j = 6'b000010,
				op_jal = 6'b000011,

				func_add = 6'b100000,
				func_addu = 6'b100001,
				func_sub = 6'b100010,
				func_subu = 6'b100011,
				func_and = 6'b100100,
				func_or = 6'b100101,
				func_xor = 6'b100110,
				func_sll = 6'b000000,
				func_srl = 6'b000010,
				func_jr   = 6'b001000;
				
	
	wire [31:0] A;
	wire [31:0] B;
	wire [31:0] Out;
	wire [3:0] ALUop;
	
	MUX_2_1_32bits MUX_A(RSE,IRE,ALUSrcA,A);
	MUX_2_1_32bits MUX_B(RTE,EXTE,ALUSrcB,B);
	
	ALU ALU1(A,B,ALUop,Out);
	
	assign ALUop = (IRE[`op] == op_r && (IRE[`func] == func_add || IRE[`func] == func_addu)) ||
				   IRE[`op] == op_addiu || IRE[`op] == op_addi || IRE[`op] == op_lw || IRE[`op] == op_sw ? 0 :
				   IRE[`op] == op_r && (IRE[`func] == func_sub || IRE[`func] == func_subu) ? 1 :
				   IRE[`op] == op_r && IRE[`func] == func_and ? 2 :
				   (IRE[`op] == op_r && IRE[`func] == func_or) || (IRE[`op] == op_ori) ? 3 :
				   IRE[`op] == op_lui ? 4 :
				   IRE[`op] == op_r && IRE[`func] == func_sll ? 5 :
				   IRE[`op] == op_r && IRE[`func] == func_srl ? 6 :
				   IRE[`op] == op_r && IRE[`func] == func_xor ? 7 :
				   15;
				   
	assign ALUSrcA = IRE[`op] == op_r && (IRE[`func] == func_srl || IRE[`func] == func_sll) ? 1 : 0;
	assign ALUSrcB = IRE[`op] == op_r && IRE[`func] != func_jr && IRE != 0 ? 0 : 1;
	assign ALUout = Out;
	
endmodule
