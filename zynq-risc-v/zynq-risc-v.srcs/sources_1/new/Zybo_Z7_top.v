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
    input wire reset,
    output wire [3:0] led,
    inout wire [7:0] ja,
    inout wire [7:0] jc,
    inout wire [7:0] jd,
    inout wire [7:0] je
    );

    // Registers
    reg [31:0] instructions [0:3];
    reg [31:0] current_instr;
    reg [3:0] instr_index;
    reg [31:0] pc;
    reg state;
    reg reg_inst_write_sel;
    reg [1:0] inst_trans;
    
    // Outputs
    wire [31:0] inst_rdata;
    wire inst_ready;
    wire inst_resp;
    
    wire [31:0] inst_addr_out;
    wire [31:0] inst_addr_in;
    
    wire inst_write_sel_out;
    wire inst_write_sel_in;
    
    wire [1:0] inst_trans_in;
    wire [1:0] inst_trans_out;
    
    wire [2:0] inst_burst;
    wire [3:0] inst_prot;
    wire [2:0] inst_size;
    
    wire [31:0] inst_write; 
    wire inst_mast_lock; 
    
    // LED assignment
    assign led[0] = (state == 2'b0);
    assign inst_addr_in = pc;
    assign inst_write = current_instr;
    assign inst_write_sel_in = reg_inst_write_sel;
    assign inst_trans_in = inst_trans;
    
    ecen5593_startercode_ca_top cpu (
    .CLK(sysclk),
    .RST(reset),
    .if_code_HRDATA(inst_rdata),
    .if_code_HREADY(inst_ready),
    .if_code_HRESP(inst_resp),
    .ldst_HRDATA( ),
    .ldst_HREADY( ),
    .ldst_HRESP( ),
    .if_code_HADDR(inst_addr_out),
    .if_code_HBURST(inst_burst),
    .if_code_HMASTLOCK(inst_mast_lock),
    .if_code_HPROT(inst_prot),
    .if_code_HSIZE(inst_size),
    .if_code_HTRANS(inst_trans_out),
    .if_code_HWRITE(inst_write_sel_out),
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
    .HADDR(inst_addr_in),
    .HWDATA(inst_write),
    .HRDATA(inst_rdata),
    .HWRITE(inst_write_sel_in),
    .HSIZE(inst_size),
    .HBURST(inst_burst),
    .HPROT(inst_prot),
    .HTRANS(inst_trans_in),
    .HREADYOUT(inst_ready),
    .HREADY(inst_ready),
    .HRESP(inst_resp)
    );

    // Load instructions from file
    initial begin
        $readmemh("instr.mem", instructions);
        current_instr = 0;
        inst_trans = 2'b10;
        reg_inst_write_sel = 1;
        instr_index = 0;
        pc = 4092;
    end

    // State machine
    always @ (posedge sysclk)
    begin
        case (state)
            2'b0:
                begin
                    reg_inst_write_sel <= 1;
                    inst_trans = 2'b10;
                    // Load instructions from memory
                    if (instr_index < 4) begin
                        // Read instruction into memory
                        current_instr <= instructions[instr_index][31:0];
                        instr_index <= instr_index + 2'b1;
                        pc <= pc + 4;
                    end else begin
                        // All instructions loaded, switch to RUN_STATE
                        state <= 2'b1;
                        reg_inst_write_sel <= 0;
                        pc <= inst_addr_out;
                        current_instr <= 0;
                    end
                end
            2'b1:
                begin
                    reg_inst_write_sel = inst_write_sel_out;
                    pc <= inst_addr_out;
                    inst_trans = inst_trans_out;
                end
            default: state <= 2'b0;
        endcase
    end

endmodule
