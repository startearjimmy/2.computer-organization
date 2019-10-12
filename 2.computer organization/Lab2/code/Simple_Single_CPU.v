//Subject:     CO project 2 - Simple Single CPU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Simple_Single_CPU(clk_i,rst_i);
		
//I/O port
input         clk_i;
input         rst_i;

//Internal Signles
wire [31:0] pc_wire1;
wire [31:0] pc_wire2;
wire [31:0] pc_wire3;
wire [31:0] Instruction;
// wire Instruction0-5;
// wire Instruction0-15;
// wire Instruction11-15;
// wire Instruction16-20;
// wire Instruction21-25;
// wire Instruction26-31;
wire [31:0] RD1;
wire [31:0] RD2;
wire [31:0] IMMED;
wire [31:0] SL2;
wire [31:0] PCIMMED;
wire        none;
wire        noneifzero;
wire [31:0] WD;
wire        REGDST;
wire        REGWIRTE;
wire        BRANCH;
wire        ALUSRC;
wire [1 :0] ALUOP;
wire [3 :0] ALUCONTROL;

wire [4 :0] MUX1;
wire [31:0] MUX2;

wire        itypewrite;
wire [5 :0] itypeOP;
wire [5 :0] ifitype;



//Greate componentes
ProgramCounter PC(
        .clk_i(clk_i),      
	    .rst_i (rst_i),     
	    .pc_in_i(pc_wire1) ,   
	    .pc_out_o(pc_wire2) 
	    );
	
Adder Adder1(
        .src1_i(pc_wire2),     
	    .src2_i(32'd4),     
	    .sum_o(pc_wire3)    
	    );
	
Instr_Memory IM(
        .pc_addr_i(pc_wire2),  
	    .instr_o(Instruction[31:0])    
	    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(Instruction[20:16]),
        .data1_i(Instruction[15:11]),
        .select_i(REGDST),
        .data_o(MUX1)
        );	
		
Reg_File RF(
        .clk_i(clk_i),      
	.rst_i(rst_i) ,     
        .RSaddr_i(Instruction[25:21]) ,  
        .RTaddr_i(Instruction[20:16]) ,  
        .RDaddr_i(MUX1) ,  
        .RDdata_i(WD), 
        .RegWrite_i (REGWIRTE),
        .RSdata_o(RD1),  
        .RTdata_o(RD2)   
        );
	
Decoder Decoder(
        .instr_op_i(Instruction[31:26]), 
	    .RegWrite_o(REGWIRTE), 
	    .ALU_op_o(ALUOP),   
	    .ALUSrc_o(ALUSRC),   
	    .RegDst_o(REGDST),   
	    .Branch_o(BRANCH),
            .itypewrite_o(itypewrite),
	    .itypeOP_o(itypeOP)
	    );

MUX_2to1 #(.size(6))IF_Itype(
        .data0_i(Instruction[5:0]),
        .data1_i(itypeOP),
        .select_i(itypewrite),
        .data_o(ifitype)
        );

ALU_Ctrl AC(
        .funct_i(ifitype),   
        .ALUOp_i(ALUOP),   
        .ALUCtrl_o(ALUCONTROL) 
        );
	
Sign_Extend SE(
        .data_i(Instruction[15:0]),
        .data_o(IMMED)
        );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(RD2),
        .data1_i(IMMED),
        .select_i(ALUSRC),
        .data_o(MUX2)
        );	
		
ALU ALU(
        .clk(clk_i),
        .rst(rst_i),
        .src1(RD1),
	.src2(MUX2),
	.ALU_control(ALUCONTROL),
	.result(WD),
	.zero(none)
	);
		
Adder Adder2(
        .src1_i(pc_wire3),     
	.src2_i(SL2),     
	.sum_o(PCIMMED)      
	);
		
Shift_Left_Two_32 Shifter(
        .data_i(IMMED),
        .data_o(SL2)
        ); 		
		
MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(pc_wire3),
        .data1_i(PCIMMED),
        .select_i(noneifzero),
        .data_o(pc_wire1)
        );
And And(
        .data0_i(BRANCH),
        .data1_i(none),
        .data_o(noneifzero)
        );
//part1

//part2

//part3

endmodule
		  


