
module sys #(parameter Data_width = 8, size =4)
  (input clk, rst,
   input [127:0] a1 ,
   input [127:0] a2 ,
   input [127:0] a3 ,
   input [127:0] a4 ,
   input [127:0] a5 ,
   input [127:0] a6 ,
   input [127:0] a7 ,
   input [127:0] a8 ,
   input [127:0] a9 ,
   input [127:0] a10 ,
   input [127:0] a11 ,
   input [127:0] a12 ,
   input [127:0] a13 ,
   input [127:0] a14 ,
   input [127:0] a15 ,
   input [127:0] a16 ,
   
   input [127:0] b1 ,
   input [127:0] b2 ,
   input [127:0] b3 ,
   input [127:0] b4 ,
   input [127:0] b5 ,
   input [127:0] b6 ,
   input [127:0] b7 ,
   input [127:0] b8 ,
   input [127:0] b9 ,
   input [127:0] b10 ,
   input [127:0] b11 ,
   input [127:0] b12 ,
   input [127:0] b13 ,
   input [127:0] b14 ,
   input [127:0] b15 ,
   input [127:0] b16 ,   
   
   
   
   
   output wire [15:0] c [0:15][0:15]);
  
  
  wire [23:0] a1_in,a2_in,a3_in,a4_in,a5_in,a6_in,a7_in,a8_in,a9_in,a10_in,a11_in,a12_in,a13_in,a14_in,a15_in,a16_in,
  b1_in,b2_in,b3_in,b4_in,b5_in,b6_in,b7_in,b8_in,b9_in,b10_in,b11_in,b12_in,b13_in,b14_in,b15_in,b16_in ; 
  assign a1_in = a1;
  assign a2_in = {a2,8'b0};
  assign a3_in = {a3,16'b0};
  assign a4_in = {a4,24'b0};
  assign a5_in = {a5,32'b0};
  assign a6_in = {a6,40'b0};
  assign a7_in = {a7,48'b0};
  assign a8_in = {a8,56'b0};
  assign a9_in = {a9,64'b0};
  assign a10_in = {a10,72'b0};
  assign a11_in = {a11,80'b0};
  assign a12_in = {a12,88'b0};
  assign a13_in = {a13,96'b0};
  assign a14_in = {a14,104'b0};
  assign a15_in = {a15,112'b0};
  assign a16_in = {a16,120'b0};
  
  assign b1_in = b1;
  assign b2_in = {b2,8'b0};
  assign b3_in = {b3,16'b0};
  assign b4_in = {b4,24'b0};
  assign b5_in = {b5,32'b0};
  assign b6_in = {b6,40'b0};
  assign b7_in = {b7,48'b0};
  assign b8_in = {b8,56'b0};
  assign b9_in = {b9,64'b0};
  assign b10_in = {b10,72'b0};
  assign b11_in = {b11,80'b0};
  assign b12_in = {b12,88'b0};
  assign b13_in = {b13,96'b0};
  assign b14_in = {b14,104'b0};
  assign b15_in = {b15,112'b0};
  assign b16_in = {b16,120'b0};



  reg [7:0] a [0:16][0:16];
  reg [7:0] b [0:16][0:16];
  
  genvar i,j;
  generate
    for (i=0;i<16;i=i+1)begin:gen1
      for(j=0;j<16;j=j+1)begin:gen2
        //assign a[0][0] = a1_in[(i)*Data_width+7:(i)*Data_width];
        //assign a[1][0] = a2_in[(i)*Data_width+7:(i)*Data_width];
        //assign b[0][0] = b1_in[(j)*Data_width+7:(j)*Data_width];
        //assign b[1][0] = a2_in[(j)*Data_width+7:(j)*Data_width];
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
  always @ (posedge clk or posedge aclr)
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
