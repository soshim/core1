`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2020 08:57:59 PM
// Design Name: 
// Module Name: alu
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


module alu(
  input logic [31:0] a, b,
  input logic [2:0] f,
  output logic [31:0] y,
  output logic zero);

  logic [31:0] bb;
  logic [31:0] s;
  logic [31:0] d0, d1, d2, d3;
  logic cout;

  mux2 #(32) bbmux(b, ~b, f[2], bb);
  fulladder #(32) add(a, bb, f[2], s, cout);
  assign d0 = a & bb;
  assign d1 = a | bb;
  assign d2 = s;
  assign d3 = {30'b0, s[31]};
  mux4 #(32) ymux(d0, d1, d2, d3, f[1:0], y);
  assign zero = ~(|y);
endmodule
