`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:49:55 12/07/2016 
// Design Name: 
// Module Name:    EX_MEM 
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
module EX_MEM(
	input clk,
	input reset,
    input [31:0] IRE,
    input [31:0] PC4E,
    input [31:0] ALUout,
    input [31:0] RTE,
    output [31:0] IRM,
    output [31:0] PC4M,
    output [31:0] ALUoutM,
    output [31:0] RTM
    );
	
	reg [31:0]IR_M;
	reg [31:0]PC4_M;
	reg [31:0]ALUout_M;
	reg [31:0]RT_M;
	
	initial begin 
		IR_M = 32'h0;
		PC4_M = 32'h3000;
		ALUout_M = 32'h0;
		RT_M = 32'h0;
	end
	always@(posedge clk) begin
		if(reset)begin
			IR_M <= 32'h0;
			PC4_M <= 32'h3000;
			ALUout_M <= 32'h0;
			RT_M <= 32'h0;
		end
		else begin
			IR_M <= IRE;
			PC4_M <= PC4E;
			ALUout_M <= ALUout;
			RT_M <= RTE;
		end
	end
	
	assign IRM = IR_M;
	assign PC4M = PC4_M;
	assign ALUoutM = ALUout_M;
	assign RTM = RT_M;
	
endmodule
