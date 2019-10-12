`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// 0510513 ???
// Company:
// Engineer:
//
// Create Date:    15:15:11 08/18/2013
// Design Name:
// Module Name:    alu
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

module alu(
           clk,           // system clock              (input)
           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
	 //bonus_control, // 3 bits bonus control input(input) 
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );

input           clk;
input           rst_n;
input  [32-1:0] src1;
input  [32-1:0] src2;
input  [4-1:0]  ALU_control;
wire   [32-1:0] cin; //declare by myself
wire            less; //declare by myself
wire            set; //declare by myself
wire   [32-1:0] result_begin;
wire            cout_begin;
//input   [3-1:0] bonus_control; 

output [32-1:0] result;
output          zero;
output          cout;
output          overflow;

reg    [32-1:0] result;
reg             zero;
reg             cout;
reg             overflow;
// reg [5-1:0] i;//declare by myself
reg             low=0;
//instantiation
alu_top bit0(src1[0], src2[0],less,ALU_control[0],ALU_control[1],low, {ALU_control[2],ALU_control[3]},result_begin[0], cin[0+1],);
alu_top bit1(src1[1], src2[1],low,ALU_control[0],ALU_control[1],cin[1], {ALU_control[2],ALU_control[3]},result_begin[1], cin[1+1],);
alu_top bit2(src1[2], src2[2],low,ALU_control[0],ALU_control[1],cin[2], {ALU_control[2],ALU_control[3]},result_begin[2], cin[2+1],);
alu_top bit3(src1[3], src2[3],low,ALU_control[0],ALU_control[1],cin[3], {ALU_control[2],ALU_control[3]},result_begin[3], cin[3+1],);
alu_top bit4(src1[4], src2[4],low,ALU_control[0],ALU_control[1],cin[4], {ALU_control[2],ALU_control[3]},result_begin[4], cin[4+1],);
alu_top bit5(src1[5], src2[5],low,ALU_control[0],ALU_control[1],cin[5], {ALU_control[2],ALU_control[3]},result_begin[5], cin[5+1],);
alu_top bit6(src1[6], src2[6],low,ALU_control[0],ALU_control[1],cin[6], {ALU_control[2],ALU_control[3]},result_begin[6], cin[6+1],);
alu_top bit7(src1[7], src2[7],low,ALU_control[0],ALU_control[1],cin[7], {ALU_control[2],ALU_control[3]},result_begin[7], cin[7+1],);
alu_top bit8(src1[8], src2[8],low,ALU_control[0],ALU_control[1],cin[8], {ALU_control[2],ALU_control[3]},result_begin[8], cin[8+1],);
alu_top bit9(src1[9], src2[9],low,ALU_control[0],ALU_control[1],cin[9], {ALU_control[2],ALU_control[3]},result_begin[9], cin[9+1],);
alu_top bit10(src1[10], src2[10],low,ALU_control[0],ALU_control[1],cin[10], {ALU_control[2],ALU_control[3]},result_begin[10], cin[10+1],);
alu_top bit11(src1[11], src2[11],low,ALU_control[0],ALU_control[1],cin[11], {ALU_control[2],ALU_control[3]},result_begin[11], cin[11+1],);
alu_top bit12(src1[12], src2[12],low,ALU_control[0],ALU_control[1],cin[12], {ALU_control[2],ALU_control[3]},result_begin[12], cin[12+1],);
alu_top bit13(src1[13], src2[13],low,ALU_control[0],ALU_control[1],cin[13], {ALU_control[2],ALU_control[3]},result_begin[13], cin[13+1],);
alu_top bit14(src1[14], src2[14],low,ALU_control[0],ALU_control[1],cin[14], {ALU_control[2],ALU_control[3]},result_begin[14], cin[14+1],);
alu_top bit15(src1[15], src2[15],low,ALU_control[0],ALU_control[1],cin[15], {ALU_control[2],ALU_control[3]},result_begin[15], cin[15+1],);
alu_top bit16(src1[16], src2[16],low,ALU_control[0],ALU_control[1],cin[16], {ALU_control[2],ALU_control[3]},result_begin[16], cin[16+1],);
alu_top bit17(src1[17], src2[17],low,ALU_control[0],ALU_control[1],cin[17], {ALU_control[2],ALU_control[3]},result_begin[17], cin[17+1],);
alu_top bit18(src1[18], src2[18],low,ALU_control[0],ALU_control[1],cin[18], {ALU_control[2],ALU_control[3]},result_begin[18], cin[18+1],);
alu_top bit19(src1[19], src2[19],low,ALU_control[0],ALU_control[1],cin[19], {ALU_control[2],ALU_control[3]},result_begin[19], cin[19+1],);
alu_top bit20(src1[20], src2[20],low,ALU_control[0],ALU_control[1],cin[20], {ALU_control[2],ALU_control[3]},result_begin[20], cin[20+1],);
alu_top bit21(src1[21], src2[21],low,ALU_control[0],ALU_control[1],cin[21], {ALU_control[2],ALU_control[3]},result_begin[21], cin[21+1],);
alu_top bit22(src1[22], src2[22],low,ALU_control[0],ALU_control[1],cin[22], {ALU_control[2],ALU_control[3]},result_begin[22], cin[22+1],);
alu_top bit23(src1[23], src2[23],low,ALU_control[0],ALU_control[1],cin[23], {ALU_control[2],ALU_control[3]},result_begin[23], cin[23+1],);
alu_top bit24(src1[24], src2[24],low,ALU_control[0],ALU_control[1],cin[24], {ALU_control[2],ALU_control[3]},result_begin[24], cin[24+1],);
alu_top bit25(src1[25], src2[25],low,ALU_control[0],ALU_control[1],cin[25], {ALU_control[2],ALU_control[3]},result_begin[25], cin[25+1],);
alu_top bit26(src1[26], src2[26],low,ALU_control[0],ALU_control[1],cin[26], {ALU_control[2],ALU_control[3]},result_begin[26], cin[26+1],);
alu_top bit27(src1[27], src2[27],low,ALU_control[0],ALU_control[1],cin[27], {ALU_control[2],ALU_control[3]},result_begin[27], cin[27+1],);
alu_top bit28(src1[28], src2[28],low,ALU_control[0],ALU_control[1],cin[28], {ALU_control[2],ALU_control[3]},result_begin[28], cin[28+1],);
alu_top bit29(src1[29], src2[29],low,ALU_control[0],ALU_control[1],cin[29], {ALU_control[2],ALU_control[3]},result_begin[29], cin[29+1],);
alu_top bit30(src1[30], src2[30],low,ALU_control[0],ALU_control[1],cin[30], {ALU_control[2],ALU_control[3]},result_begin[30], cin[30+1],);
alu_top bit31(src1[31], src2[31],low,ALU_control[0],ALU_control[1],cin[31], {ALU_control[2],ALU_control[3]},result_begin[31], cout_begin,);

assign less=~ALU_control[0]|ALU_control[1]|ALU_control[2]|ALU_control[3]|(src1[31]&~src1[31])|(cin&src1[31])|(cin&~src2[31]);

always@( posedge clk or negedge rst_n ) 
begin
	if(!rst_n) begin

	end
	else begin
        //0000 and
        //0001 or
        //0010 add
        //0110 sub
        //1100 nor
        //0111 slt
        // cout=cout_begin;
        case(ALU_control)
                4'b0000: {cout,result}<=src1&&src2;
                4'b0001: {cout,result}<=src1||src2;
                4'b0010: {cout,result}<=src1+src2;
                4'b0110: {cout,result}<=src1+(~src2); 
                4'b1100: {cout,result}<=(~src1)&&(~src2);
                4'b0111: {cout,result}<=src1+(~src2);
        endcase
        if(ALU_control==4'b011x) result<=result_begin+1; // 2's complwement
        //OVERFLOW
        case(ALU_control) //OVERFLOW
            4'b0000: overflow<=0;
            4'b0001: overflow<=0;
            4'b0010: if(src1[31]==1&&src2[31]==1) overflow<=(1+result[31]); else if(src1[31]==0&&src2[31]==0) overflow<=result[31];//add
            4'b0110: if(src1[31]==1&&src2[31]==0) overflow<=(1+result[31]); else if(src1[31]==0&&src2[31]==1) overflow<=result[31];//sub
            4'b1100: result<=(~src1)&&(~src2);
            4'b0111: {result,cout}<=src1+(~src2);
        endcase
        zero<=!result;
	end
end

endmodule

//(result[0]^result[1]^result[2]^result[3]^result[4]^result[5]^result[6]^result[7]^result[8]^result[9]^result[10]^result[11]^result[12]^result[13]^result[14]^result[15]^result[16]^result[17]^result[18]^result[19]^result[20]^result[21]^result[22]^result[23]^result[24]^result[25]^result[26]^result[27]^result[28]^result[29]^result[30]^result[31])
//{result[31],result[30],result[2],result[3],result[4],result[5],result[6],result[7],result[8],result[9],result[10],result[11],result[12],result[13],result[14],result[15],result[16],result[17],result[18],result[19],result[20],result[21],result[22],result[23],result[24],result[25],result[26],result[27],result[28],result[29],result[30],result[31]}+=1;
