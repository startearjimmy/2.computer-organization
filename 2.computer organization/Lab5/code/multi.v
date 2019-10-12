//Subject:     CO project 5 - multi
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      0510513 許騰今
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
     
module multi(
    clk,
    rst,
    src1,
	src2,
	ALU_control,
	result,
	zero);
     
//I/O ports
input           clk;
input           rst;
input  [32-1:0] src1;
input  [32-1:0] src2;
input  [4-1:0]  ALU_control;


wire   [32-1:0] cin; //declare by myself
wire            less; //declare by myself
wire   [32-1:0] result_begin; //declare by myself
wire            cout_begin; //declare by myself
wire   [32-1:0] for_slt;
//input   [3-1:0] bonus_control; 

output [32-1:0] result;
output          zero;

assign result=src1*src2;
assign zero=result==0;


endmodule      
          
          