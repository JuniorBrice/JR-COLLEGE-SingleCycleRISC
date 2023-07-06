module PC(
input logic clk,rst, RegWrite, MemWrite,
input logic[2:0] instruction_A,
output logic[31:0] prode_register_file, prode_data_memory );

logic[31:0] RD;

instruction_memory U1(clk, rst, instruction_A, RD);

logic[4:0] A3;
MUX_RegDst U2 (RD[31], RD[15:11], RD[20:16], A3);

logic[31:0] RD1, RD2, probe, WD3;

register_file U3 (clk, rst, RegWrite, RD[25:21], RD[20:16], A3, WD3, RD1, 
RD2, prode_register_file);

logic[31:0] SignImm, SrcB, ALUResult, ReadData, MemtoReg_out;
sign_extend U4 (RD[15:0],SignImm); 

MUX_ALUSrc U5 (RD[30], SignImm, RD2, SrcB);

ALU U6 (RD1, SrcB, RD[29:27] , ALUResult);

data_memory U7 (clk,rst, MemWrite,  ALUResult, RD2, ReadData, prode_data_memory);

MUX_MemtoReg U8 (RD[26], ALUResult, ReadData, WD3);

endmodule 