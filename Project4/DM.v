`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:22 11/20/2016 
// Design Name: 
// Module Name:    DM 
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
module DM(
	input Clk,
	input Reset,
	input [31:0]Addr,
	input [31:0]Write_data,
	input Mem_write,
	output [31:0]Read_data
    );
	integer i;
	reg [31:0]DM_Reg[1023:0];
	
	initial begin 
		for(i = 0;i < 1023;i = i + 1)begin 
			DM_Reg[i] <= 0;
		end
	end
	
	always@(posedge Clk)begin 
		if(Reset)begin 
			for(i = 0;i < 1023;i = i + 1)begin 
				DM_Reg[i] <= 0;
			end
		end
		else if(Mem_write) begin
			DM_Reg[Addr[11:2]] <= Write_data;
			$display("*%h <= %h",Addr,Write_data);
		end
		else 
			DM_Reg[Addr[11:2]] <= DM_Reg[Addr[11:2]];
	end
	
	assign Read_data = DM_Reg[Addr[11:2]];


endmodule
