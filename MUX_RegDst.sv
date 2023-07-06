module MUX_RegDst(
input logic RegDst,
input logic[4:0]input1, input2,
output logic[4:0] MUX_Dst_out);

assign MUX_Dst_out = RegDst ? input1 : input2;

endmodule
