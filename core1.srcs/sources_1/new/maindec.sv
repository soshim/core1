`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2020 08:12:34 PM
// Design Name: 
// Module Name: maindec
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


module maindec(
  input logic [5:0] op,
  output logic memtoreg, memwrite,
  output logic branch, bne,
  output logic [1:0] alusrc,
  output logic regdst, regwrite,
  output logic jump,
  output logic [1:0] aluop);

  logic [10:0] controls;

  assign {regwrite, regdst, alusrc, branch, bne, memwrite,
          memtoreg, jump, aluop} = controls;

  always_comb
    case(op)
      6'b000000: controls <= 11'b11000000010;  // RTYPE
      6'b100011: controls <= 11'b10010001000;  // LW
      6'b101011: controls <= 11'b00010010000;  // SW
      6'b000100: controls <= 11'b00001000001;  // BEQ
      6'b001000: controls <= 11'b10010000000;  // ADDI
      6'b000010: controls <= 11'b00000000100;  // J
      6'b001101: controls <= 11'b10100000011;  // ORI
      6'b000101: controls <= 11'b00000100001;  // BNE
      default:   controls <= 11'bxxxxxxxxxxx;  // illegal op
    endcase
endmodule
