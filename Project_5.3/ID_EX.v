`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:00:46 12/07/2016 
// Design Name: 
// Module Name:    ID_EX 
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
module ID_EX(
	input clk,
	input reset,
	input StallE,
    input [31:0] IRD,
    input [31:0] PC4D,
    input [31:0] RSD,
    input [31:0] RTD,
    input [31:0] EXTD,
	
    output [31:0] IRE,
    output [31:0] PC4E,
    output [31:0] RSE,
    output [31:0] RTE,
    output [31:0] EXTE
    );
	
	reg [31:0]IR_E;
	reg [31:0]PC4_E;
	reg [31:0]RS_E;
	reg [31:0]RT_E;
	reg [31:0]EXT_E;
	
	initial begin
		IR_E = 32'h0;
		PC4_E = 32'h3000;
		RS_E = 32'h0;
		RT_E = 32'h0;
		EXT_E = 32'h0;
	end
	always@(posedge clk)begin 
		if(reset)begin 
			IR_E <= 32'h0;
			PC4_E <= 32'h3000;
			RS_E <= 32'h0;
			RT_E <= 32'h0;
			EXT_E <= 32'h0;
		end
		else if(StallE)begin
			if(StallE)begin
				IR_E <= 32'h0;
				PC4_E <= 0;
			end
		end
		else begin
			IR_E <= IRD;
			PC4_E <= PC4D;
			RS_E <= RSD;
			RT_E <= RTD;
			EXT_E <= EXTD;
		end
	end
	
	assign IRE = IR_E;
	assign PC4E = PC4_E;
	assign RSE = RS_E;
	assign RTE = RT_E;
	assign EXTE = EXT_E;
	
endmodule
