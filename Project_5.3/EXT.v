`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:40:47 12/07/2016 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
	input Type,
	input [15:0] Datain,
	output [31:0] Dataout
    );
	
	assign Dataout = Type == 1 ? {{16{Datain[15]}},Datain} : {16'h0,Datain};


endmodule
