`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:51 11/20/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	input [31:0]Data1,
	input [31:0]Data2,
	input [1:0]ALUop,
	output [31:0]Result,
	output Zero,
	output Bgez
    );
	
	assign Result = ALUop == 0 ? Data1 + Data2 :
					ALUop == 1 ? Data1 - Data2 :
					ALUop == 2 ? Data1 | Data2 :
					Data1 < Data2 ? 32'b1 : 32'b0;
					/*Data1[31] && !Data1[31] ? 1 :		// ALUop == 3: Result = Data1 < Data2(sign compare)
					!Data1[31] && Data2[31] ? 0 :
					Data1[30:0] < Data2[30:0] ? 32'b1 : 32'b0;
					*/
	assign Zero = (Data1 == Data2);
	
	assign Bgez = !Data1[31] && Data1[30:0] >= 0;			// branch if greater than or equal to zero
	
/*	always@(*)begin
		$display("Data1 = %h, Data2 = %h, ALUop = %h, Result = %h, Zero = %d",Data1,Data2,ALUop,Result,Zero);
	end
*/
endmodule
