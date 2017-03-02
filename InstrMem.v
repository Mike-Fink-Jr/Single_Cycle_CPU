`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 11/13/2016 03:45:14 PM
// Design Name: 
// Module Name: InstrMem
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


module InstrMem(ReadAddr, Instr);

input [31:0] ReadAddr;
output reg [31:0] Instr;

reg [31:0] instructions [0:31];
integer i_count;

always@(ReadAddr) 
    Instr = instructions[ReadAddr >> 2];  
 
initial
begin
// (pc) label   instruction  
i_count= 0;

instructions[i_count] = 32'h3c010000;    // (00) main:   lui  $1, 0  
i_count= i_count+1;

instructions[i_count] = 32'h34240050;    // (04)         ori  $4, $1, 80  
i_count= i_count+1;

instructions[i_count] = 32'h20050004;    // (08)         addi $5, $0,  4  
i_count= i_count+1;

instructions[i_count] = 32'h0c000018;    // (0c) call:   jal  sum 
i_count= i_count+1;

instructions[i_count] =  32'hac820000;    // (10)         sw   $2, 0($4) 
i_count= i_count+1;

instructions[i_count] =  32'h8c890000;    // (14)         lw   $9, 0($4) 
i_count= i_count+1;

instructions[i_count] =  32'h01244022;    // (18)         sub  $8, $9, $4 
i_count= i_count+1;

instructions[i_count] =  32'h20050003;    // (1c)         addi $5, $0,  3 
i_count= i_count+1;

instructions[i_count] =  32'h20a5ffff;    // (20) loop2:  addi $5, $5, -1 
i_count= i_count+1;

instructions[i_count] =  32'h34a8ffff;    // (24)         ori  $8, $5, 0xffff 
i_count= i_count+1;

instructions[i_count] =  32'h39085555;    // (28)         xori $8, $8, 0x5555 
i_count= i_count+1;

instructions[i_count] =  32'h2009ffff;    // (2c)         addi $9, $0, -1 
i_count= i_count+1;

instructions[i_count] =  32'h312affff;    // (30)         andi $10,$9, 0xffff 
i_count= i_count+1;

instructions[i_count] =  32'h01493025;    // (34)         or   $6, $10, $9 
i_count= i_count+1;

instructions[i_count] =  32'h01494026;    // (38)         xor  $8, $10, $9 
i_count= i_count+1;

instructions[i_count] =  32'h01463824;    // (3c)         and  $7, $10, $6 
i_count= i_count+1;

instructions[i_count] =  32'h10a00001;    // (40)         beq  $5, $0, shift 
i_count= i_count+1;

instructions[i_count] =  32'h08000008;    // (44)         j    loop2  
i_count= i_count+1;

instructions[i_count] = 32'h2005ffff;    // (48) shift:  addi $5, $0, -1  
i_count= i_count+1;

instructions[i_count] = 32'h000543c0;    // (4c)         sll  $8, $5, 15 
i_count= i_count+1;

instructions[i_count] =  32'h00084400;    // (50)         sll  $8, $8, 16 
i_count= i_count+1;

instructions[i_count] =  32'h00084403;    // (54)         sra  $8, $8, 16 
i_count= i_count+1;

instructions[i_count] =  32'h000843c2;    // (58)         srl  $8, $8, 15 
i_count= i_count+1;

instructions[i_count] =  32'h08000017;    // (5c) finish: j    finish 
i_count= i_count+1;

instructions[i_count] =  32'h00004020;    // (60) sum:    add  $8, $0, $0 
i_count= i_count+1;

instructions[i_count] =  32'h8c890000;    // (64) loop:   lw   $9, 0($4) 
i_count= i_count+1;

instructions[i_count] =  32'h20840004;    // (68)         addi $4, $4,  4 
i_count= i_count+1;

instructions[i_count] =  32'h01094020;    // (6c)         add  $8, $8, $9 
i_count= i_count+1;

instructions[i_count] =  32'h20a5ffff;    // (70)         addi $5, $5, -1 
i_count= i_count+1;

instructions[i_count] =  32'h14a0fffb;    // (74)         bne  $5, $0, loop 
i_count= i_count+1;

instructions[i_count] =  32'h00081000;    // (78)         sll  $2, $8, 0 
i_count= i_count+1;

instructions[i_count] =  32'h03e00008;    // (7c)         jr   $31   

end
endmodule

