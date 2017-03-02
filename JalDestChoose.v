`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mike Fink
// 
// Create Date: 12/08/2016 10:16:36 PM
// Design Name: 
// Module Name: JalDestChoose
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


module JalDestChoose(DestOld, Jal, DestNew);

input [4:0] DestOld;
input Jal;
output [4:0] DestNew;

assign DestNew = (Jal == 1)? 5'b11111 : DestOld;

endmodule
