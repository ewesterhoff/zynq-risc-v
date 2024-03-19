`include "..\zynq-risc-v\zynq-risc-v.srcs\sources_1\new\Zybo_Z7_top.v"

`timescale 1ns / 1ps

module Zybo_Z7_top_tb;
    
    // Inputs 
    reg sysclk,  // 125 MHz
    reg btn,
    wire [3:0] led,

    wire [7:0] ja,  // not sure if these are even really needed?
    wire [7:0] jc,  
    wire [7:0] jd,
    wire [7:0] je,

    wire [31:0] addr;
    wire [31:0] data;
    assign ja = addr[31:24];
    assign jc = addr[23:16];
    assign jd = addr[15:8];
    assign je = addr[7:0];

    // Instantiate Device Under Test (DUT)
    Zybo_Z7_top dut (
        .sysclk(sysclk),
        .btn(btn),
        .led(led),
        .ja(ja)
        .jc(jc)
        .jd(jd)
        .je(je)
    );

    Inst_Mem_test dut (
        .PC(addr),
        .reset(btn)
        .Instruction_Code(data)
    );

    // Setting up waveform
    initial
    begin
        $dumpfile("top_output_wave.vcd");
        $dumpvars(0,Zybo_Z7_top_tb);
    end

    initial
    $monitor($time, PC = %h, Instruction = %h", addr, data);

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
        #20 addr = 32'd0;
        #20 addr = 32'd4;
        #20 addr = 32'd8;
        #20 addr = 32'd12;


        // Simulation done
        #100
        $finish
    end
endmodule