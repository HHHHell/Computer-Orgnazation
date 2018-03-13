`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:25:36 11/21/2016 
// Design Name: 
// Module Name:    CTRL 
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

module CTRL(
	input [5:0]Op,
	input [5:0]Func,
	output [1:0]Branch,
	output [1:0]ALUop,
	output ALUsrc,
	output [1:0]Rd_sel,
	output [1:0]GRF_sel,
	output Reg_write,
	output Mem_write,
	output Type,
	output Bits_ctrl
    );
	
	parameter	Op_R  = 6'b000000,
				Op_lw = 6'b100011,
				Op_sw = 6'b101011,
				Op_ori = 6'b001101,
				Op_lui = 6'b001111,
				Op_beq = 6'b000100,
				Op_bgez = 6'b000001,
				Op_sltiu = 6'b001011,
				Op_jal = 6'b000011,
				Func_addu = 6'b100001,
				Func_subu = 6'b100011,
				Func_jr   = 6'b001000;
				
	assign Branch = Op == Op_R && Func == Func_jr ? 3 : 
					Op == Op_jal ? 2 : 
					Op == Op_beq || Op == Op_bgez ? 1 : 0;
	assign ALUop = (Op == Op_R && Func == Func_addu) || (Op == Op_lw) || (Op == Op_sw) ? 0 :
				   (Op == Op_R && Func == Func_subu) ? 1 :
				   Op == Op_ori ? 2 : 3;
	assign ALUsrc = (Op == Op_ori || Op == Op_sw || Op == Op_lw || Op == Op_sltiu) ? 1 : 0;
	assign Rd_sel = (Op == Op_R && Func != Func_jr) ? 0 :
					(Op == Op_lw) || (Op == Op_ori) || (Op == Op_lui) || (Op == Op_sltiu) ? 1 :
					(Op == Op_jal) ? 2 : 3;
	assign GRF_sel = Op == Op_jal ? 3 :
					 Op == Op_lw ? 2 :
					 Op == Op_lui ? 1 : 0;
	assign Reg_write = (Op == Op_R && Func != Func_jr) || (Op == Op_lw) || (Op == Op_ori) || (Op == Op_lui) || (Op == Op_jal) || (Op == Op_sltiu) ? 1 : 0;
	assign Mem_write = (Op == Op_sw) ? 1 : 0;
	assign Type = Op == Op_ori ? 0 : 1;
	assign Bits_ctrl = Op == Op_lui ? 1 : 0;
	
/*	always@(*)begin
		$display("_Branch = %d, _ALUop = %d, _ALUsrc = %d, _Rd_sel = %d, _GRF_sel = %d, _Reg_write = %d, _Mem_write = %d, _Type = %d, _Bits_ctrl = %d",
		Branch,ALUop,ALUsrc,Rd_sel,GRF_sel,Reg_write,Mem_write,Type,Bits_ctrl);	
	end
*/

//	assign Type = Op == `Op_ori;		//Type == 0£º0À©Õ¹£»Type == 1£º ·ûºÅÀ©Õ¹£» 

endmodule
