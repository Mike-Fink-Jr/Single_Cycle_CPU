`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 11/27/2016 04:19:05 PM
// Design Name: 
// Module Name: ShiftChoose
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


module ShiftChoose(qa, sa, shift, a);

input [31:0] qa;
input [4:0] sa;
input shift;
output reg [31:0] a;

always @(*)
begin
    if (shift)
        a = sa;
    else
        a = qa;
end
endmodule
