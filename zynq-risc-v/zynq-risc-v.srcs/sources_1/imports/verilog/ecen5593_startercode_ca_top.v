/**
 *  Codasip s.r.o.
 * 
 *  CONFIDENTIAL
 * 
 *  Copyright 2024 Codasip s.r.o.
 * 
 *  All Rights Reserved.
 *  This file is part of the Codasip Studio product. No part of the Studio product, including this
 *  file, may be use, copied, modified, or distributed except in accordance with the terms contained
 *  in Codasip license agreement under which you obtained this file.
 * 
 *  \file
 *  \date    2024-04-28
 *  \author  Codasip (c) HW generator
 *  \version 9.4.2
 *  \brief   Contains module definition of the 'ecen5593_startercode_ca_top' ASIP top.
 */

module ecen5593_startercode_ca_top(
    input  wire CLK,
    input  wire RST,
    input  wire [31:0] if_code_HRDATA,
    input  wire if_code_HREADY,
    input  wire if_code_HRESP,
    input  wire [31:0] ldst_HRDATA,
    input  wire ldst_HREADY,
    input  wire ldst_HRESP,
    output wire [31:0] if_code_HADDR,
    output wire [2:0] if_code_HBURST,
    output wire if_code_HMASTLOCK,
    output wire [3:0] if_code_HPROT,
    output wire [2:0] if_code_HSIZE,
    output wire [1:0] if_code_HTRANS,
    output wire if_code_HWRITE,
    output wire [31:0] ldst_HADDR,
    output wire [2:0] ldst_HBURST,
    output wire ldst_HMASTLOCK,
    output wire [3:0] ldst_HPROT,
    output wire [2:0] ldst_HSIZE,
    output wire [1:0] ldst_HTRANS,
    output wire [31:0] ldst_HWDATA,
    output wire ldst_HWRITE
);
    // child instances inside ASIP top:
    // ASIP instance:
    ecen5593_startercode_ca ecen5593_startercode (
        .CLK(CLK),
        .RST(RST),
        .if_code_HRDATA(if_code_HRDATA),
        .if_code_HREADY(if_code_HREADY),
        .if_code_HRESP(if_code_HRESP),
        .ldst_HRDATA(ldst_HRDATA),
        .ldst_HREADY(ldst_HREADY),
        .ldst_HRESP(ldst_HRESP),
        .if_code_HADDR(if_code_HADDR),
        .if_code_HBURST(if_code_HBURST),
        .if_code_HMASTLOCK(if_code_HMASTLOCK),
        .if_code_HPROT(if_code_HPROT),
        .if_code_HSIZE(if_code_HSIZE),
        .if_code_HTRANS(if_code_HTRANS),
        .if_code_HWRITE(if_code_HWRITE),
        .ldst_HADDR(ldst_HADDR),
        .ldst_HBURST(ldst_HBURST),
        .ldst_HMASTLOCK(ldst_HMASTLOCK),
        .ldst_HPROT(ldst_HPROT),
        .ldst_HSIZE(ldst_HSIZE),
        .ldst_HTRANS(ldst_HTRANS),
        .ldst_HWDATA(ldst_HWDATA),
        .ldst_HWRITE(ldst_HWRITE)
    );

endmodule // ecen5593_startercode_ca_top
