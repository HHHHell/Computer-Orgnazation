`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:28 11/20/2016 
// Design Name: 
// Module Name:    Shifter 
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
module Shifter(
	input [31:0]Data_in,
	input Bits_ctrl,
	output [31:0]Data_out
    );
	
	assign Data_out = Bits_ctrl == 0 ? {Data_in[29:0],2'b0} : {Data_in[15:0],16'b0};
	
/*	always@(*)begin 
		$display("Data_in = %h, Data_out = %h, Bits_ctrl = %d",Data_in,Data_out,Bits_ctrl);
	end
*/

endmodule
