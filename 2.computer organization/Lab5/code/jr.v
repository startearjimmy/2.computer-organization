//Subject:     CO project 5 - jr
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:     0510513 許騰今
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module jr(
    instr_op31_26_i,
    instr_op5_0_i,
    jr_o
    );
input  [5:0]  instr_op31_26_i;
input  [5:0]  instr_op5_0_i;

output        jr_o;
reg           jr_o;

always@(instr_op31_26_i or instr_op5_0_i) begin
  jr_o<=(instr_op31_26_i==6'b000000)&(instr_op5_0_i==6'b001000);
end

endmodule