//Subject:     CO project 5 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:     0510513 許騰今
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
	instr_op_i,
	instr_i,
	jr_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_type_o,
	Branch_o,
	itypewrite_o,
	itypeOP_o,
	MemtoReg_o,
	MemWrite_o,
	MemRead_o,
	Jump_o,
	ifjal_o,
	ALUormulti);
     
//I/O ports
input  [6-1:0] instr_op_i;
input  [31:0]  instr_i;
input          jr_i;

output         RegWrite_o;
output [2-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output [2-1:0] Branch_type_o;
output		   Branch_o;
output		   itypewrite_o;
output		   itypeOP_o;
output		   MemWrite_o;
output		   MemRead_o;
output         MemtoReg_o;
output		   Jump_o;
output		   ifjal_o;
output		   ALUormulti;
 
//Internal Signals
reg    [2-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg    [2-1:0] Branch_type_o;
reg            Branch_o;
reg            itypewrite_o;
reg    [6-1:0] itypeOP_o;
reg            MemWrite_o;
reg            MemRead_o;
reg            MemtoReg_o;
reg            Jump_o;
reg			   ifjal_o;
reg			   ALUormulti;

//Parameter
wire Rformat;
wire lw;
wire sw;
wire branch;
wire itype;
wire jtype;
// In	Op5 	0 1 1 0
// 		Op4 	0 0 0 0
// 		Op3 	0 0 1 0
// 		Op2 	0 0 0 1
// 		Op1 	0 1 1 0
// 		Op0 	0 1 1 0
//Out	RegDst 	1 0 X X
// 		ALUSrc 	0 1 1 0
// 		RegWrit 1 1 0 0
// 		Branch 	0 0 0 1
// 		ALUOp1 	1 0 0 0
// 		ALUOp2 	0 0 0 1

//4 beq branch equal
//5 bne branch not equal
//6 blez branch less equal zero
//7 bgtz branch great than zero

//Main function

assign Rformat=(!instr_op_i[0])&(!instr_op_i[1])&(!instr_op_i[2])&(!instr_op_i[3])&(!instr_op_i[4])&(!instr_op_i[5]);
assign lw     =( instr_op_i[0])&( instr_op_i[1])&(!instr_op_i[2])&(!instr_op_i[3])&(!instr_op_i[4])&( instr_op_i[5]);
assign sw	  =( instr_op_i[0])&( instr_op_i[1])&(!instr_op_i[2])&( instr_op_i[3])&(!instr_op_i[4])&( instr_op_i[5]);
assign branch =( instr_op_i[2])&(!instr_op_i[3])&(!instr_op_i[4])&(!instr_op_i[5]);
assign itype  =( instr_op_i[3])&(!instr_op_i[4])&(!instr_op_i[5]);
assign jtype  =( instr_op_i[1])&(!instr_op_i[2])&(!instr_op_i[3])&(!instr_op_i[4])&(!instr_op_i[5]);

always @(instr_op_i or jr_i)begin
	RegDst_o<=Rformat;
	RegWrite_o<=(!jr_i)&(Rformat|lw|itype|(jtype&instr_op_i[0]));
	ALUSrc_o<=lw|sw|itype;
	Branch_o<=branch|jr_i;
	Branch_type_o<=instr_op_i[1:0];
	ALU_op_o[1]<=Rformat|itype;
	ALU_op_o[0]<=branch;
	itypewrite_o<=itype|branch;
	itypeOP_o<=(branch)?6'b100010:((instr_op_i[3:0]==4'b1000)?6'b100000:((instr_op_i[3:0]==4'b1010)?6'b101010:6'b000000));
	MemRead_o<=lw;
	MemWrite_o<=sw;
	MemtoReg_o<=lw;
	Jump_o<=jtype|jr_i;
	ifjal_o<=jtype&instr_op_i[0];
	ALUormulti<=Rformat&&(instr_i[10:6]==0)&&(instr_i[5:0]==5'd24);

//       	op		RegDst ALUSrc RegWrit Branch ALUOp1 ALUOp2
//addi     001000 	   0     1       1      0      0       0
//slti	   001010	   0     1       1      0      0       0
//beq	   000100			
end
endmodule





                    
                    