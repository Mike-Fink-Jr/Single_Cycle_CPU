`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 11/13/2016 03:45:14 PM
// Design Name: 
// Module Name: Register
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


module Register(rna, rnb, d, wn, we, clrn, clk, qa, qb);

input [4:0] rna;
input [4:0] rnb;
input [31:0] d;
input [4:0] wn;
input we;
input clk, clrn;
output [31:0] qa, qb;
reg [31:0] register [0:31];

assign qa = (rna == 0)? 0 : register[rna];
assign qb = (rnb == 0)? 0 : register[rnb];
integer i;

initial
begin
     register[0] = 32'h00000000;
     register[1] = 32'hA00000AA;
     register[2] = 32'h10000011;
     register[3] = 32'h20000022;
     register[4] = 32'h30000033;
     register[5] = 32'h40000044;
     register[6] = 32'h50000055;
     register[7] = 32'h60000066;
     register[8] = 32'h70000077;
     register[9] = 32'h80000088;
     register[10] = 32'h90000099;
end

always @(posedge clk or posedge clrn)
begin
    if (!clrn)
    begin
        for (i = 0; i < 32; i = i + 1)
             register[i] = 0;
            
             register[0] = 32'h00000000;
             register[1] = 32'hA00000AA;
             register[2] = 32'h10000011;
             register[3] = 32'h20000022;
             register[4] = 32'h30000033;
             register[5] = 32'h40000044;
             register[6] = 32'h50000055;
             register[7] = 32'h60000066;
             register[8] = 32'h70000077;
             register[9] = 32'h80000088;
             register[10] = 32'h90000099;
    end
    else   
        if ((wn != 0) && we)
             register[wn] <= d;
end
endmodule