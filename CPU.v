`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 11/13/2016 03:45:14 PM
// Design Name: 
// Module Name: CPU
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


module CPU(clk, rst, AluO, PC, Instr, MemO);

input clk; //external
input  rst;
output wire [31:0] Instr;
output wire [31:0] PC;
wire [31:0] PC_choice, PC_added;
output wire [31:0] AluO;
wire [31:0] qa, qb;
wire Shift, WriteReg, Regrt, Sext, Aluimm, M2reg, Wmem, Jal;
wire [1:0] Pcsrc;
wire [3:0] Ctrl;
wire [4:0] Dest_Jal, Dest;
wire [31:0] ALU_a, ALU_b;
wire [31:0] Imm, ImmShifted, ImmAdded;
wire [27:0] Addr;
wire [31:0] AddrAdded;
wire [31:0] Data, Data_Jal;
output wire [31:0] MemO;
wire [31:0] Branch;

//PC
    PC CPUpc(PC_choice, PC, clk, rst);

//InstrMem
    InstrMem CPUinstrmem(PC, Instr);
    
//AdderPC
    AdderPC CPUadderpc(PC, PC_added);

//ALUCtrl
    ALUCtrl CPUaluctrl(Instr[31:26], Instr[5:0], Pcsrc, Ctrl, WriteReg, Shift, Regrt, Sext, Aluimm, M2reg, Wmem, Branch, Jal);
    
//DestChoose
    DestChoose CPUdestchoose(Instr[15:11], Instr[20:16], Regrt, Dest_Jal);

//SignExtend
    SignExtend CPUsignextend(Instr[15:0], Sext, Imm);
    
//JalDestChoose
    JalDestChoose CPUjaldestchoose(Dest_Jal, Jal, Dest);
    
//JalChoose
    JalChoose CPUjalchoose(Data_Jal, PC_added, Jal, Data);

//Register
    Register CPUregister(Instr[25:21], Instr[20:16], Data, Dest, WriteReg, rst, clk, qa, qb);
    
//AddrShifter
    AddrShifter CPUaddrshifter(Instr[25:0], Addr);
    
//ImmChoose
    ImmChoose CPUimmchoose(qb, Imm, Aluimm, ALU_b);
    
//ShiftChoose
    ShiftChoose CPUshiftchoose(qa, Instr[10:6], Shift, ALU_a);
    
//ImmShifter
    ImmShifter CPUimmshifter(Imm, ImmShifted);

//ALU
    ALU CPUalu(Ctrl, ALU_a, ALU_b, AluO, Branch);
    
//AddrAdder
    AddrAdder CPUaddradder(PC_added[31:28], Addr, AddrAdded);
    
//ImmAdder
    ImmAdder CPUimmadder(PC_added, ImmShifted, ImmAdded);
    
//DataMem
    DataMem CPUdatamem(AluO, qb, Wmem, clk, MemO);

//ChoosePC
    ChoosePC CPUchoosepc(Pcsrc, PC_added, ImmAdded, qa, AddrAdded, PC_choice); 
    
//ChooseData
    ChooseData CPUchoosedata(AluO, MemO, M2reg, Data_Jal);

endmodule