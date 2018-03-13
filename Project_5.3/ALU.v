`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:25:14 12/07/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUop,
    output [31:0] ALUout
    );
	
	assign ALUout = ALUop == 0 ? A + B :
					ALUop == 1 ? A - B :
					ALUop == 2 ? A & B :
					ALUop == 3 ? A | B :
					ALUop == 4 ? {B[15:0],16'h0}:
					ALUop == 5 ? B << A[10:6] :
					ALUop == 6 ? B >> A[10:6] :
					ALUop == 7 ? (A & ~B) | (~A & B) :
					A;
endmodule
