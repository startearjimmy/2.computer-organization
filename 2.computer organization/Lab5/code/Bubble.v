//Subject:     CO project 5 - Bubble
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      0510513 許騰今
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Bubbble(
    clk_i,
    rst_i,
    pc_wire3_i,
    Instruction_i,
    pc_wire3_o,
    Instruction_o
);

input   clk_i;
input   rst_i;
input   [31:0] pc_wire3_i;
input   [31:0] Instruction_i;

output  [31:0] pc_wire3_o;
output  [31:0] Instruction_o;
// reg     [31:0] pc_wire3_o;
// reg     [31:0] Instruction_o;

reg     [31:0]  instruction_file    [0:31];
reg     [31:0]  pc_wire3            [0:31];

reg     [31:0]  counter [0:1];
reg     [1:0]   b;     

integer c=0;

//Rformat Iformat bubble 2
//可能Itype會取錯範圍
//lw sw branch jump bubble 3 
// assign  pc_wire3_o=(counter[c]==2'b00)?pc_wire3[c]:32'dx;
// assign  instruction_o=(counter[c]==2'b00)?instruction_file[c]:32'dx;

always@(posedge clk_i) begin
instruction_file[(pc_wire3_i / 4)-1]=Instruction_i;
pc_wire3[(pc_wire3_i / 4)-1]=pc_wire3_i;
b=(instruction_file[(pc_wire3_i / 4)-1][31:26]==6'd35||instruction_file[(pc_wire3_i / 4)-1][31:26]==6'd43||instruction_file[(pc_wire3_i / 4)-1][31:26]==6'd2||instruction_file[(pc_wire3_i / 4)-1][31:26]==6'd3||instruction_file[(pc_wire3_i / 4)-1][31:26]==6'b000100||instruction_file[(pc_wire3_i / 4)-1][31:26]==6'b000101||instruction_file[(pc_wire3_i / 4)-1][31:26]==6'b000110||instruction_file[(pc_wire3_i / 4)-1][31:26]==6'b000111)?2'b11:2'b00;
counter[(pc_wire3_i / 4)-1]=(b!=0)?(b):2'b00;
    counter[c]=(counter[c]==2'b00)?counter[c]:counter[c]-2'b01;
    c=(counter[c]==1)?c:c+1;
end

assign  pc_wire3_o=(1)?pc_wire3_i:32'dx;
assign  Instruction_o=(1)?Instruction_i:32'dx;

endmodule