`include "../zynq-risc-v/zynq-risc-v.srcs/sources_1/new/Zybo_Z7_top.v"

`timescale 1 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

module zybo_z7_tb ();
    //----------------------------------------------------------------
    // Wires/Regs
    //----------------------------------------------------------------
    reg clk;
    reg reset;

    //----------------------------------------------------------------
    // Initialization
    //----------------------------------------------------------------
    initial begin
        clk = 1; // Initialize clock to 1
        reset = 0;
    end

    // Setting up waveform
    initial
    begin
        $dumpfile("INST_MEM_output_wave.vcd");
        $dumpvars(0,zybo_z7_tb);
    end

    //----------------------------------------------------------------
    // Clock generation
    //----------------------------------------------------------------
    always #1 clk = ~clk;

    //----------------------------------------------------------------
    // Device Under Test
    //----------------------------------------------------------------

    Zybo_Z7_top dut(
        .sysclk(clk),
        .btn(reset),
    );

    //----------------------------------------------------------------
    // Testbench
    //----------------------------------------------------------------
    initial begin
        $display("\nStarting Test.\n");
        repeat (100) begin
            #1; // Wait for one clock cycle
            if ($time == 50) // Assuming reset after 50 clock cycles
                reset = 1;
        end
        #1; // Wait for one more clock cycle after reset

        $display("\nSuccessfully completed test!\n");
        $finish;
    end

endmodule