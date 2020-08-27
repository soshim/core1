`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2020 08:51:14 PM
// Design Name: 
// Module Name: mux2
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


module mux4 #(parameter WIDTH = 8)(
  input logic [WIDTH-1:0] d0, d1, d2, d3,
  input logic [1:0] s,
  output logic [WIDTH-1:0] y);

  logic [WIDTH-1:0] low, high;

  mux2 #(WIDTH) lowmux(d0, d1, s[0], low);
  mux2 #(WIDTH) highmux(d2, d3, s[0], high);
  mux2 #(WIDTH) finalmux(low, high, s[1], y);
endmodule
