//Subject:     CO project 5 - Simple Single CPU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      0510513 許騰今
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
//判斷甚麼時候要bubble和forwarding，或者直接bubble不forwarding
module Pipe_CPU_1(
        clk_i,
		rst_i
		);
		
input         clk_i;
input         rst_i;

//Internal Signles
wire [31:0] pc_wire1; //4 5
wire [31:0] pc_wire1_b;
wire [31:0] pc_wire1_c;
wire [31:0] pc_wire2; //
wire [31:0] pc_wire3; //2 3 4 5
wire [31:0] pc_wire3_b;
wire [31:0] pc_wire3_c;
wire [31:0] pc_wire3_d;
wire [31:0] pc_wire3_e;
wire [31:0] pc_wire3X;
wire [31:0] Instruction; //2 3
wire [31:0] Instruction_b;
wire [31:0] Instruction_c;
wire [31:0] Instruction_d;
wire [31:0] InstructionX;
// wire Instruction0-5;
// wire Instruction0-15;
// wire Instruction11-15;
// wire Instruction16-20;
// wire Instruction21-25;
// wire Instruction26-31;
wire [31:0] RD1; //3 4
wire [31:0] RD1_b;
wire [31:0] RD1_c;
wire [31:0] RD2; //3 4
wire [31:0] RD2_b;
wire [31:0] RD2_c;
wire [31:0] IMMED; //3
wire [31:0] IMMED_b;
wire [31:0] SL2; //
wire [31:0] PCIMMED; //4
wire [31:0] PCIMMED_b;

    

wire        none; //
wire        zero; //4
wire        zero_b;
wire [31:0] result; //4 5
wire [31:0] result_b;
wire [31:0] result_c;
    
wire [31:0] WD; //
wire        REGDST; //
wire        REGWIRTE; //3 4 5
wire        REGWIRTE_b;
wire        REGWIRTE_c;
wire        REGWIRTE_d;
wire        REGWIRTEmay; //3 4 5
wire        REGWIRTEmay_b;
wire        REGWIRTEmay_c;    
wire        BRANCH; //3 4
wire        BRANCH_b;
wire        BRANCH_c;   
wire        JUMP; //3 4
wire        JUMP_b;
wire        JUMP_c;
    
wire        ALUSRC; //3
wire        ALUSRC_b; 
wire [1 :0] ALUOP; //3
wire [1 :0] ALUOP_b; 
wire [3 :0] ALUCONTROL; //
wire [1 :0] branchplusjump; //

wire [4 :0] MUX1; //
wire [4 :0] MUX1_b;
wire [4 :0] MUX1_c;
wire [4 :0] MUX1_d;
wire [31:0] MUX2; //
wire [4 :0] MUX3; //

wire [31:0] writedata1; //
wire        itypewrite; //3
wire        itypewrite_b;
wire [5 :0] itypeOP; //3
wire [5 :0] itypeOP_b;
wire [5 :0] ifitype; //

wire        memwrite; //3 4
wire        memwrite_b;
wire        memwrite_c;
wire        memread; //3 4
wire        memread_b;
wire        memread_c;
wire        memtoreg; //3 4 5
wire        memtoreg_b;
wire        memtoreg_c;
wire        memtoreg_d;
    
wire [31:0] readdata; // 5
wire [31:0] readdata_b;

wire [1 :0] Branch_type; //3 4
wire [1 :0] Branch_type_b;
wire [1 :0] Branch_type_c;

    

wire        wirejr; //3 4
wire        wirejr_b;
wire        wirejr_c;
    
wire [31:0] jandjal; //3 4
wire [31:0] jandjal_b;
wire [31:0] jandjal_c;

wire        ALUormulti;
wire        ALUormulti_b;
wire [31:0] result1;
wire [31:0] result2;
wire        zero1;
wire        zero2; 

wire        select1;
wire        select2;

wire        flush;

//Greate componentes
//1
ProgramCounter PC(
        .clk_i(clk_i),      
	    .rst_i (rst_i),     
	    .pc_in_i(pc_wire1) ,   
	    .pc_out_o(pc_wire2) 
	    );
//1	
Adder Adder1(
        .src1_i(pc_wire2),     
	    .src2_i(32'd4),     
	    .sum_o(pc_wire3X)    
	    );
//1	
Instruction_Memory IM(
        .addr_i(pc_wire2),  
	    .instr_o(InstructionX[31:0])    
	    );

Bubbble Bubbble(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .pc_wire3_i(pc_wire3X),
    .Instruction_i(InstructionX[31:0]),
    .pc_wire3_o(pc_wire3),
    .Instruction_o(Instruction)
);

//reg2
Pipe_Reg #(.size(32)) M1(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(pc_wire3),
    .data_o(pc_wire3_b)
    );

Pipe_Reg #(.size(32)) M2(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(Instruction),
    .data_o(Instruction_b)
    );

//2	
assign jandjal={pc_wire3_b[31:28],Instruction_b[25:0],2'b00};

//2
jr jr(
    .instr_op31_26_i(Instruction_b[31:26]),
    .instr_op5_0_i(Instruction_b[5:0]),
    .jr_o(wirejr)
);

//2
Decoder Decoder(
        .instr_op_i(Instruction_b[31:26]),
        .instr_i(Instruction_b),
        .jr_i(wirejr),
            .RegDst_o(REGDST),  //2
            .ifjal_o(ifjal),    //2 5
	    
	    .ALU_op_o(ALUOP),   //3
	    .ALUSrc_o(ALUSRC),   //3
	    .itypewrite_o(itypewrite),  //3
	    .itypeOP_o(itypeOP),        //3

	    .Branch_o(BRANCH),  //4
            .Jump_o(JUMP),              //4
            .Branch_type_o(Branch_type), //4
            .MemWrite_o(memwrite),      //4
            .MemRead_o(memread),        //4

            .MemtoReg_o(memtoreg),      //5
            .RegWrite_o(REGWIRTE),       //5
            .ALUormulti(ALUormulti)
	    );
//2
MUX_2to1 #(.size(5)) Mux_Write_Reg1(
        .data0_i(Instruction_b[20:16]),
        .data1_i(Instruction_b[15:11]),
        .select_i(REGDST),
        .data_o(MUX3)
        );	

//2
MUX_2to1 #(.size(5)) Mux_Write_Reg2(
        .data0_i(MUX3),
        .data1_i(5'b11111),
        .select_i(ifjal),
        .data_o(MUX1)
        );
MUX_2to1 #(.size(1)) flush1(
        .data0_i(REGWIRTE),
        .data1_i(1'b0),
        .select_i(flush),
        .data_o(REGWIRTEmay)
        ); 
//2
Reg_File RF(
        .clk_i(clk_i),      
	.rst_i(rst_i) ,     
        .RSaddr_i(Instruction_b[25:21]) ,  
        .RTaddr_i(Instruction_b[20:16]) ,  
        .RDaddr_i(MUX1) ,  
        .RDdata_i(WD), 
        .RegWrite_i (REGWIRTE_d),//5
        .RSdata_o(RD1),  
        .RTdata_o(RD2)   
        );

//2
Sign_Extend SE(
        .data_i(Instruction_b[15:0]),
        .data_o(IMMED)
        );

//reg3
Pipe_Reg #(.size(1)) MMALUormulti(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(ALUormulti),
    .data_o(ALUormulti_b)
    );
Pipe_Reg #(.size(5)) MM1(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(MUX1),
    .data_o(MUX1_b)
    );

Pipe_Reg #(.size(32)) M3(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(pc_wire3_b),
    .data_o(pc_wire3_c)
    );
    
Pipe_Reg #(.size(32)) M4(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(Instruction_b),
    .data_o(Instruction_c)
    );
    
Pipe_Reg #(.size(32)) M5(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(RD1),
    .data_o(RD1_b)
    );
    
Pipe_Reg #(.size(32)) M6(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(RD2),
    .data_o(RD2_b)
    );
    
Pipe_Reg #(.size(32)) M7(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(IMMED),
    .data_o(IMMED_b)
    );
    
Pipe_Reg #(.size(1)) M8(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(REGWIRTE),
    .data_o(REGWIRTE_b)
    );
    
Pipe_Reg #(.size(1)) M9(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(BRANCH),
    .data_o(BRANCH_b)
    );
    
Pipe_Reg #(.size(1)) M10(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(JUMP),
    .data_o(JUMP_b)
    );
    
Pipe_Reg #(.size(1)) M11(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(ALUSRC),
    .data_o(ALUSRC_b)
    );
    
Pipe_Reg #(.size(2)) M12(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(ALUOP),
    .data_o(ALUOP_b)
    );
    
Pipe_Reg #(.size(1)) M13(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(itypewrite),
    .data_o(itypewrite_b)
    );
    
Pipe_Reg #(.size(6)) M14(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(itypeOP),
    .data_o(itypeOP_b)
    );
    
Pipe_Reg #(.size(1)) M15(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(memwrite),
    .data_o(memwrite_b)
    );
    
Pipe_Reg #(.size(1)) M16(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(memread),
    .data_o(memread_b)
    );
    
Pipe_Reg #(.size(1)) M17(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(memtoreg),
    .data_o(memtoreg_b)
    );
    
Pipe_Reg #(.size(2)) M18(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(Branch_type),
    .data_o(Branch_type_b)
    );

Pipe_Reg #(.size(1)) M19(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(wirejr),
    .data_o(wirejr_b)
    );

Pipe_Reg #(.size(32)) M20(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(jandjal),
    .data_o(jandjal_b)
    );

//3
MUX_2to1 #(.size(1)) flush2(
        .data0_i(REGWIRTE_b),
        .data1_i(1'b0),
        .select_i(flush),
        .data_o(REGWIRTEmay_b)
        ); 
Forwarding_unit Forwarding_unit(
        .rs(Instruction_c[25:21]),
        .rt(Instruction_c[20:16]),
        .ex_mem(REGWIRTE_c),
        .mem_wb(REGWIRTE_d),
        .MUX1_c(MUX1_c),
        .MUX1_d(MUX1_d),
        .select1(select1),
        .select2(select2)
);

MUX_2to1 #(.size(6))IF_Itype(
        .data0_i(Instruction_c[5:0]),
        .data1_i(itypeOP_b),
        .select_i(itypewrite_b),
        .data_o(ifitype)
        );

//3
ALU_Ctrl AC(
        .funct_i(ifitype),   
        .ALUOp_i(ALUOP_b),   
        .ALUCtrl_o(ALUCONTROL) 
        );
// MUX_4to1 #(.size(32)) forwardmux(
//         .data0_i(),
//         .data1_i(),
//         .data2_i(),
//         .data3_i(),
//         .select_i(
// );

//3
MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(RD2_b),
        .data1_i(IMMED_b),
        .select_i(ALUSRC_b),
        .data_o(MUX2)
        );

//3		
ALU ALU(
        .clk(clk_i),
        .rst(rst_i),
        .src1(RD1_b),
	.src2(MUX2),
	.ALU_control(ALUCONTROL),
	.result(result1),
	.zero(zero1)
	);

multi multi(
        .clk(clk_i),
        .rst(rst_i),
        .src1(RD1_b),
	.src2(MUX2),
	.ALU_control(ALUCONTROL),
	.result(result2),
	.zero(zero2)
	);

MUX_2to1 #(.size(32)) Mux_ALU2(
        .data0_i(result1),
        .data1_i(result2),
        .select_i(ALUormulti_b),
        .data_o(result)
        ); 

MUX_2to1 #(.size(1)) Mux_ALU3(
        .data0_i(zero1),
        .data1_i(zero2),
        .select_i(ALUormulti_b),
        .data_o(zero)
        ); 

//3
Adder Adder2(
        .src1_i(pc_wire3_c),     
	.src2_i(SL2),     
	.sum_o(PCIMMED)      
	);

//3		
Shift_Left_Two_32 Shifter(
        .data_i(IMMED_b),
        .data_o(SL2)
        );		
//reg4
Pipe_Reg #(.size(32)) Mww(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(Instruction_c),
    .data_o(Instruction_d)
    );

Pipe_Reg #(.size(5)) MM2(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(MUX1_b),
    .data_o(MUX1_c)
    );

Pipe_Reg #(.size(32)) M21(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(pc_wire3_c),
    .data_o(pc_wire3_d)
    );

Pipe_Reg #(.size(32)) M22(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(RD1_b),
    .data_o(RD1_c)
    );

Pipe_Reg #(.size(32)) M23(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(RD2_b),
    .data_o(RD2_c)
    );

Pipe_Reg #(.size(32)) M24(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(PCIMMED),
    .data_o(PCIMMED_b)
    );

Pipe_Reg #(.size(1)) M25(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(zero),
    .data_o(zero_b)
    );

Pipe_Reg #(.size(32)) M26(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(result),
    .data_o(result_b)
    );

Pipe_Reg #(.size(1)) M27(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(BRANCH_b),
    .data_o(BRANCH_c)
    );

Pipe_Reg #(.size(1)) M28(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(JUMP_b),
    .data_o(JUMP_c)
    );

Pipe_Reg  #(.size(1)) M29(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(REGWIRTE_b),
    .data_o(REGWIRTE_c)
    );

Pipe_Reg  #(.size(1)) M30(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(memwrite_b),
    .data_o(memwrite_c)
    );

Pipe_Reg #(.size(1)) M31(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(memread_b),
    .data_o(memread_c)
    );

Pipe_Reg #(.size(1)) M32(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(memtoreg_b),
    .data_o(memtoreg_c)
    );
    
Pipe_Reg #(.size(2)) M33(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(Branch_type_b),
    .data_o(Branch_type_c)
    );

Pipe_Reg #(.size(1)) M34(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(wirejr_b),
    .data_o(wirejr_c)
    ); 

Pipe_Reg #(.size(32)) M35(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(jandjal_b),
    .data_o(jandjal_c)
    );

//4
MUX_2to1 #(.size(1)) flush3(
        .data0_i(REGWIRTE_c),
        .data1_i(1'b0),
        .select_i(flush),
        .data_o(REGWIRTEmay_c)
        ); 

MUX_4to1 #(.size(1)) Branch_Source(
        .data0_i(zero_b),
        .data1_i(~zero_b),
        .data2_i(~result_b[31]),
        .data3_i(~(zero_b|result_b[31])),
        .select_i(Branch_type_c),
        .data_o(none)
        );

//4
assign branchplusjump[0]=(BRANCH_c&none)|wirejr_c;
assign branchplusjump[1]=JUMP_c;

//4		
MUX_4to1 #(.size(32)) Mux_PC_Source(
        .data0_i(pc_wire3_d),
        .data1_i(PCIMMED_b),
        .data2_i(jandjal_c),
        .data3_i(RD1_c),
        .select_i(branchplusjump),
        .data_o(pc_wire1_b)
        );

Hazard_detect_unit Hazard_detect_unit(
        .instr(Instruction_d),
        .hazard(branchplusjump),
        .flush(flush)
);

//4
Data_Memory DM(
        .clk_i(clk_i),
	.addr_i(result_b),
	.data_i(RD2_c),
	.MemRead_i(memread_c),
	.MemWrite_i(memwrite_c),
	.data_o(readdata)
);

//reg5
Pipe_Reg #(.size(5)) MM3(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(MUX1_c),
    .data_o(MUX1_d)
    );
Pipe_Reg #(.size(32)) M36(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(pc_wire1_b),
    .data_o(pc_wire1_c)
    );
Pipe_Reg #(.size(32)) M37(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(pc_wire3_d),
    .data_o(pc_wire3_e)
    ); 
Pipe_Reg #(.size(32)) M38(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(result_b),
    .data_o(result_c)
    );  
Pipe_Reg #(.size(1)) M39(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(REGWIRTE_c),
    .data_o(REGWIRTE_d)
    );
Pipe_Reg #(.size(1)) M40(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(memtoreg_c),
    .data_o(memtoreg_d)
    );

Pipe_Reg #(.size(32)) M41(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(readdata),
    .data_o(readdata_b)
    );

//5
MUX_2to1 #(.size(32)) Write_data1(
        .data0_i(result_c),
        .data1_i(readdata_b),
        .select_i(memtoreg_d),
        .data_o(writedata1)
        );

//5
MUX_2to1 #(.size(32)) Write_data2(
        .data0_i(writedata1),
        .data1_i(pc_wire3_e),
        .select_i(ifjal),
        .data_o(WD)
        );

//reg1

Pipe_Reg #(.size(32)) M42(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(pc_wire1_c),
    .data_o(pc_wire1)
    );

endmodule
		  


