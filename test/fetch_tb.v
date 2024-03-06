'include "Project\zynq-risc-v\zynq-risc-v\zynq-risc-v.srcs\sources_1\imports\verilog\ecen5593_startercode_ca_core_fe_t.v" // may have to change to absolute path?

`timescale 1ns / 1ps

module ecen5593_startercode_ca_core_fe_t_tb;

    // Inputs
    reg ACT;
    reg [31:0] r_me_bradd_Q;
    reg [31:0] r_pc_Q;
    reg [31:0] s_ex_bradd_Q;
    reg s_ex_take_branch_Q;
    reg s_id_stall_Q;
    reg [31:0] s_if_pcin_Q;
    reg s_me_pcsrc_Q;

    // Outputs
    wire [31:0] if_code_HADDR;
    wire [2:0] if_code_HBURST;
    wire if_code_HMASTLOCK;
    wire [3:0] if_code_HPROT;
    wire [2:0] if_code_HSIZE;
    wire [1:0] if_code_HTRANS;
    wire if_code_HWRITE;
    wire if_output_ACT;
    wire s_ex_clear_D;
    wire s_id_clear_D;
    wire [31:0] s_if_nextpc_D;
    wire [31:0] s_if_pcin_D;
    wire s_me_clear_D;
    wire s_wb_clear_D;

    // Instantiate the Unit Under Test (UUT)
    ecen5593_startercode_ca_core_fe_t uut (
        .ACT(ACT), 
        .r_me_bradd_Q(r_me_bradd_Q), 
        .r_pc_Q(r_pc_Q), 
        .s_ex_bradd_Q(s_ex_bradd_Q), 
        .s_ex_take_branch_Q(s_ex_take_branch_Q), 
        .s_id_stall_Q(s_id_stall_Q), 
        .s_if_pcin_Q(s_if_pcin_Q), 
        .s_me_pcsrc_Q(s_me_pcsrc_Q), 
        .if_code_HADDR(if_code_HADDR), 
        .if_code_HBURST(if_code_HBURST), 
        .if_code_HMASTLOCK(if_code_HMASTLOCK), 
        .if_code_HPROT(if_code_HPROT), 
        .if_code_HSIZE(if_code_HSIZE), 
        .if_code_HTRANS(if_code_HTRANS), 
        .if_code_HWRITE(if_code_HWRITE), 
        .if_output_ACT(if_output_ACT), 
        .s_ex_clear_D(s_ex_clear_D), 
        .s_id_clear_D(s_id_clear_D), 
        .s_if_nextpc_D(s_if_nextpc_D), 
        .s_if_pcin_D(s_if_pcin_D), 
        .s_me_clear_D(s_me_clear_D), 
        .s_wb_clear_D(s_wb_clear_D)
    );

    initial begin
        // Initialize Inputs
        ACT = 0;
        r_me_bradd_Q = 0;
        r_pc_Q = 0;
        s_ex_bradd_Q = 0;
        s_ex_take_branch_Q = 0;
        s_id_stall_Q = 0;
        s_if_pcin_Q = 0;
        s_me_pcsrc_Q = 0;

        // Monitor signals
        $monitor("Time: %t, ACT: %b, r_pc_Q: %h, s_if_pcin_Q: %h, s_ex_take_branch_Q: %b, s_me_pcsrc_Q: %b, if_code_HADDR: %h, s_if_nextpc_D: %h, s_ex_clear_D: %b, s_me_clear_D: %b",
             $time, ACT, r_pc_Q, s_if_pcin_Q, s_ex_take_branch_Q, s_me_pcsrc_Q, if_code_HADDR, s_if_nextpc_D, s_ex_clear_D, s_me_clear_D);

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        ACT = 1;
        r_pc_Q = 32'h00000004;
        s_if_pcin_Q = 32'h00000008;
        #10; // Wait for 10 ns

        // Test PC increment
        r_pc_Q = 32'h00000008;
        s_if_pcin_Q = 32'h0000000C;

        // Test branch taken
        // s_ex_take_branch_Q = 1;
        // s_ex_bradd_Q = 32'h00000020;
        // #10;

        // Test memory pc source
        // s_me_pcsrc_Q = 1;
        // r_me_bradd_Q = 32'h00000040;
        // #10;

        // Reset the conditions
        // s_ex_take_branch_Q = 0;
        // s_me_pcsrc_Q = 0;
        // #10;

        // Complete the test
        $finish;
    end
      
endmodule
