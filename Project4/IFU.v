`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:17:26 11/20/2016 
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
module IFU(
	input Clk,
	input Reset,
	input Zero,
	input Bgez,
	input [1:0]Branch,
	input [31:0]Shift,
	input [25:0]Instr_index,
	input [31:0]Data_ra,
	output [31:0]Instr,
	output [31:0]PC
    );
	integer i;
	
	reg [31:0]PC_Reg;
	reg [31:0]IM[1023:0];
	
	initial begin 
		PC_Reg = 32'h3000;
		$readmemh("code.txt",IM);
	end

	always@(posedge Clk) begin 
		if(Reset)
			PC_Reg <= 32'h3000;
		else if(Branch == 0)
			PC_Reg <= PC_Reg + 4;
		else if(Branch == 1 && (Zero ==1 || Bgez == 1))
			PC_Reg <= PC_Reg + 4 + Shift;
		else if(Branch == 2)
			PC_Reg <= {PC_Reg[31:28],Instr_index,2'b0};
		else 
			PC_Reg <= Data_ra;
	end
	
	
	assign Instr = IM[PC_Reg[11:2]];
	assign PC = PC_Reg;

/*	always@(*)begin
		$display("_pc = %h, _Instr = %h",PC,Instr);
	end
*/
endmodule
