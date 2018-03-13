`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:59:02 11/20/2016 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
	input Clk,
	input Reset,
	input [4:0]rs,
	input [4:0]rt,
	input [4:0]rd,
	input [31:0]Reg_data,
	input Reg_write,
	output [31:0]Data1,
	output [31:0]Data2
    );
	
	integer i;
	reg [31:0]GRF_Reg[31:0];

	assign Data1 = GRF_Reg[rs];
	assign Data2 = GRF_Reg[rt];

	initial begin
		for(i = 0; i < 32; i = i + 1)begin 
			GRF_Reg[i] = 0;
		end
	end
	
	always @(posedge Clk)begin 
		if(Reset)begin 
			for(i = 0;i < 31;i = i + 1)
				GRF_Reg[i] <= 0;
		end
		else if(Reg_write && rd != 0)begin 
			GRF_Reg[rd] <= Reg_data;
			$display("$%d <= %h",rd,Reg_data);
		end
		else 
			GRF_Reg[0] <= 0;
//		$display("_Data1 = %h, _Data2 = %h",Data1,Data2);
	end

endmodule
