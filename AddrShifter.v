`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 11/27/2016 05:23:13 PM
// Design Name: 
// Module Name: AddrShifter
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


module AddrShifter(addr, addrout);

input [25:0] addr;
output reg [27:0] addrout;

always @(addr)
begin
    addrout = addr << 2;
end
endmodule
