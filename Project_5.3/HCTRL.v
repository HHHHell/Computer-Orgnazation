`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:49 12/08/2016 
// Design Name: 
// Module Name:    HCTRL 
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

module HCTRL(
	input [31:0]IR_D,
	input [31:0]IR_E,
	input [31:0]IR_M,
	input [31:0]IR_W,
	output [1:0]FRSD,
	output [1:0]FRTD,
	output [1:0]FRSE,
	output [1:0]FRTE,
	output [1:0]FRTM,
	output Stall
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

	wire Cal_r_D;
	wire Cal_r_E;
	wire Cal_r_M;
	wire Cal_r_W;
	wire Cal_i_D;
	wire Cal_i_E;
	wire Cal_i_M;
	wire Cal_i_W;
	wire Beq_D;
	wire Beq_E;
	wire Jr_D;
	wire Jr_E;
	wire [4:0]RS_E;
	wire [4:0]RT_E;
	wire [4:0]RS_M;
	wire [4:0]RT_M;
	
	assign RS_E = IR_E[`rs];
	assign RT_E = IR_E[`rt];
	assign RS_M = IR_M[`rs];
	assign RT_M = IR_M[`rt];
	
	assign Cal_r_D = (IR_D[`op] == op_r && IR_D[`func] != func_jr && IR_D != 0);
	assign Cal_r_E = (IR_E[`op] == op_r && IR_E[`func] != func_jr && IR_E != 0);
	assign Cal_r_M = (IR_M[`op] == op_r && IR_M[`func] != func_jr && IR_M != 0);
	assign Cal_r_W = (IR_W[`op] == op_r && IR_W[`func] != func_jr && IR_W != 0);
				 
	assign Cal_i_D = (IR_D[`op] == op_addi || IR_D[`op] == op_addiu || IR_D[`op] == op_ori || IR_D[`op] == op_lui); 
	assign Cal_i_E = (IR_E[`op] == op_addi || IR_E[`op] == op_addiu || IR_E[`op] == op_ori || IR_E[`op] == op_lui);  
	assign Cal_i_M = (IR_M[`op] == op_addi || IR_M[`op] == op_addiu || IR_M[`op] == op_ori || IR_M[`op] == op_lui);  
	assign Cal_i_W = (IR_W[`op] == op_addi || IR_W[`op] == op_addiu || IR_W[`op] == op_ori || IR_W[`op] == op_lui);

	assign Beq_D = (IR_D[`op] == op_beq || IR_D[`op] == op_bne);
	assign Beq_E = (IR_E[`op] == op_beq || IR_E[`op] == op_bne);
	
	assign Jr_D = (IR_D[`op] == op_r && IR_D[`func] == func_jr);
		

	assign FRSD = (Beq_D || Jr_D) && (IR_E[`op] == op_jal) && (IR_D[`rs] == 5'd31) ? 2'h1 : 
				  (Beq_D || Jr_D) && (IR_D[`rs] != 0) && ((Cal_r_M && IR_D[`rs] == IR_M[`rd])|| (Cal_i_M && IR_D[`rs] == IR_M[`rt])) ? 2'h2 : 
				  (Beq_D || Jr_D) && (IR_M[`op] == op_jal) && (IR_D[`rs] == 5'd31) ? 2'h3 : 0;
				  
	assign FRTD = Beq_D && (IR_E[`op] == op_jal) && (IR_D[`rt] == 5'd31) ? 2'h1 :
				  (Beq_D || Jr_D) && (IR_D[`rt] != 0) && ((Cal_r_M && IR_D[`rt] == IR_M[`rd])|| (Cal_i_M && IR_D[`rt] == IR_M[`rt])) ? 2'h2 : 
				  (Beq_D || Jr_D) && (IR_M[`op] == op_jal) && (IR_D[`rt] == 5'd31) ? 2'h3 : 0;

	assign FRSE = (Cal_r_E || Cal_i_E || IR_E[`op] == op_lw || IR_E[`op] == op_sw) && (IR_E[`rs] != 0) && 
				  ((Cal_r_M && IR_E[`rs] == IR_M[`rd]) || (Cal_i_M && IR_E[`rs] == IR_M[`rt])) ? 2'h1 : 
				  (Cal_r_E || Cal_i_E || IR_E[`op] == op_lw || IR_E[`op] == op_sw) && 
				  (IR_M[`op] == op_jal) && (IR_E[`rs] == 5'd31) ? 2'h2 :
				  (Cal_r_E || Cal_i_E || IR_E[`op] == op_lw || IR_E[`op] == op_sw) && (IR_E[`rs] != 0) &&
				  ((Cal_r_W && IR_E[`rs] == IR_W[`rd]) ||
				  (IR_W[`op] == op_jal && IR_E[`rs] == 31) || ((IR_W[`op] == op_lw || Cal_i_W) && IR_E[`rs] == IR_W[`rt])) ? 2'h3 : 0;
				  
	assign FRTE = (Cal_r_E || IR_E[`op] == op_sw) && (IR_E[`rt] != 0) && ((Cal_r_M && IR_E[`rt] == IR_M[`rd]) || (Cal_i_M && IR_E[`rt] == IR_M[`rt])) ? 2'h1 : 
				  (Cal_r_E || IR_E[`op] == op_sw) && (IR_M[`op] == op_jal) && (IR_E[`rt] == 5'd31) ? 2'h2 :
				  (Cal_r_E || IR_E[`op] == op_sw) && (IR_E[`rt] != 0) && ((Cal_r_W && IR_E[`rt] == IR_W[`rd]) ||
				  ((IR_W[`op] == op_jal && IR_E[`rt] == 31) || ((IR_W[`op] == op_lw || Cal_i_W) && IR_E[`rt] == IR_W[`rt]))) ? 2'h3 : 0;
				  
	assign FRTM = (IR_M[`op] == op_sw) && (IR_M[`rt] != 0) && 
				  ((IR_W[`op] == op_jal && IR_M[`rt] == 31) || ((IR_W[`op] == op_lw || Cal_i_W) && (IR_M[`rt] == IR_W[`rt])) ||
				  (Cal_r_W && IR_M[`rt] == IR_W[`rd])) ? 1 : 0;
				  
	assign Stall = (Cal_r_E && Beq_D && IR_E[`rd] != 0 && (IR_E[`rd] == IR_D[`rs] || IR_E[`rd] == IR_D[`rt])) || 
				   (Cal_r_E && Jr_D && IR_E[`rd] != 0 && (IR_E[`rd] == IR_D[`rs])) ||
				   (Cal_i_E && Beq_D && IR_E[`rt] != 0 && (IR_E[`rt] == IR_D[`rs] || IR_E[`rt] == IR_D[`rt])) || 
				   (Cal_i_E && Jr_D && IR_E[`rt] != 0 && (IR_E[`rt] == IR_D[`rs])) ||
				   (IR_E[`op] == op_lw && 
				   (((Cal_r_D || Beq_D) && (IR_D[`rt] == IR_E[`rt] && IR_D[`rt] != 0)) ||
				   ((Beq_D || Jr_D || IR_D[`op] == op_lw || IR_D[`op] == op_sw || Cal_i_D || Cal_r_D) && (IR_D[`rs] == IR_E[`rt] && IR_D[`rs] != 0)))) || 
				   (IR_M[`op] == op_lw && Beq_D && IR_M[`rt] != 0 && (IR_M[`rt] == IR_D[`rs] || IR_M[`rt] == IR_D[`rt])) ||
				   (IR_M[`op] == op_lw && Jr_D && IR_M[`rt] != 0 && IR_M[`rt] == IR_D[`rs]);
				   
endmodule
