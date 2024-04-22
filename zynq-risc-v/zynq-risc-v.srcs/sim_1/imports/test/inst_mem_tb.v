`include "../../../sources_1/new/Zybo_Z7_top.v"
`include "../../../sources_1/imports/FPGA-SDcard-Reader/sd_fake.v"

//`timescale 100 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

//module zybo_z7_tb ();
//    //----------------------------------------------------------------
//    // Wires/Regs
//    //----------------------------------------------------------------
//    reg clk;
//    reg reset;

//    //----------------------------------------------------------------
//    // Initialization
//    //----------------------------------------------------------------

//    initial begin
//        clk = 1; // Initialize clock to 1
//        reset = 1;
//        $dumpfile("INST_MEM_output_wave.vcd");
//        $dumpvars(0,zybo_z7_tb);
//    end

//    //----------------------------------------------------------------
//    // Clock generation
//    //----------------------------------------------------------------
//    always #1 clk = ~clk;

//    //----------------------------------------------------------------
//    // Device Under Test
//    //----------------------------------------------------------------

//    Zybo_Z7_top dut(
//        .sysclk(clk),
//        .r_btn(reset)
//    );

//    //----------------------------------------------------------------
//    // Testbench
//    //----------------------------------------------------------------
//    initial begin
//        $display("\nStarting Test.\n");
//        repeat (5000) begin
//            #1;
//        end
//        #1; // Wait for one more clock cycle after reset

//        $display("\nSuccessfully completed test!\n");
//        $finish;
//    end

//endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 02:18:43 PM
// Design Name: 
// Module Name: sd_card_tb
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

`timescale 1ns / 1ps

module sd_card_tb();

    // Clock and Reset
    reg clk = 0;
    reg reset = 1;

    // SD Card Interface Signals
    reg sdclk = 0;
    wire [3:0] sddat;
    wire sdcmd;

    // Instantiate the top module
    Zybo_Z7_top zybo_z7_top_inst (
        .clk(clk),
        .reset(reset),
        .sdclk(sdclk),
        .sdcmd(sdcmd),
        .sddat(sddat)
        // Connect other necessary signals
    );

    // Instantiate the SD card fake module
    sd_fake sd_fake_inst (
        .rstn_async(~reset),
        .sdclk(sdclk),
        .sdcmd(sdcmd),
        .sddat(sddat)
        // Connect other signals as required
    );

    // Clock generation
    always #4 clk = ~clk;  // 100MHz clock
    always #10 sdclk = ~sdclk;  // 50MHz clock for SD

    // Initial block to initialize simulation
    initial begin
        // Reset the system
        reset = 1;
        #100;
        reset = 0;
        // Run simulation for a specific time
        #1000;
        $finish;
    end
endmodule

