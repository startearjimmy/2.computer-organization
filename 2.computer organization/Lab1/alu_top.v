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

output        result;
output        cout;

reg           result;
reg           cout;

always@( src1 or src2 or operation )//always@( src1 or src2 or cin or operation or A_invert or B_invert or less)
begin
    //0000 and
    //0001 or
    //0010 add
    //0110 sub
    //1100 nor
    //0111 slt
    case({A_invert,B_invert,operation})
        4'b0000: result<=src1&src2;
        4'b0001: result<=src1|src2;
        4'b0010: {result,cout}<=src1+src2+cin;
        4'b0110: {result,cout}<=src1+(~src2)+cin; //need to detect overflow
        4'b1100: result<=(~src1)&(~src2);
        4'b0111: {result,cout}<=src1+(~src2)+cin;
    endcase
        if(less==0&&{A_invert,B_invert,operation}==4'b0111) result<=less;
        if(less==1&&{A_invert,B_invert,operation}==4'b0111) result<=less;
//less->set
end

endmodule
