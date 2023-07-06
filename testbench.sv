module testbench();
 logic clk, reset, RegWrite, MemWrite;
 logic[2:0] instruction_A;
 logic[31:0] prode_register_file;
 logic[31:0] prode_data_memory;
 
 PC W1 (clk, reset, RegWrite,
	MemWrite, instruction_A,
	prode_register_file, prode_data_memory);

initial begin
    clk <= 0;    
    forever begin 
    #10; clk <= ~clk;
    end
end
  
initial begin
    reset = 0;
    RegWrite = 0;
    MemWrite = 0;
    #100 
    reset = 1;
    instruction_A = 3'b000;
    #200;
    instruction_A = 3'b001;
    RegWrite = 1;
    #200;
    RegWrite = 0;
    instruction_A = 3'b010;
    MemWrite = 1;
    #200; 
    MemWrite = 0;
    instruction_A = 3'b011;
    RegWrite = 1;
    #200;
    instruction_A = 3'b100;
    #200;
end 
endmodule 