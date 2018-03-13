`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:16:38 12/07/2016 
// Design Name: 
// Module Name:    MEM_WB 
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
module MEM_WB(
	input clk,
	input reset,
    input [31:0] IRM,
    input [31:0] PC4M,
    input [31:0] ALUoutM,
    input [31:0] DMoutM,
    output [31:0] IRW,
    output [31:0] PC4W,
    output [31:0] ALUoutW,
    output [31:0] DMoutW
    );
	
	reg [31:0] IR_W;
	reg [31:0] PC4_W;
	reg [31:0] ALUout_W;
	reg [31:0] DMout_W;
	
	initial begin 
		IR_W = 32'h0;
		PC4_W = 32'h3000;
		ALUout_W = 32'h0;
		DMout_W = 32'h0;
	end
	always@(posedge clk)begin
		if(reset) begin
			IR_W <= 32'h0;
			PC4_W <= 32'h3000;
			ALUout_W <= 32'h0;
			DMout_W <= 32'h0;
		end
		else begin 
			IR_W <= IRM;
			PC4_W <= PC4M;
			ALUout_W <= ALUoutM;
			DMout_W <= DMoutM;
		end
	end

	assign IRW = IR_W;
	assign PC4W = PC4_W;
	assign ALUoutW = ALUout_W;
	assign DMoutW = DMout_W;

endmodule
