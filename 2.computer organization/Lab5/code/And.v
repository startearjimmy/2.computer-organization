//Writer:     0510513 許騰今
module And(
               data0_i,
               data1_i,
               data_o
               );

parameter size = 0;			   
			
//I/O ports               
input    data0_i;          
input    data1_i;
output   data_o; 

//Internal Signals
reg      data_o;

//Main function
always @(data0_i or data1_i) begin
    data_o<=data1_i&data0_i;
end

endmodule