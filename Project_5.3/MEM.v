`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:02:02 12/07/2016 
// Design Name: 
// Module Name:    MEM 
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
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define imm 15:0
`define op 31:26
`define func 5:0

module MEM(
    input clk,
    input reset,
	input [31:0]IRM,
    input [31:0] ALUout,
    input [31:0] RT,
    output [31:0] DMout
    );
	parameter	op_sw = 6'b101011;
	
	wire [31:0]Write_data;
	wire [31:0]Addr;

	integer i;
	reg [31:0]DM_Reg[1023:0];

	assign Addr = ALUout;
	assign Write_data = RT;
	
	initial begin 
		for(i = 0;i < 1023;i = i + 1)begin 
			DM_Reg[i] = 0;
		end
	end
	
	always@(posedge clk)begin 
		if(reset)begin 
			for(i = 0;i < 1023;i = i + 1)begin 
				DM_Reg[i] <= 0;
			end
		end
		else if(MemWrite) begin
			DM_Reg[Addr[11:2]] <= Write_data;
			$display("*%h <= %h",Addr,Write_data);
		end
		else 
			DM_Reg[Addr[11:2]] <= DM_Reg[Addr[11:2]];
	end
	
	assign MemWrite = IRM[`op] == op_sw ? 1 :0;
	assign DMout = DM_Reg[Addr[11:2]];

endmodule
