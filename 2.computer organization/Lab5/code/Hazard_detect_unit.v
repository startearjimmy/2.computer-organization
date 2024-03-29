`timescale 1ns / 1ps
//Subject:     CO project 5 - Pipe Register
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      許騰今
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Hazard_detect_unit(
        instr,
        hazard,
        flush,
    );
					
input [31:0] instr;
input [1:0]  hazard;
input        flush;



assign flush=(hazard!=2'b00)||(instr[5:0]==5'b000001);

endmodule	

// BEQ
// 000 100
// BNE
// 000 101
// BGE
// 000 001
// BGT
// 000 111