`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:13:15 11/20/2016 
// Design Name: 
// Module Name:    Ext 
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
module Ext(
	input [15:0]Datain,
	input Type,
	output[31:0]Dataout
    );
	
	assign Dataout = Type == 0 ? {16'b0,Datain} : {{16{Datain[15]}},Datain};

endmodule
