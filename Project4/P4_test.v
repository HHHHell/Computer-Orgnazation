`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:28:32 11/22/2016
// Design Name:   mips
// Module Name:   D:/ISE/Project4/P4_test.v
// Project Name:  Project4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module P4_test;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		
		#5;
		reset = 0;

		// Wait 100 ns for global reset to finish
/*		#100;
		
		reset = 0;
*/       
		// Add stimulus here

	end
	
	always #0.5 clk = ~clk;
      
endmodule

