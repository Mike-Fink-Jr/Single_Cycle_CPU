`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 12/08/2016 09:53:50 PM
// Design Name: 
// Module Name: JalChoose
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


module JalChoose(AluO, PC_added, Jal, Data);

input [31:0] AluO, PC_added;
input Jal;
output [31:0] Data;

assign Data = (Jal == 1)? PC_added : AluO;

endmodule
