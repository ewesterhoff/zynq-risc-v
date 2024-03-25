`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/29/2024 11:26:54 AM
// Design Name: 
// Module Name: Zybo_Z7_top
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


module Zybo_Z7_top(
    input wire sysclk,  // 125 MHz
    input wire btn,
    output wire [3:0] led,
    inout wire [7:0] ja,
    inout wire [7:0] jc,
    inout wire [7:0] jd,
    inout wire [7:0] je
    );

    // Registers
    reg [31:0] instructions [0:3]; // Assume instructions are 32 bits wide, change size accordingly
    reg [31:0] current_instr;
    reg [1:0] instr_index;
    reg state;

    // LED assignment
    assign led[0] = (state == 2'b0);
    
    // Outputs
    wire [31:0] inst_rdata;
    wire inst_ready;
    wire inst_resp;
    wire [31:0] inst_addr;
    wire [2:0] inst_burst;
    wire [3:0] inst_prot;
    wire [2:0] inst_size;
    wire [1:0] inst_trans;
    wire inst_write;
    
    assign inst_addr = current_instr;
    
    ecen5593_startercode_ca_top cpu (
    .CLK(sysclk),
    .RST(btn),
    .if_code_HRDATA(inst_rdata),
    .if_code_HREADY(inst_ready),
    .if_code_HRESP(inst_resp),
    .ldst_HRDATA( ),
    .ldst_HREADY( ),
    .ldst_HRESP( ),
    .if_code_HADDR(inst_addr),
    .if_code_HBURST(inst_burst),
    .if_code_HMASTLOCK( ),
    .if_code_HPROT(inst_prot),
    .if_code_HSIZE(inst_size),
    .if_code_HTRANS(inst_trans),
    .if_code_HWRITE(inst_write),
    .ldst_HADDR( ),
    .ldst_HBURST( ),
    .ldst_HMASTLOCK( ),
    .ldst_HPROT( ),
    .ldst_HSIZE( ),
    .ldst_HTRANS( ),
    .ldst_HWDATA( ),
    .ldst_HWRITE( )
    );
    
    ahb3lite_sram1rw inst_mem (
    .HRESETn(reset),
    .HCLK(sysclk),
    .HSEL(1'b1),
    .HADDR(inst_addr),
    .HWDATA( ),
    .HRDATA(inst_rdata),
    .HWRITE(inst_write),
    .HSIZE(inst_size),
    .HBURST(inst_burst),
    .HPROT(inst_prot),
    .HTRANS(inst_trans),
    .HREADYOUT( ),
    .HREADY(inst_ready),
    .HRESP(inst_resp)
    );

    // Load instructions from file
    initial
    begin
        // Load values from memory
        $readmemh("mem/instr.mem", instructions);
    end

    // State machine
    always @ (posedge sysclk or negedge btn)
    begin
        if (!btn)
            state <= 2'b0;
        else
            case (state)
                2'b0:
                    begin
                        // Load instructions from memory
                        if (instr_index < 4) begin
                            // Read instruction into memory
                            current_instr = instructions[instr_index][31:0];
                            instr_index <= instr_index + 1;
                        end else begin
                            // All instructions loaded, switch to RUN_STATE
                            state <= 2'b1;
                        end
                    end
                2'b1:
                    begin
                        // Give the CPU the clock signal
                    end
                default: state <= 2'b0;
            endcase
    end

endmodule
