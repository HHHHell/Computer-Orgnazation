`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:42:59 11/21/2016 
// Design Name: 
// Module Name:    MUX_2_1_32bits 
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
module MUX_2_1_32bits(
	input [31:0] A,
	input [31:0] B,
	input Sel,
	output [31:0] Out
    );
	
	assign Out = (Sel == 0) ? A : B;
/*	always@(*)begin 
		$display("A = %h, B = %h, Sel = %d, Out = %h",A,B,Sel,Out);
	end
*/

endmodule
