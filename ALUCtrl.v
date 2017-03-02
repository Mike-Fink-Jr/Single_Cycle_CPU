`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMPEN 331
// Engineer: Mike Fink
// 
// Create Date: 11/13/2016 03:45:14 PM
// Design Name: 
// Module Name: ALUCtrl
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


module ALUCtrl(ALUOp, Func, Pcsrc, Ctrl, WriteReg, Shift, Regrt, Sext, Aluimm, M2reg, Wmem, Branch, Jal);

input [5:0] ALUOp;
input [5:0] Func;
input [31:0] Branch;
output reg [3:0] Ctrl;
output reg [1:0] Pcsrc;
output reg WriteReg, Shift, Regrt, Sext, Aluimm, M2reg, Wmem, Jal;

always @(ALUOp, Func)
begin
    case(ALUOp)
        6'b000000: begin
            case(Func)
                6'b000000:  begin
                        Ctrl <= 3; //sll
                        Pcsrc <= 2'b00;
                        WriteReg <= 1;
                        Shift <= 1;
                        Regrt <= 0;
                        Aluimm <= 0;
                        M2reg <= 0;
                        Wmem <= 0;
                        Jal <= 0;
                    end
                6'b000010:  begin
                        Ctrl <= 7; //srl
                        Pcsrc <= 2'b00;
                        WriteReg <= 1;
                        Shift <= 1;
                        Regrt <= 0;
                        Aluimm <= 0;
                        M2reg <= 0;
                        Wmem <= 0;
                        Jal <= 0;
                    end
                6'b000011:  begin
                        Ctrl <= 15; //sra
                        Pcsrc <= 2'b00;
                        WriteReg <= 1;
                        Shift <= 1;
                        Regrt <= 0;
                        Aluimm <= 0;
                        M2reg <= 0;
                        Wmem <= 0;
                        Jal <= 0;
                    end
                6'b100000: begin
                        Ctrl <= 0; //add
                        Pcsrc <= 2'b00;
                        WriteReg <= 1;
                        Shift <= 0;
                        Regrt <= 0;
                        Aluimm <= 0;
                        M2reg <= 0;
                        Wmem <= 0;
                        Jal <= 0;
                    end
                6'b100010: begin
                        Ctrl <= 4; //sub
                        Pcsrc <= 2'b00;
                        WriteReg <= 1;
                        Shift <= 0;
                        Regrt <= 0;
                        Aluimm <= 0;
                        M2reg <= 0;
                        Wmem <= 0;
                        Jal <= 0;
                    end
                6'b100100: begin
                        Ctrl <= 1; //and
                        Pcsrc <= 2'b00;
                        WriteReg <= 1;
                        Shift <= 0;
                        Regrt <= 0;
                        Aluimm <= 0;
                        M2reg <= 0;
                        Wmem <= 0;
                        Jal <= 0;
                    end
                6'b100101: begin
                        Ctrl <= 5; //or
                        Pcsrc <= 2'b00;
                        WriteReg <= 1;
                        Shift <= 0;
                        Regrt <= 0;
                        Aluimm <= 0;
                        M2reg <= 0;
                        Wmem <= 0;
                        Jal <= 0;
                    end
                6'b100110: begin
                        Ctrl <= 2; //xor
                        Pcsrc <= 2'b00;
                        WriteReg <= 1;
                        Shift <= 0;
                        Regrt <= 0;
                        Aluimm <= 0;
                        M2reg <= 0;
                        Wmem <= 0;
                        Jal <= 0;
                    end
                6'b001000: begin
                        WriteReg <= 0; //jr
                        Wmem <= 0;
                        Pcsrc <= 2'b10;
                    end
                default: begin
                        Ctrl <= 0; //won't happen
                        Shift <= 0;
                        Pcsrc <= 2'b00;
                        WriteReg <= 0;
                        Regrt <= 0;
                        Sext <= 0;
                        Aluimm <= 0;
                        Jal <= 0;
                    end
            endcase
        end
        6'b001000: begin //addi
            Ctrl <= 0;
            Pcsrc <= 2'b00;
            WriteReg <= 1;
            Shift <= 0;
            Regrt <= 1;
            Aluimm <= 1;
            M2reg <= 0;
            Wmem <= 0;
            Sext <= 1;
            Jal <= 0;
        end
        6'b001100: begin //andi
            Ctrl <= 1;
            Pcsrc <= 2'b00;
            WriteReg <= 1;
            Shift <= 0;
            Regrt <= 1;
            Aluimm <= 1;
            M2reg <= 0;
            Wmem <= 0;
            Sext <= 0;
            Jal <= 0;
        end
        6'b001101: begin //ori
            Ctrl <= 5;
            Pcsrc <= 2'b00;
            WriteReg <= 1;
            Shift <= 0;
            Regrt <= 1;
            Aluimm <= 1;
            M2reg <= 0;
            Wmem <= 0;
            Sext <= 0;
            Jal <= 0;
        end
        6'b001110: begin //xori
            Ctrl <= 2;
            Pcsrc <= 2'b00;
            WriteReg <= 1;
            Shift <= 0;
            Regrt <= 1;
            Aluimm <= 1;
            M2reg <= 0;
            Wmem <= 0;
            Sext <= 0;
            Jal <= 0;
        end
        6'b100011: begin //lw
            Ctrl <= 0;
            Pcsrc <= 2'b00;
            WriteReg <= 1;
            Shift <= 0;
            Regrt <= 1;
            Aluimm <= 1;
            M2reg <= 1;
            Wmem <= 0;
            Sext <= 1;
            Jal <= 0;
        end
        6'b101011: begin //sw
            Ctrl <= 0;
            Pcsrc <= 2'b00;
            WriteReg <= 0;
            Shift <= 0;
            Aluimm <= 1;
            Sext <= 1;
            Wmem <= 1;
        end
        6'b000100: begin //beq
            Ctrl <= 2;
            WriteReg <= 0;
            Shift <= 0;
            Aluimm <= 0;
            Sext <= 1;
            Wmem <= 0;
            if (Branch == 32'd0)
                Pcsrc <= 2'b01;
        end
        6'b000101: begin //bne
            Ctrl <= 2;
            WriteReg <= 0;
            Shift <= 0;
            Aluimm <= 0;
            Sext <= 1;
            Wmem <= 0;
            if (Branch == 32'd0)
                Pcsrc <= 2'b00;
        end
        6'b001111: begin //lui
            Ctrl <= 6;
            Pcsrc <= 2'b00;
            WriteReg <= 1;
            Regrt <= 1;
            M2reg <= 0;
            Aluimm <= 1;
            Wmem <= 0;
            Jal <= 0;
        end
        6'b000010: begin //j
            WriteReg <= 0;
            Wmem <= 0;
            Pcsrc <= 2'b11;
        end
        6'b000011: begin //jal
            WriteReg <= 1;
            Wmem <= 0;
            Pcsrc <= 2'b11;
            Jal <= 1;
        end
        default: begin
            Ctrl <= 15;
            Pcsrc <= 2'b00;
            WriteReg <= 0;
            Shift <= 0;
            Regrt <= 0;
            Sext <= 0;
            Aluimm <= 0;
        end
    endcase
end

always @(Branch)
begin
    if (ALUOp == 6'b000100)
    begin
        if (Branch == 32'd0)
            Pcsrc <= 2'b01;
        else
            Pcsrc <= 2'b00;
    end
    else if (ALUOp == 6'b000101)
    begin
        if (Branch == 32'd0)
            Pcsrc <= 2'b00;
        else
            Pcsrc <= 2'b01;
    end
end
endmodule
