//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      Luke
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o,
	itypewrite_o,
	itypeOP_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [2-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
output		   itypewrite_o;
output		   itypeOP_o;
 
//Internal Signals
reg    [2-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;
reg            itypewrite_o;
reg    [6-1:0] itypeOP_o;

//Parameter
wire Rformat;
wire lw;
wire sw;
wire beq;
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
//Main function

assign Rformat=(!instr_op_i[0])&(!instr_op_i[1])&(!instr_op_i[2])&(!instr_op_i[3])&(!instr_op_i[4])&(!instr_op_i[5]);
assign lw     =( instr_op_i[0])&( instr_op_i[1])&(!instr_op_i[2])&(!instr_op_i[3])&(!instr_op_i[4])&( instr_op_i[5]);
assign sw	  =( instr_op_i[0])&( instr_op_i[1])&(!instr_op_i[2])&( instr_op_i[3])&(!instr_op_i[4])&( instr_op_i[5]);
assign beq    =(!instr_op_i[0])&(!instr_op_i[1])&( instr_op_i[2])&(!instr_op_i[3])&(!instr_op_i[4])&(!instr_op_i[5]);
assign addi   =(!instr_op_i[0])&(!instr_op_i[1])&(!instr_op_i[2])&( instr_op_i[3])&(!instr_op_i[4])&(!instr_op_i[5]);
assign slti	  =(!instr_op_i[0])&( instr_op_i[1])&(!instr_op_i[2])&( instr_op_i[3])&(!instr_op_i[4])&(!instr_op_i[5]);

always @(instr_op_i)begin
	RegDst_o<=Rformat;
	RegWrite_o<=Rformat|lw|addi|slti;
	ALUSrc_o<=lw|sw|addi|slti;
	Branch_o<=beq;
	ALU_op_o[1]<=Rformat|slti;
	ALU_op_o[0]<=beq;
	itypewrite_o<=addi|slti|beq;
	itypeOP_o<=instr_op_i[2]?6'b1000:(instr_op_i[1]?6'b101010:6'b100000);
//       	op		RegDst ALUSrc RegWrit Branch ALUOp1 ALUOp2
//addi     001000 	   0     1       1      0      0       0
//slti	   001010	   0     1       1      0      0       0
//beq	   000100			
end
endmodule





                    
                    