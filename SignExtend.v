`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 11/27/2016 04:44:00 PM
// Design Name: 
// Module Name: SignExtend
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


module SignExtend(imm, sext, out);

input [15:0] imm;
input sext;
output reg [31:0] out;

always @(*)
begin
    if (sext)
        out = $signed(imm);
    else
        out = imm;
end
endmodule
