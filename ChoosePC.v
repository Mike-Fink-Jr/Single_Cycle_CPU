`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 11/15/2016 10:17:48 PM
// Design Name: 
// Module Name: ChoosePC
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


module ChoosePC(Pcsrc, zero, one, two, three, hout);
    input [1:0] Pcsrc;
    input [31:0] zero, one, two, three;
    output reg [31:0] hout;
    
    always @(*)
    begin
        case(Pcsrc)
            2'b00: hout = zero;
            2'b01: hout = one;
            2'b10: hout = two;
            2'b11: hout = three;
        endcase
    end
endmodule