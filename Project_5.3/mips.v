`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:38:19 12/07/2016 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );
	
	wire PCSrc;
	wire [31:0]NPC;
	wire [1:0]BranchD;
	wire RegWriteD;
	wire MemWriteM;

	wire [31:0]PC4F;
	wire [31:0]PC4D;
	wire [31:0]PC4E;
	wire [31:0]PC4M;
	wire [31:0]PC4W;
	
	wire StallF;
	wire StallD;
	
	wire [31:0]IRF;
	wire [31:0]IRD;
	wire [31:0]IRE;
	wire [31:0]IRM;
	wire [31:0]IRW;
	
	wire [31:0]ExtD;
	wire [31:0]ExtE;

	wire [31:0]ALUoutD;
	wire [31:0]ALUoutE;
	wire [31:0]ALUoutM;
	wire [31:0]ALUoutW;

	wire [31:0]RSD;
	wire [31:0]RTD;
	wire [31:0]RSE;
	wire [31:0]RTE;
	wire [31:0]RTM;

	wire [31:0]DMD;
	wire [31:0]DMoutM;
	wire [31:0]DMoutW;

	wire [31:0]Rf_d1;
	wire [31:0]Rf_d2;
	
	wire [31:0]MUX;
		
	wire [31:0]MFRSD;
	wire [31:0]MFRTD;
	wire [31:0]MFRSE;
	wire [31:0]MFRTE;
	wire [31:0]MFRTM;

	wire [1:0]FRSD;
	wire [1:0]FRTD;
	wire [1:0]FRSE;
	wire [1:0]FRTE;
	wire [1:0]FRTM;

	IF IF_P5(
	.clk(clk),
	.reset(reset),
	.PCSrc(PCSrc),
	.Npc(NPC),
	.Stall(Stall),
	.IR(IRF),
	.PC4(PC4F)
    );

	
	IF_ID IFID_P5(
	.clk(clk),
	.reset(reset),
	.StallD(Stall),
	.IRF(IRF),
	.PC4F(PC4F),
	.IRD(IRD),
	.PC4D(PC4D)
    );

	ID ID_P5(
	.clk(clk),
	.reset(reset),
	.IRD(IRD),
	.IRW(IRW),
	.PC4D(PC4D),
	.PC4W(PC4W),
	.ALUout(ALUoutW),
	.DM(DMoutW),
	.MFRSD(MFRSD),
	.MFRTD(MFRTD),
	.Bch(BranchD),
	.RegWrite(RegWriteD),
	.PCSrcD(PCSrc),
	.NPC(NPC),
	.Rf_d1(Rf_d1), 		//
	.Rf_d2(Rf_d2), 		//
	.Ext(ExtD),
	.Mux_data(MUX)
    );
	
	ID_EX IDEX_P5(
	.clk(clk),
	.reset(reset),
	.StallE(Stall),
    .IRD(IRD),
    .PC4D(PC4D),
    .RSD(Rf_d1),
    .RTD(Rf_d2),
    .EXTD(ExtD),
    .IRE(IRE),
    .PC4E(PC4E),
    .RSE(RSE),
    .RTE(RTE),
    .EXTE(ExtE)
	);

	EX EX_P5(
    .RSE(MFRSE),	//
    .RTE(MFRTE),	//
    .IRE(IRE),
    .EXTE(ExtE),
    .ALUout(ALUoutE)
    );
	
	EX_MEM EXMEM_P5(
	.clk(clk),
	.reset(reset),
    .IRE(IRE),
    .PC4E(PC4E),
    .ALUout(ALUoutE),
    .RTE(MFRTE),	//
    .IRM(IRM),
    .PC4M(PC4M),
    .ALUoutM(ALUoutM),
    .RTM(RTM)
    );
	
	MEM MEM_P5(
    .clk(clk),
    .reset(reset),
	.IRM(IRM),
    .ALUout(ALUoutM),
    .RT(MFRTM),
    .DMout(DMoutM)
	);
	
	MEM_WB MEMWB_P5(
	.clk(clk),
	.reset(reset),
    .IRM(IRM),
    .PC4M(PC4M),
    .ALUoutM(ALUoutM),
    .DMoutM(DMoutM),
    .IRW(IRW),
    .PC4W(PC4W),
    .ALUoutW(ALUoutW),
    .DMoutW(DMoutW)
    );
	
	HCTRL HCTRL_P5(
	.IR_D(IRD),
	.IR_E(IRE),
	.IR_M(IRM),
	.IR_W(IRW),
	.FRSD(FRSD),
	.FRTD(FRTD),
	.FRSE(FRSE),
	.FRTE(FRTE),
	.FRTM(FRTM),
	.Stall(Stall)
	);
	
	MUX_4_1_32bits MFRSD_P5(Rf_d1,PC4E+4,ALUoutM,PC4M+4,FRSD,MFRSD);
	MUX_4_1_32bits MFRTD_P5(Rf_d2,PC4E+4,ALUoutM,PC4M+4,FRTD,MFRTD);
	MUX_4_1_32bits MFRSE_P5(RSE,ALUoutM,PC4M+4,MUX,FRSE,MFRSE);
	MUX_4_1_32bits MFRTE_P5(RTE,ALUoutM,PC4M+4,MUX,FRTE,MFRTE);
	MUX_4_1_32bits MFRTM_P5(RTM,MUX,32'h0,32'h0,FRTM,MFRTM);
	
endmodule
