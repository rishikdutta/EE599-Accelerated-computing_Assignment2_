`timescale 1ns/1ps
module tb;
  reg [127:0] in;
  reg [2:0] sel;
  wire [127:0] out;
  bar bf (in, sel, out);
  initial begin
    //$monitor( "input = %b", in);
    in = $urandom*9440112344566707837483748374123;
    sel = 010;
    //$finish;
    //in = $urandom*9440112344566707837483748374123;
    sel = 001;
  end
endmodule