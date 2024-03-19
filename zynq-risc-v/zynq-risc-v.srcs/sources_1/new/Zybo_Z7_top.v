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
    
    ecen5593_startercode_ca_top cpu (
    .CLK(sysclk),
    .RST(reset),
    .if_code_HRDATA( ),
    .if_code_HREADY( ),
    .if_code_HRESP( ),
    .ldst_HRDATA( ),
    .ldst_HREADY( ),
    .ldst_HRESP( ),
    .if_code_HADDR( ),
    .if_code_HBURST( ),
    .if_code_HMASTLOCK( ),
    .if_code_HPROT( ),
    .if_code_HSIZE( ),
    .if_code_HTRANS( ),
    .if_code_HWRITE( ),
    .ldst_HADDR( ),
    .ldst_HBURST( ),
    .ldst_HMASTLOCK( ),
    .ldst_HPROT( ),
    .ldst_HSIZE( ),
    .ldst_HTRANS( ),
    .ldst_HWDATA( ),
    .ldst_HWRITE( )
    );
    
endmodule
