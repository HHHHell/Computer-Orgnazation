`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:03:15 12/07/2016 
// Design Name: 
// Module Name:    MUX 
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
module MUX_4_1_32bits(
	input [31:0]A,
	input [31:0]B,
	input [31:0]C,
	input [31:0]D,
	input [1:0]Sel,
	output [31:0] Out
    );
	
	assign Out = Sel == 0 ? A : 
				 Sel == 1 ? B :
				 Sel == 2 ? C : D;

endmodule
