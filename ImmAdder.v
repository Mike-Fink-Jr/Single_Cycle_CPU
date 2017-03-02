`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mike Fink 
// 
// Create Date: 11/27/2016 05:34:09 PM
// Design Name: 
// Module Name: ImmAdder
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


module ImmAdder(pc, imm, one);

input [31:0] pc, imm;
output reg [31:0] one;

always @(*)
begin
    one = pc + imm;
end
endmodule
