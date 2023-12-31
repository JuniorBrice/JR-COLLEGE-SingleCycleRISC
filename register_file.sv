module register_file(input logic clk, reset,
    input logic WE3,
    input logic [4:0] A1,A2,A3,
    input logic [31:0] WD3,
    output logic [31:0] RD1,
    output logic [31:0] RD2,
	 output logic [31:0] probe);

reg[31:0] registers[31:0];

always@(posedge clk or negedge reset)
begin
    if(!reset) begin
        for(int i = 0; i < 32; i++) begin
            registers[i] <= i;
        end
    end
    else begin
		if (WE3==1) 
			begin
				registers[A3] <= WD3;
			end	
			
		end
    end
	assign RD1 = registers[A1];
	assign RD2 = registers[A2];
	assign probe = registers[A3];
endmodule
