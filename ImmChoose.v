`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 11/27/2016 04:54:13 PM
// Design Name: 
// Module Name: ImmChoose
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


module ImmChoose(qb, imm, aluimm, b);
input [31:0] qb, imm;
input aluimm;
output reg [31:0] b;

always @(*)
begin
    if (aluimm)
        b = imm;
    else
        b = qb;
end
endmodule
