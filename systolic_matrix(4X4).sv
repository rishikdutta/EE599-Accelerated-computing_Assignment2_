
module sys #(parameter Data_width = 8, size =4)
  (input clk, rst,
   input [15:0] a1 ,
   input [15:0] a2 ,
   input [15:0] b1 ,
   input [15:0] b2 ,
   output wire [15:0] c [0:1][0:1]);
  
  
  wire [23:0] a1_in,a2_in,b1_in,b2_in; 
  assign a1_in = a1;
  assign a2_in = {a2,8'b0};
  assign b1_in = b1;
  assign b2_in = {b2,8'b0};
  reg [7:0] a [0:2][0:2];
  reg [7:0] b [0:2][0:2];
  
  genvar i,j;
  generate
    for (i=0;i<2;i=i+1)begin:gen1
      for(j=0;j<2;j=j+1)begin:gen2
        assign a[0][0] = a1_in[(i)*Data_width+7:(i)*Data_width];
        assign a[1][0] = a2_in[(i)*Data_width+7:(i)*Data_width];
        assign b[0][0] = b1_in[(j)*Data_width+7:(j)*Data_width];
        assign b[1][0] = a2_in[(j)*Data_width+7:(j)*Data_width];
        mac m(a[i][j], b[j][i], clk, rst, 1'b1, 1'b0, a[i+1][j], b[i][j+1], c[i][j]) ;
      end
    end
  endgenerate
      
endmodule

module mac
(
	input [7:0] dataa,
	input [7:0] datab,
	input clk, aclr, clken, sload,
  	output reg [7:0] a_out, b_out,
  	output reg [15:0] adder_out);

	// Declare registers and wires
  	reg  [15:0] dataa_reg, datab_reg;
	reg  sload_reg;
  	reg [15:0] old_result;
	wire [15:0] multa;
	
	// Store the results of the operations on the current data
	assign multa = dataa_reg * datab_reg;
	
	// Store the value of the accumulation (or clear it)
	always @ (adder_out, sload_reg)
	begin
		if (sload_reg)
			old_result <= 0;
		else
			old_result <= adder_out;
	end
	
	// Clear or update data, as appropriate
  always @ (posedge clk or posedge aclr or dataa or datab)
	begin
		if (aclr)
		begin
			dataa_reg <= 0;
			datab_reg <= 0;
			sload_reg <= 0;
			adder_out <= 0;
          	a_out <= 0 ;
          	b_out <= 0;
		end
		
		else if (clken)
		begin
			dataa_reg <= dataa;
			datab_reg <= datab;
			sload_reg <= sload;
			adder_out <= old_result + multa;
          	a_out <= dataa_reg;
          	b_out <= datab_reg;
          
		end
	end
endmodule
