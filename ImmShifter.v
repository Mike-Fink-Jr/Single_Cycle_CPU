`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 11/27/2016 05:20:34 PM
// Design Name: 
// Module Name: ImmShifter
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


module ImmShifter(imm, immout);

input [31:0] imm;
output reg [31:0] immout;

always @(imm)
begin
    immout = imm << 2;
end
endmodule
