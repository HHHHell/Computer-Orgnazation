`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:59:53 12/07/2016 
// Design Name: 
// Module Name:    ID 
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

module ID(
	input clk,
	input reset,
	input [31:0]IRD,
	input [31:0]IRW,
	input [31:0]PC4D,
	input [31:0]PC4W,
	input [31:0]ALUout,
	input [31:0]DM,
	input [31:0]MFRSD,
	input [31:0]MFRTD,
	output [1:0]Bch,
	output RegWrite,
	output PCSrcD,
	output [31:0]NPC,
	output [31:0]Rf_d1,
	output [31:0]Rf_d2,
	output [31:0]Ext,
	output [31:0]Mux_data
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
					
	wire [31:0] Ext;
	wire [4:0] Addr;
	wire [31:0]Imm;
	wire Greater;
	wire Equal;
	wire Less;
	
	wire Type;
	wire [1:0]Mux_data_sel;
	wire [1:0]Mux_addr_sel;
	wire [1:0]Mux_imm_sel;

	RF GRF(clk,reset,RegWrite,IRD[`rs],IRD[`rt],Addr,Mux_data,Rf_d1,Rf_d2);
	NPC NPC1(Bch,PC4D,Imm,NPC);
	EXT EXT1(Type,IRD[`imm],Ext);
	CMP CMP1(MFRSD,MFRTD,Greater,Equal,Less);
	
	MUX_4_1_32bits MUX_Data(ALUout,DM,PC4W + 4,32'h0,Mux_data_sel,Mux_data);
	MUX_4_1_5bits MUX_Addr(IRW[`rd],IRW[`rt],5'h1f,5'h0,Mux_addr_sel,Addr);
	MUX_4_1_32bits MUX_Imm(Ext,IRD,MFRSD,32'h0,Mux_imm_sel,Imm);
	
	
	assign Bch = IRD[`op] == op_beq || IRD[`op] == op_bne ? 0 :			// Branch = 0: beq, bne; 1: j, jal; 2: jr
				 IRD[`op] == op_j || IRD[`op] == op_jal ? 1 :
				 IRD[`op] == op_r && IRD[`func] == func_jr ? 2 : 
				 3;
				 
	assign Type = IRD[`op] == op_ori ? 0 : 1;							// 1: sign-ext; 0: zero-ext
	
	assign RegWrite = (IRW[`op] == op_r && IRW[`func] != func_jr && IRW != 0) || (IRW[`op] == op_addi) || (IRW[`op] == op_addiu) ||
					  (IRW[`op] == op_ori) || (IRW[`op] == op_lui) || (IRW[`op] == op_lw) || (IRW[`op] == op_jal);
					  
	assign Mux_data_sel = IRW[`op] == op_lw ? 1 :
						  IRW[`op] == op_jal ? 2 :
						  0;
	assign Mux_addr_sel = IRW[`op] == op_lui || IRW[`op] == op_addi || IRW[`op] == op_addiu || IRW[`op] == op_ori || IRW[`op] == op_lw ? 1 :
						  IRW[`op] == op_jal ? 2 :
						  0;
	assign Mux_imm_sel = IRD[`op] == op_beq || IRD[`op] == op_bne ? 0 :
						 IRD[`op] == op_jal || IRD[`op] == op_j ? 1 :
						 (IRD[`op] == op_r && IRD[`func] == func_jr) ? 2 :
						 3;
	
	assign PCSrcD = (IRD[`op] == op_beq && Equal) || (IRD[`op] == op_bne && !Equal) ||
					(IRD[`op] == op_jal) || (IRD[`op] == op_j) || (IRD[`op] == op_r && IRD[`func] == func_jr);
					
endmodule
