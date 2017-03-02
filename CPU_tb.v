`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 11/14/2016 12:21:42 AM
// Design Name: 
// Module Name: CPU_tb
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


module CPU_tb();
    reg clk;
    reg rst;
    wire [31:0] AluO;
    wire [31:0] PC;
    wire [31:0] Instr, MemO;
    
    CPU CPU_tb(clk, rst, AluO, PC, Instr, MemO);
    
    initial 
    begin
        clk = 1;
        rst = 0;
        #10 rst = 1;
    end
    
    always #10 clk = ~clk;
    
endmodule
