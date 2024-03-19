`include "..\zynq-risc-v\zynq-risc-v.srcs\sources_1\new\Zybo_Z7_top.v"

`timescale 1ns / 1ps

module Zybo_Z7_top_tb;
    
    // Inputs 
    reg sysclk,  // 125 MHz
    reg btn,
    wire [3:0] led,

    wire [7:0] ja, 
    wire [7:0] jc,  
    wire [7:0] jd,
    wire [7:0] je,

    wire [31:0] addr;
    assign addr = (ja << 24) | (jc << 16) | (jd << 8) | (je);

    // Instantiate Unit Under Test (UUT)
    Zybo_Z7_top uut (
        .sysclk(sysclk),
        .btn(btn),
        .led(led),
        .ja(ja)
        .jc(jc)
        .jd(jd)
        .je(je)
    );

    // Setting up waveform
    initial
    begin
        $dumpfile("top_output_wave.vcd");
        $dumpvars(0,stimulus);
    end

    initial
    $monitor($time, PC = %h", addr);

    // Clock Generation
    initial begin
        sysclk = 0;
        forever #4 sysclk = ~sysclk;    // 125 MHz
    end

    // Test Sequence
    initial begin
        // Reset
        btn = 1;
        #10
        btn = 0;

        // grab instructions here

        // Simulation done
        #100
        $finish
    end
endmodule