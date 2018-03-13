`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:55 12/06/2016 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID(
	input clk,
	input reset,
	input StallD,
	input [31:0]IRF,
	input [31:0]PC4F,
	output [31:0]IRD,
	output [31:0]PC4D
    );
	
	reg [31:0]IR_D;
	reg [31:0]PC4_D;
	
	initial begin
		IR_D = 32'h0;
		PC4_D = 32'h3000;
	end
	
	always@(posedge clk) begin
		if(reset) begin
			IR_D <= 32'h0;
			PC4_D <= 32'h3000;
		end
		else if(StallD) begin
			IR_D <= IR_D;
			PC4_D <= PC4_D;
		end
		else begin
			IR_D <= IRF;
			PC4_D <= PC4F;
		end
	end
	
	assign IRD = IR_D;
	assign PC4D = PC4_D;
	
endmodule
