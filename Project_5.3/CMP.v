`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:44:09 12/07/2016 
// Design Name: 
// Module Name:    CMP 
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
module CMP(
	input [31:0]Data1,
	input [31:0]Data2,
	output Greater,
	output Equal,
	output Less
    );
	
	assign Greater = Data1[31] < Data2[31] || (Data1[31] == Data2[31] && Data1[30:0] > Data2[31:0]); 
	assign Equal = Data1 == Data2;
	assign Greater = Data1[31] > Data2[31] || (Data1[31] == Data2[31] && Data1[30:0] < Data2[31:0]); 


endmodule
