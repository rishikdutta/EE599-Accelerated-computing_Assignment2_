
`timescale 1ns/1ps
module tb;
  wire [15:0] c [0:1][0:1] ;
  reg [15:0] a1,a2,b1,b2;
  reg clk,rst;
  
  sys m (clk, rst,a1,a2,b1,b2,c);
  always #10 clk = ~clk;
  initial begin
    $monitor("a1=%b, a2=%b,b1=%b, b2=%b, c11=%b, c12=%b, c21=%b, c22=%b ", a1,a2, b1, b2, c[0][0], c[0][1], c[1][0], c[1][1]);
    rst = 1;
    #10;
    rst = 1;
    a1 = $random; a2 = $random; 
    b1 = $random; b2 = $random;
    
    #50;
    rst = 0;
    a1 = $random; a2 = $random; 
    b1 = $random; b2 = $random;
    
    #50;
    
    $finish;
  end
endmodule
    

   
   