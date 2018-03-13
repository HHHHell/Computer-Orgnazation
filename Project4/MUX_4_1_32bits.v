`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:32:42 11/21/2016 
// Design Name: 
// Module Name:    MUX_4_1_32bits 
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
    input [31:0] A,
    input [31:0] B,
	input [31:0] C,
	input [31:0] D,
    input [1:0]Sel,
	output [31:0]Out
    );
	
	assign Out = Sel == 0 ? A :
				 Sel == 1 ? B :
				 Sel == 2 ? C : D;

/*	reg [31:0]out;
	initial out = 0;
	always @(A or B or C or D) begin 
		if(Sel == 0)
			out = A;
		else if(Sel == 1)
			out = B;
		else if(Sel == 2)
			out = C;
		else
			out = D;
	end
	assign Out = out;
*/
endmodule
