`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mike Fink
// 
// Create Date: 11/27/2016 06:16:46 PM
// Design Name: 
// Module Name: DataMem
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


module DataMem(a, din, we, clk, dout);

input [31:0] a, din;
input we, clk;
output [31:0] dout;
reg [31:0] register [0:31];

assign dout = register[a[6:2]];

always @ (posedge clk)         
    if (we) register[a[6:2]] = din; // use word address to write ram
    
integer i;     

initial begin                        // initialize memory         
    for (i = 0; i < 32; i = i + 1)             
        register[i] = 0;         
        // register[word_addr] = data         // (byte_addr)          
    register[5'h14] = 32'h000000a3;       // (50hex)          
    register[5'h15] = 32'h00000027;       // (54hex)          
    register[5'h16] = 32'h00000079;       // (58hex)          
    register[5'h17] = 32'h00000115;       // (5chex)          
    // register[5'h18] should be 0x00000258, the sum stored by sw instruction     
end
endmodule
