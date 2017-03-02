`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 11/13/2016 03:45:14 PM
// Design Name: 
// Module Name: ALU
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


module ALU(Ctrl, In1, In2, Out, Branch);

input [3:0] Ctrl;
input [31:0] In1, In2;
output reg [31:0] Out, Branch;

always @(Ctrl, In1, In2)
begin
    case(Ctrl)
        0: begin
            Out <= In1 + In2;    //add
            Branch <= 0;
           end
        1: begin
            Out <= In2 & In1;    //and
            Branch <= 0;
           end
        2: begin
            Out <= In1 ^ In2;    //xor
            Branch <= In1 ^ In2;
           end
        3: begin
            Out <= In2 << In1;   //sll
            Branch <= 0;
           end
        4: begin
            Out <= In1 - In2;    //sub
            Branch <= 0;
           end
        5: begin
            Out <= In1 | In2;    //or
            Branch <= 0;
           end
        6: begin
            Out[31:16] <= In2[15:0];    //lui
            Out[15:0] <= 16'd0;
            Branch <= 0;
           end
        7: begin
            Out <= In2 >> In1;   //srl
            Branch <= 0;
           end
        8: begin
            Out <= In1 + In2;    //add
            Branch <= 0;
           end
        9: begin
            Out <= In2 & In1;   //and
            Branch <= 0;
           end
        10:begin
            Out <= In1 ^ In2;    //xor
            Branch <= In1 ^ In2;
           end
        12:begin
            Out <= In1 - In2;   //sub
            Branch <= 0;
           end
        13:begin
            Out <= In1 | In2;    //or
            Branch <= 0;
           end
        14:begin
            Out[31:16] <= In2[15:0];    //lui
            Out[15:0] <= 16'd0;
            Branch <= 0;
           end
        15:begin
            Out <= In2 >>> In1;  //sra
            Branch <= 0;
           end
        default: Out <= 0;
    endcase
end
endmodule
