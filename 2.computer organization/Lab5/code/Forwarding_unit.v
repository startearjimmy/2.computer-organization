`timescale 1ns / 1ps
//Subject:     CO project 4 - Pipe Register
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      許騰今
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Forwarding_unit(
        rs,
        rt,
        ex_mem,
        mem_wb,
        MUX1_c,
        MUX1_d,
        select1,
        select2
    );
					
input [4:0]  rs;
input [4:0]  rt;
input   ex_mem;
input   mem_wb;
input [4:0]  MUX1_c;
input [4:0]  MUX1_d;
output  select1;
output  select2;

assign select1=((rs==MUX1_c)&&(ex_mem==1'd1))?(2'b10):(((rs==MUX1_d)&&(mem_wb==1'd1))?(2'b01):2'b00);
assign select2=((rt==MUX1_c)&&(ex_mem==1'd1))?(2'b10):(((rt==MUX1_d)&&(mem_wb==1'd1))?(2'b01):2'b00);

endmodule	