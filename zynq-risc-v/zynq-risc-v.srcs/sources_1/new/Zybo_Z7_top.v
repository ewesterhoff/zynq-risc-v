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
    
    wire reset = btn;
    assign led[0] = reset;
    
    wire inst_rdata;
    wire inst_ready;
    wire inst_resp;
    wire inst_addr;
    wire inst_burst;
    wire inst_prot;
    wire inst_size;
    wire inst_trans;
    wire inst_write;
    
    ecen5593_startercode_ca_top cpu (
    .CLK(sysclk),
    .RST(reset),
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
    
endmodule
