`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2020 09:19:16 PM
// Design Name: 
// Module Name: fulladder
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


module fulladder #(parameter N = 8)(
  input logic [N-1:0] a, b,
  input logic cin,
  output logic [N-1:0] s,
  output logic cout);
  assign {cout, s} = a + b + cin;
endmodule
