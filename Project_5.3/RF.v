`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:27:14 12/07/2016 
// Design Name: 
// Module Name:    RF 
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
module RF(
	input clk,
	input reset,
	input RegWrite,
	input [4:0]Rs,
	input [4:0]Rt,
	input [4:0]Addr,
	input [31:0]Data,
	output [31:0]Rf_d1,
	output [31:0]Rf_d2
    );
	integer i;
	reg [31:0]GRF[31:0];
	
	initial begin
		for(i = 0;i < 32;i = i + 1)
			GRF[i] = 32'h0;
	end
	
	always@(posedge clk) begin
		if(reset) begin
			for(i = 0;i < 32;i = i + 1)
				GRF[i] = 32'h0;
		end
		else if(RegWrite && Addr != 0) begin 
			$display("$%d <= %h",Addr,Data);
			GRF[Addr] <= Data;
		end
		else 
			GRF[0] <= 32'h0;
	end

	assign Rf_d1 = Rs == 0 ? 0 :
				   Rs == Addr && RegWrite ? Data : GRF[Rs];
	assign Rf_d2 = Rt == 0 ? 0 : 
				   Rt == Addr && RegWrite ? Data : GRF[Rt];

endmodule
