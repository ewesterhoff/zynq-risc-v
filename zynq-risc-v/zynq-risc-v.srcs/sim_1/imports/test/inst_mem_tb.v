`include "../../../sources_1/new/Zybo_Z7_top.v"

`timescale 100 ns / 1 ns  // time-unit = 1 ns, precision = 1 ns

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
        reset = 1;
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
        .r_btn(reset)
    );

    //----------------------------------------------------------------
    // Testbench
    //----------------------------------------------------------------
    initial begin
        $display("\nStarting Test.\n");
        repeat (200) begin
            #1; // Wait for one clock cycle
            //if ($time == 100)
                //reset = 1;
            //if ($time == 104)
                //reset = 0;
        end
        #1; // Wait for one more clock cycle after reset

        $display("\nSuccessfully completed test!\n");
        $finish;
    end

endmodule