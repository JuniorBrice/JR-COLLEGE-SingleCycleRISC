module MUX_MemtoReg(
input logic MemtoReg,
input logic[31:0] ALUResult, RD,
output logic[31:0] result);

assign result = MemtoReg ? RD : ALUResult;

endmodule
