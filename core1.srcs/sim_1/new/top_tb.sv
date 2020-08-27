`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2020 07:57:59 AM
// Design Name: 
// Module Name: top_tb
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


module top_tb();
  logic clk;
  logic reset;

  logic [31:0] writedata, dataadr;
  logic memwrite;

  top dut(clk, reset, writedata, dataadr, memwrite);

  initial
    begin
      reset <= 1; #22; reset <= 0;
    end

  always
    begin
      clk <= 1; #5; clk <= 0; #5;
    end

  always @(negedge clk)
    begin
      if (memwrite) begin
        if (dataadr === 84 && writedata === 7) begin
          $display("Simulation succeeded");
          $stop;
        end else if (dataadr !== 80) begin
          $display("Simulation failed");
          $stop;
        end
      end
    end
endmodule
