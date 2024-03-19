`define CLK_HALF_PERIOD  5
`timescale 1ns/1ns

module ecen5593_startercode_ca_top_tb ();
    reg clk, reset;

    reg [15:0]inst;
    initial 
    begin
        clk = 0;
        reset = 0;
    end

    always 
    begin
    #CLK_HALF_PERIOD clk = !clk;
    end

    ecen5593_startercode_ca_top dut(

    );

    always
    begin
        inst <= 16'hab_cd;
    end    
endmodule