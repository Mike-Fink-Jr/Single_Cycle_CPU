`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 11/27/2016 04:06:03 PM
// Design Name: 
// Module Name: DestChoose
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


module DestChoose(rd, rt, regrt, dest);

input [4:0] rd;
input [4:0] rt;
input regrt;
output reg [4:0] dest;

always @(*)
begin
    if (regrt)
        dest = rt;
    else
        dest = rd;
end
endmodule
