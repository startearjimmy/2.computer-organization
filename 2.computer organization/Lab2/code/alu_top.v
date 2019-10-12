`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// 0510513 ???
// Company: 
// Engineer: 
// 
// Create Date:    10:58:01 10/10/2013
// Design Name: 
// Module Name:    alu_top 
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

module alu_top(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //1 bit result   (output)
               cout,       //1 bit carry out(output)
               );

input         src1;
input         src2;
input         less;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;

wire          muxA;
wire          muxB;    
wire          opand;
wire          opor;
wire          opadd;


output        result;
output        cout;

assign muxA  =((~src1)&A_invert)|(src1&(~A_invert));
assign muxB  =((~src2)&B_invert)|(src2&(~B_invert));
assign opand =muxA&muxB;
assign opor  =muxA|muxB;
assign opadd =(muxA^muxB)^cin;
assign cout  =(((muxA^muxB)&cin)|muxA&muxB)&operation[1];
assign result=(opand&(~operation[1])&(~operation[0]))|(opor&(~operation[1])&( operation[0]))|(opadd&( operation[1])&(~operation[0]))|(opadd&( operation[1])&( operation[0]));

// always@(src1 or src2 or cin or operation or A_invert or B_invert or less)//always@( src1 or src2 or cin or operation or A_invert or B_invert or less)

// begin
//     //0000 and
//     //0001 or
//     //0010 add
//     //0110 sub
//     //1100 nor
//     //0111 slt
//     case({A_invert,B_invert,operation})
//         4'b0000: result=opand;
//         4'b0001: result=opor;
//         4'b0010: {cout,result}=src1+src2+cin+2'b00;
//         4'b0110: {cout,result}=src1+(!src2)+cin+2'b00; //need to detect overflow
//         4'b1100: result=opnor;
//         4'b0111: result=less;
//     endcase
//     case({A_invert,B_invert,operation})
//         4'b0000,4'b0001,4'b1100: cout=0;
//         4'b0111: {cout,null}=src1+(!src2)+cin+2'b00;
//     endcase
// //less->set
// end

endmodule
