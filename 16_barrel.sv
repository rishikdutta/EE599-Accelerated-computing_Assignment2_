module bar(input wire[127:0] in, input wire[3:0]sel, output reg[127:0] out);
  reg [7:0] x [0:15];
  reg [7:0] y [0:15];
  reg [7:0] tmp_0 [0:15];
  reg [7:0] tmp_1 [0:15];
  reg [7:0] tmp_2 [0:15];
  //reg tmp;
  genvar i;
  generate
    for(i = 0; i<16; i=i+1) begin:gen1
      assign x[i] = in[i*8+7:i*8];
    end  
  endgenerate
  
  mux s0_0(.in1(x[15]), .in0(x[0]), .sel(sel[0]), .out(tmp_0[0]));
  mux s0_1(.in1(x[0]), .in0(x[1]), .sel(sel[0]), .out(tmp_0[1]));
  mux s0_2(.in1(x[1]), .in0(x[2]), .sel(sel[0]), .out(tmp_0[2]));
  mux s0_3(.in1(x[2]), .in0(x[3]), .sel(sel[0]), .out(tmp_0[3]));
  mux s0_4(.in1(x[3]), .in0(x[4]), .sel(sel[0]), .out(tmp_0[4]));
  mux s0_5(.in1(x[4]), .in0(x[5]), .sel(sel[0]), .out(tmp_0[5]));
  mux s0_6(.in1(x[5]), .in0(x[6]), .sel(sel[0]), .out(tmp_0[6]));
  mux s0_7(.in1(x[6]), .in0(x[7]), .sel(sel[0]), .out(tmp_0[7]));
  mux s0_8(.in1(x[7]), .in0(x[8]), .sel(sel[0]), .out(tmp_0[8]));
  mux s0_9(.in1(x[8]), .in0(x[9]), .sel(sel[0]), .out(tmp_0[9]));
  mux s0_10(.in1(x[9]), .in0(x[10]), .sel(sel[0]), .out(tmp_0[10]));
  mux s0_11(.in1(x[10]), .in0(x[11]), .sel(sel[0]), .out(tmp_0[11]));
  mux s0_12(.in1(x[11]), .in0(x[12]), .sel(sel[0]), .out(tmp_0[12]));
  mux s0_13(.in1(x[12]), .in0(x[13]), .sel(sel[0]), .out(tmp_0[13]));
  mux s0_14(.in1(x[13]), .in0(x[14]), .sel(sel[0]), .out(tmp_0[14]));
  mux s0_15(.in1(x[14]), .in0(x[15]), .sel(sel[0]), .out(tmp_0[15]));
  
  
  mux s1_0(.in1(tmp_0[14]), .in0(tmp_0[0]), .sel(sel[1]), .out(tmp_1[0]));
  mux s1_1(.in1(tmp_0[15]), .in0(tmp_0[1]), .sel(sel[1]), .out(tmp_1[1]));
  mux s1_2(.in1(tmp_0[0]), .in0(tmp_0[2]), .sel(sel[1]), .out(tmp_1[2]));
  mux s1_3(.in1(tmp_0[1]), .in0(tmp_0[3]), .sel(sel[1]), .out(tmp_1[3]));
  mux s1_4(.in1(tmp_0[2]), .in0(tmp_0[4]), .sel(sel[1]), .out(tmp_1[4]));
  mux s1_5(.in1(tmp_0[3]), .in0(tmp_0[5]), .sel(sel[1]), .out(tmp_1[5]));
  mux s1_6(.in1(tmp_0[4]), .in0(tmp_0[6]), .sel(sel[1]), .out(tmp_1[6]));
  mux s1_7(.in1(tmp_0[5]), .in0(tmp_0[7]), .sel(sel[1]), .out(tmp_1[7]));
  mux s1_8(.in1(tmp_0[6]), .in0(tmp_0[8]), .sel(sel[1]), .out(tmp_1[8]));
  mux s1_9(.in1(tmp_0[7]), .in0(tmp_0[9]), .sel(sel[1]), .out(tmp_1[9]));
  mux s1_10(.in1(tmp_0[8]), .in0(tmp_0[10]), .sel(sel[1]), .out(tmp_1[10]));
  mux s1_11(.in1(tmp_0[9]), .in0(tmp_0[11]), .sel(sel[1]), .out(tmp_1[11]));
  mux s1_12(.in1(tmp_0[10]), .in0(tmp_0[12]), .sel(sel[1]), .out(tmp_1[12]));
  mux s1_13(.in1(tmp_0[11]), .in0(tmp_0[13]), .sel(sel[1]), .out(tmp_1[13]));
  mux s1_14(.in1(tmp_0[12]), .in0(tmp_0[14]), .sel(sel[1]), .out(tmp_1[14]));
  mux s1_15(.in1(tmp_0[13]), .in0(tmp_0[15]), .sel(sel[1]), .out(tmp_1[15]));
  
  mux s2_0(.in1(tmp_1[12]), .in0(tmp_1[0]), .sel(sel[2]), .out(tmp_2[0]));
  mux s2_1(.in1(tmp_1[13]), .in0(tmp_1[1]), .sel(sel[2]), .out(tmp_2[1]));
  mux s2_2(.in1(tmp_1[14]), .in0(tmp_1[2]), .sel(sel[2]), .out(tmp_2[2]));
  mux s2_3(.in1(tmp_1[15]), .in0(tmp_1[3]), .sel(sel[2]), .out(tmp_2[3]));
  mux s2_4(.in1(tmp_1[0]), .in0(tmp_1[4]), .sel(sel[2]), .out(tmp_2[4]));
  mux s2_5(.in1(tmp_1[1]), .in0(tmp_1[5]), .sel(sel[2]), .out(tmp_2[5]));
  mux s2_6(.in1(tmp_1[2]), .in0(tmp_1[6]), .sel(sel[2]), .out(tmp_2[6]));
  mux s2_7(.in1(tmp_1[3]), .in0(tmp_1[7]), .sel(sel[2]), .out(tmp_2[7]));
  mux s2_8(.in1(tmp_1[4]), .in0(tmp_1[8]), .sel(sel[2]), .out(tmp_2[8]));
  mux s2_9(.in1(tmp_1[5]), .in0(tmp_1[9]), .sel(sel[2]), .out(tmp_2[9]));
  mux s2_10(.in1(tmp_1[6]), .in0(tmp_1[10]), .sel(sel[2]), .out(tmp_2[10]));
  mux s2_11(.in1(tmp_1[7]), .in0(tmp_1[11]), .sel(sel[2]), .out(tmp_2[11]));
  mux s2_12(.in1(tmp_1[8]), .in0(tmp_1[12]), .sel(sel[2]), .out(tmp_2[12]));
  mux s2_13(.in1(tmp_1[9]), .in0(tmp_1[13]), .sel(sel[2]), .out(tmp_2[13]));
  mux s2_14(.in1(tmp_1[10]), .in0(tmp_1[14]), .sel(sel[2]), .out(tmp_2[14]));
  mux s2_15(.in1(tmp_1[11]), .in0(tmp_1[15]), .sel(sel[2]), .out(tmp_2[15]));
  
  mux s3_0(.in1(tmp_2[8]), .in0(tmp_2[0]), .sel(sel[3]), .out(y[0]));
  mux s3_1(.in1(tmp_2[9]), .in0(tmp_2[1]), .sel(sel[3]), .out(y[1]));
  mux s3_2(.in1(tmp_2[10]), .in0(tmp_2[2]), .sel(sel[3]), .out(y[2]));
  mux s3_3(.in1(tmp_2[11]), .in0(tmp_2[3]), .sel(sel[3]), .out(y[3]));
  mux s3_4(.in1(tmp_2[12]), .in0(tmp_2[4]), .sel(sel[3]), .out(y[4]));
  mux s3_5(.in1(tmp_2[13]), .in0(tmp_2[5]), .sel(sel[3]), .out(y[5]));
  mux s3_6(.in1(tmp_2[14]), .in0(tmp_2[6]), .sel(sel[3]), .out(y[6]));
  mux s3_7(.in1(tmp_2[15]), .in0(tmp_2[7]), .sel(sel[3]), .out(y[7]));
  mux s3_8(.in1(tmp_2[0]), .in0(tmp_2[8]), .sel(sel[3]), .out(y[8]));
  mux s3_9(.in1(tmp_2[1]), .in0(tmp_2[9]), .sel(sel[3]), .out(y[9]));
  mux s3_10(.in1(tmp_2[2]), .in0(tmp_2[10]), .sel(sel[3]), .out(y[10]));
  mux s3_11(.in1(tmp_2[3]), .in0(tmp_2[11]), .sel(sel[3]), .out(y[11]));
  mux s3_12(.in1(tmp_2[4]), .in0(tmp_2[12]), .sel(sel[3]), .out(y[12]));
  mux s3_13(.in1(tmp_2[5]), .in0(tmp_2[13]), .sel(sel[3]), .out(y[13]));
  mux s3_14(.in1(tmp_2[6]), .in0(tmp_2[14]), .sel(sel[3]), .out(y[14]));
  mux s3_15(.in1(tmp_2[7]), .in0(tmp_2[15]), .sel(sel[3]), .out(y[15]));
  
  always @*
    $display(" %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b  ",x[15],x[14],x[13],x[12],x[11],x[10],x[9],x[8],x[7],x[6],x[5],x[4],x[3],x[2],x[1],x[0]);
  
  always @*
    $display("%b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b ",y[15],y[14],y[13],y[12],y[11],y[10],y[9],y[8],y[7],y[6],y[5],y[4],y[3],y[2],y[1],y[0]);
	
	assign out = {y[15],y[14],y[13],y[12],y[11],y[10],y[9],y[8],y[7],y[6],y[5],y[4],y[3],y[2],y[1],y[0]};
  
endmodule
  
  
  

module mux (in0, in1, sel, out);
  input[7:0] in0, in1;
  input sel;
  output[7:0] out;
  reg out;
  assign out = (sel)?in1:in0;
endmodule

