`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:48:39 12/07/2016 
// Design Name: 
// Module Name:    NPC 
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
module NPC(
	input [1:0]Branch,			// Branch = 0: beq, bne; 1: j, jal; 2: jr
	input [31:0]PC4,
	input [31:0]Imm,
    output [31:0]NPC
	);
	
	assign NPC = Branch == 0 ? PC4 + Imm * 4 :
				 Branch == 1 ? {PC4[31:28],Imm[25:0],2'b0} : 
				 Branch == 2 ? Imm : 
				 PC4;


endmodule
