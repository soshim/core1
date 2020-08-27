`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2020 09:29:44 PM
// Design Name: 
// Module Name: alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_tb();
  logic clk, reset;

  logic [31:0] a, b;
  logic [2:0] f;
  logic [31:0] y;
  logic zero;

  logic [31:0] vectornum, errors;
  logic [103:0] testvectors[100:0];
  logic [31:0] yexpected;
  logic zeroexpected;

  alu alu(a, b, f, y, zero);

  always
    begin
      clk = 1; #5; clk = 0; #5;
    end

  initial
    begin
      $readmemh("alu.tv", testvectors);
      vectornum = 0; errors = 0;
      reset = 1; #27; reset = 0;
    end

  always @(posedge clk)
    begin
      #1;
      f = testvectors[vectornum][102:100];
      a = testvectors[vectornum][99:68];
      b = testvectors[vectornum][67:36];
      yexpected = testvectors[vectornum][35:4];
      zeroexpected = testvectors[vectornum][1:0];
    end

  always @(negedge clk)
    if (~reset) begin
      if ({y, zero} != {yexpected, zeroexpected}) begin
        $display("Error: inputs = %h", {f, a, b});
        $display(" outputs = %h (%h expected",
          {y, zero}, {yexpected, zeroexpected});
        errors = errors + 1;
      end
      vectornum = vectornum + 1;
      if (testvectors[vectornum] === 4'bx) begin
        $display("%d tests completed with %d errors",
          vectornum, errors);
        $finish;
      end
    end

endmodule
