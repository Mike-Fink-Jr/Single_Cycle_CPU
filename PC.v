`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 11/13/2016 03:45:14 PM
// Design Name: 
// Module Name: PC
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


module PC(in, out, clk, rst);

input [31:0] in;
input clk, rst;
output reg [31:0] out;

always @(posedge clk)
begin
    if (!rst)
        out = 0;
    else
        out = in;
end
endmodule
