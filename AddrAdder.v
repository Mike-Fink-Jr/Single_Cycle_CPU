`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mike Fink
// 
// Create Date: 11/27/2016 05:55:59 PM
// Design Name: 
// Module Name: AddrAdder
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


module AddrAdder(pc, addr, three);
input [3:0] pc;
input [27:0] addr;
output reg [31:0] three;

always @(*)
begin
    three[31:28] = pc;
    three[27:0] = addr;
end
endmodule
