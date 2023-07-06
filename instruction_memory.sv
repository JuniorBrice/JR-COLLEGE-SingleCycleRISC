module instruction_memory(
input logic clk,rst,
input logic[2:0] A,
output logic[31:0] RD);

reg[31:0] ins_regs[4:0];

always@(posedge clk or negedge rst) 
begin

    if(!rst) begin
    
        ins_regs[0] <= 0;
		  
        ins_regs[1] <= {6'b010101, 5'b00010, 5'b00001, 16'b0000_0000_0000_0011}; //LW
		  
        ins_regs[2] <= {6'b010100, 5'b01000, 5'b00001, 16'b0000_0000_0000_0001}; //SW
		  
        ins_regs[3] <= {6'b100100, 5'b00011, 5'b00100, 5'b00001, 11'b00000000000}; //ADD
		  
        ins_regs[4] <= {6'b101100, 5'b01010, 5'b01000, 5'b00001, 11'b00000000000}; //SUB
        
    end
    
    else begin
	 
		RD <= ins_regs[A];
		
    end
end
endmodule
