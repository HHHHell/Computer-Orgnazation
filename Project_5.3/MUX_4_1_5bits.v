`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:09:25 12/07/2016 
// Design Name: 
// Module Name:    MUX_4_1_5bits 
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
module MUX_4_1_5bits(
    input [4:0] A,
    input [4:0] B,
    input [4:0] C,
    input [4:0] D,
    input [1:0] Sel,
    input [4:0] Out
    );
	assign Out = Sel == 0 ? A : 
				 Sel == 1 ? B :
				 Sel == 2 ? C : D;

endmodule
