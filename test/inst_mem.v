/* 
Instruction memory takes in two inputs: A 32-bit Program counter and a 1-bit reset. 
The memory is initialized when reset is 1.
When reset is set to 0, Based on the value of PC, corresponding 32-bit Instruction code is output
*/
module INST_MEM(
    input [31:0] PC,
    input reset,
    output [31:0] Instruction_Code
);
    reg [7:0] Memory [31:0]; // Byte addressable memory with 32 locations

    // Under normal operation (reset = 0), we assign the instr. code, based on PC
    assign Instruction_Code = {Memory[PC+3],Memory[PC+2],Memory[PC+1],Memory[PC]};

    // Initializing memory when reset is one
    always @(reset)
    begin
        if(reset == 1)
        begin
            // addi x1, x0, 1
            // i-type instruction - imm (11:0)_rs1_funct3_rd_opcode
            // 000000000001_00000_000_00001_0010011
            // 0000_0000_0001_0000_0000_0000_1001_0011 -> 0x00100093

            Memory[3] = 8'h00;
            Memory[2] = 8'h10
            Memory[1] = 8'h00
            Memory[0] = 8'h93

            // addi x1, x1, 2
            // i-type instruction - imm (11:0)_rs1_funct3_rd_opcode
            // 000000000010_00001_000_00001_0010011
            // 0000_0000_0010_0000_1000_0000_1001_0011 -> 0x00208093

            Memory[7] = 8'h00;
            Memory[6] = 8'h20
            Memory[5] = 8'h80
            Memory[4] = 8'h93

            // addi x1, x1, 3
            // i-type instruction - imm (11:0)_rs1_funct3_rd_opcode
            // 000000000011_00001_000_00001_0010011
            // 0000_0000_0011_0000_1000_0000_1001_0011 -> 0x00308093

            Memory[7] = 8'h00;
            Memory[6] = 8'h30
            Memory[5] = 8'h80
            Memory[4] = 8'h93

            // addi x2, x1, 1
            // i-type instruction - imm (11:0)_rs1_funct3_rd_opcode
            // 000000000001_00001_000_00010_0010011
            // 0000_0000_0001_0000_1000_0001_0001_0011 -> 0x00108113

            Memory[11] = 8'h00;
            Memory[10] = 8'h10
            Memory[9] = 8'h81
            Memory[8] = 8'h13


        end
    end

endmodule