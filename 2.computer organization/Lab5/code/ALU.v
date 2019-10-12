//Subject:     CO project 5 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:     0510513 許騰今 
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU(
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
//Internal signals

//Parameter
reg             low=0;
reg             high=1;

//Main function





//instantiation
alu_top bit0(src1[0], src2[0],less,ALU_control[3],ALU_control[2],low, {ALU_control[1],ALU_control[0]},result_begin[0], cin[0+1],);
alu_top bit1(src1[1], src2[1],low,ALU_control[3],ALU_control[2],cin[1], {ALU_control[1],ALU_control[0]},result_begin[1], cin[1+1],);
alu_top bit2(src1[2], src2[2],low,ALU_control[3],ALU_control[2],cin[2], {ALU_control[1],ALU_control[0]},result_begin[2], cin[2+1],);
alu_top bit3(src1[3], src2[3],low,ALU_control[3],ALU_control[2],cin[3], {ALU_control[1],ALU_control[0]},result_begin[3], cin[3+1],);
alu_top bit4(src1[4], src2[4],low,ALU_control[3],ALU_control[2],cin[4], {ALU_control[1],ALU_control[0]},result_begin[4], cin[4+1],);
alu_top bit5(src1[5], src2[5],low,ALU_control[3],ALU_control[2],cin[5], {ALU_control[1],ALU_control[0]},result_begin[5], cin[5+1],);
alu_top bit6(src1[6], src2[6],low,ALU_control[3],ALU_control[2],cin[6], {ALU_control[1],ALU_control[0]},result_begin[6], cin[6+1],);
alu_top bit7(src1[7], src2[7],low,ALU_control[3],ALU_control[2],cin[7], {ALU_control[1],ALU_control[0]},result_begin[7], cin[7+1],);
alu_top bit8(src1[8], src2[8],low,ALU_control[3],ALU_control[2],cin[8], {ALU_control[1],ALU_control[0]},result_begin[8], cin[8+1],);
alu_top bit9(src1[9], src2[9],low,ALU_control[3],ALU_control[2],cin[9], {ALU_control[1],ALU_control[0]},result_begin[9], cin[9+1],);
alu_top bit10(src1[10], src2[10],low,ALU_control[3],ALU_control[2],cin[10], {ALU_control[1],ALU_control[0]},result_begin[10], cin[10+1],);
alu_top bit11(src1[11], src2[11],low,ALU_control[3],ALU_control[2],cin[11], {ALU_control[1],ALU_control[0]},result_begin[11], cin[11+1],);
alu_top bit12(src1[12], src2[12],low,ALU_control[3],ALU_control[2],cin[12], {ALU_control[1],ALU_control[0]},result_begin[12], cin[12+1],);
alu_top bit13(src1[13], src2[13],low,ALU_control[3],ALU_control[2],cin[13], {ALU_control[1],ALU_control[0]},result_begin[13], cin[13+1],);
alu_top bit14(src1[14], src2[14],low,ALU_control[3],ALU_control[2],cin[14], {ALU_control[1],ALU_control[0]},result_begin[14], cin[14+1],);
alu_top bit15(src1[15], src2[15],low,ALU_control[3],ALU_control[2],cin[15], {ALU_control[1],ALU_control[0]},result_begin[15], cin[15+1],);
alu_top bit16(src1[16], src2[16],low,ALU_control[3],ALU_control[2],cin[16], {ALU_control[1],ALU_control[0]},result_begin[16], cin[16+1],);
alu_top bit17(src1[17], src2[17],low,ALU_control[3],ALU_control[2],cin[17], {ALU_control[1],ALU_control[0]},result_begin[17], cin[17+1],);
alu_top bit18(src1[18], src2[18],low,ALU_control[3],ALU_control[2],cin[18], {ALU_control[1],ALU_control[0]},result_begin[18], cin[18+1],);
alu_top bit19(src1[19], src2[19],low,ALU_control[3],ALU_control[2],cin[19], {ALU_control[1],ALU_control[0]},result_begin[19], cin[19+1],);
alu_top bit20(src1[20], src2[20],low,ALU_control[3],ALU_control[2],cin[20], {ALU_control[1],ALU_control[0]},result_begin[20], cin[20+1],);
alu_top bit21(src1[21], src2[21],low,ALU_control[3],ALU_control[2],cin[21], {ALU_control[1],ALU_control[0]},result_begin[21], cin[21+1],);
alu_top bit22(src1[22], src2[22],low,ALU_control[3],ALU_control[2],cin[22], {ALU_control[1],ALU_control[0]},result_begin[22], cin[22+1],);
alu_top bit23(src1[23], src2[23],low,ALU_control[3],ALU_control[2],cin[23], {ALU_control[1],ALU_control[0]},result_begin[23], cin[23+1],);
alu_top bit24(src1[24], src2[24],low,ALU_control[3],ALU_control[2],cin[24], {ALU_control[1],ALU_control[0]},result_begin[24], cin[24+1],);
alu_top bit25(src1[25], src2[25],low,ALU_control[3],ALU_control[2],cin[25], {ALU_control[1],ALU_control[0]},result_begin[25], cin[25+1],);
alu_top bit26(src1[26], src2[26],low,ALU_control[3],ALU_control[2],cin[26], {ALU_control[1],ALU_control[0]},result_begin[26], cin[26+1],);
alu_top bit27(src1[27], src2[27],low,ALU_control[3],ALU_control[2],cin[27], {ALU_control[1],ALU_control[0]},result_begin[27], cin[27+1],);
alu_top bit28(src1[28], src2[28],low,ALU_control[3],ALU_control[2],cin[28], {ALU_control[1],ALU_control[0]},result_begin[28], cin[28+1],);
alu_top bit29(src1[29], src2[29],low,ALU_control[3],ALU_control[2],cin[29], {ALU_control[1],ALU_control[0]},result_begin[29], cin[29+1],);
alu_top bit30(src1[30], src2[30],low,ALU_control[3],ALU_control[2],cin[30], {ALU_control[1],ALU_control[0]},result_begin[30], cin[30+1],);
alu_top bit31(src1[31], src2[31],low,ALU_control[3],ALU_control[2],cin[31], {ALU_control[1],ALU_control[0]},result_begin[31], cout_begin,);

// initial begin
//     result=0;
//     zero=0;
// end
assign for_slt=result_begin+32'd1;
assign less=for_slt[31];
assign cin[0]=0;
assign result=(~ALU_control[3]& ALU_control[2]& ALU_control[1]& ALU_control[0])?(less?32'd1:32'd0):((~ALU_control[3]& ALU_control[2]& ALU_control[1]&~ALU_control[0])?result_begin+32'd1:result_begin);//result_begin;//
assign  zero=!result;

// always@( posedge clk or negedge rst ) 
// begin
// 	if(!rst) begin
//         result=0;
//         zero=0;
// 	end
// 	else begin
//         //2's complement
//         //result
//         case(ALU_control)
//                 4'b0000: result=result_begin;
//                 4'b0001: result=result_begin;
//                 4'b0010: result=result_begin;
//                 4'b0110: result=result_begin+1;
//                 4'b1100: result=result_begin;
//                 4'b0111: result=result_begin;
//         endcase
//         // zero
//         zero=~(result[0]|result[1]|result[2]|result[3]|result[4]|result[5]|result[6]|result[7]|result[8]|result[9]|result[10]|result[11]|result[12]|result[13]|result[14]|result[15]|result[16]|result[17]|result[18]|result[19]|result[20]|result[21]|result[22]|result[23]|result[24]|result[25]|result[26]|result[27]|result[28]|result[29]|result[30]|result[31]);
// 	end
// end

endmodule





                    
                    