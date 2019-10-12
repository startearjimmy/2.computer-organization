`timescale 1ns/10ps
module marquee(
  clk,
  rst,
  indataA,
  indataB,
  outdata
  );

input clk;
input rst;  
input  [2:0] indataA;
input  [2:0] indataB;

output [5:0] outdata;


reg [1:0] counter;


// To do:
// Please fulfill the code to make your output waveform the same as our specification
/*always #(CYCLE/2)begin
    clk = ~clk;
end*/

initial begin
  clk = 1'b0;
  rst = 1'b0;
  indataA = 3'd0;
  indataB = 3'd0;
  counter = 2'd0;
  
  //send reset signal 
  @(negedge clk);
  rst = 1'b1;
  @(negedge clk);
  rst = 1'b0;
end
// To do:
// Please add sequential code here:
always@(posedge clk)begin
    if(rst)begin
      indataA = $random();
      indataB = $random();
      counter=0;
    end
    else begin

    end
    indataA = $random();
    indataB = $random();
    counter = counter + 2'd1;
    if(counter ==4) counter =0;
end



// To do:
// please add combinational code here:
always@(*)begin
  case(counter)
    0:
      outdata = indataA | indataB;
    1:
      outdata = indataA & indataB;
    2:
      outdata = indataA ^ indataB;
    3:
      outdata = {indataA,indataB};
  endcase  


end

endmodule
