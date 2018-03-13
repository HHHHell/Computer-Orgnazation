`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:51:58 12/06/2016 
// Design Name: 
// Module Name:    IFU 
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
module IF(
	input clk,
	input reset,
	input PCSrc,
	input [31:0]Npc,
	input Stall,
	output [31:0]IR,
	output [31:0]PC4
    );
	
	reg [31:0]IM[1023:0];
	reg [31:0]PC;
	integer i;
	
	initial begin
		PC = 32'h3000;
		$readmemh("code.txt",IM);
	end
	
	always @(posedge clk)begin
		if(reset)
			PC <= 32'h3000;
		else if(Stall)
			PC <= PC;
		else if(PCSrc == 0)
			PC <= PC + 4;
		else
			PC <= Npc;
	end
	
	assign IR = IM[PC[11:2]];
	assign PC4 = PC + 4;

endmodule
