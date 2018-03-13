`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:23:12 11/20/2016 ,completed at 23:00 11/23/2016
// Design Name: 
// Module Name:    mips 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// Dependencies: 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//Instruction set = {addu,subu,ori,sw,lw,beq,jal,jr,slt,sltiu,bgez,nop}
module mips(
	input clk,
	input reset
    );

	wire [31:0]_pc;
	wire [31:0]_Instr;
	wire [31:0]_ALUres;
	wire _Zero;
	wire _Bgez;
	wire [31:0]_Shifter;
	wire [31:0]_Ext;
	wire [4:0] _rd;			//address to write 
	wire [31:0]_Data1;		//data read from rs
	wire [31:0]_Data2;		//data read from rt
	wire [31:0]_ALUdata2;	//the second data of alu
	wire [31:0]_Regdata;	//data to be writed into registers
	wire [31:0]_Memdata;	//data to be writed into memory
	wire [31:0]_Memout;		//data read from memory
	wire [31:0]_Memaddr;		//memory address
	
	wire [1:0]_Branch;
	wire [1:0]_ALUop;
	wire _ALUsrc;
	wire [1:0]_Rd_sel;
	wire [1:0]_GRF_sel;
	wire _Reg_write;			//signal of registers to write
	wire _Mem_write;			//signal of memmory to write
	wire _Type;
	wire _Bits_ctrl;
	IFU IFU(clk,reset,_Zero,_Bgez,_Branch,_Shifter,_Instr[25:0],_Data1,_Instr,_pc);
	GRF GRF(clk,reset,_Instr[25:21],_Instr[20:16],_rd,_Regdata,_Reg_write,_Data1,_Data2);
	ALU ALU(_Data1,_ALUdata2,_ALUop,_ALUres,_Zero,_Bgez);
	DM DM(clk,reset,_ALUres,_Data2,_Mem_write,_Memout);
	CTRL CTRL(_Instr[31:26],_Instr[5:0],_Branch,_ALUop,_ALUsrc,_Rd_sel,_GRF_sel,_Reg_write,_Mem_write,_Type,_Bits_ctrl);
	Ext Ext(_Instr[15:0],_Type,_Ext);
	Shifter Shifter(_Ext,_Bits_ctrl,_Shifter);										//ctrl : Bits_ctrl
	
	
	MUX_4_1_5bits rd_MUX (_Instr[15:11],_Instr[20:16],5'd31,5'd0,_Rd_sel,_rd);		//ctrl : _Rd_sel
	MUX_2_1_32bits ALU_MUX(_Data2,_Ext,_ALUsrc,_ALUdata2);							//ctrl : ALUsrc
	MUX_4_1_32bits GRF_MUX(_ALUres,_Shifter,_Memout,_pc+4,_GRF_sel,_Regdata);			//ctrl : _GRF_sel
	
/*	always@(posedge clk)begin
		$display("PC = %h,Instr = %h",_pc,_Instr);
		$display("_Data1 = %h, _Data2 = %h",_Data1,_Data2);
		$display("_ALUres = %h, _Zero = %h",_ALUres,_Zero);
		$display("_Branch = %d, _ALUop = %d, _ALUsrc = %d, _Rd_sel = %d, _GRF_sel = %d, _Reg_write = %d, _Mem_write = %d, _Type = %d, _Bits_ctrl = %d",
		_Branch,_ALUop,_ALUsrc,_Rd_sel,_GRF_sel,_Reg_write,_Mem_write,_Type,_Bits_ctrl);
		$display("_Ext = %h, _Shifter = %h",_Ext,_Shifter);
		$display("_rd = %h, _ALUdata2 = %h, _Regdata = %h\n",_rd,_ALUdata2,_Regdata);
	end
*/
endmodule
