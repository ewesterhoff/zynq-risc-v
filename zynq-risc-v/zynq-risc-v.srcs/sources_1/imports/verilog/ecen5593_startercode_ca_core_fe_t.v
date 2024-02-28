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
 *  \date    2024-02-27
 *  \author  Codasip (c) HW generator
 *  \version 9.4.2
 *  \brief   Contains module definition of the 'ecen5593_startercode_ca_core_fe_t' functional unit.
 */

module ecen5593_startercode_ca_core_fe_t(
    input  wire ACT,
    input  wire [31:0] r_me_bradd_Q,
    input  wire [31:0] r_pc_Q,
    input  wire [31:0] s_ex_bradd_Q,
    input  wire s_ex_take_branch_Q,
    input  wire s_id_stall_Q,
    input  wire [31:0] s_if_pcin_Q,
    input  wire s_me_pcsrc_Q,
    output wire [31:0] if_code_HADDR,
    output wire [2:0] if_code_HBURST,
    output wire if_code_HMASTLOCK,
    output wire [3:0] if_code_HPROT,
    output wire [2:0] if_code_HSIZE,
    output wire [1:0] if_code_HTRANS,
    output wire if_code_HWRITE,
    output wire if_output_ACT,
    output wire s_ex_clear_D,
    output wire s_id_clear_D,
    output wire [31:0] s_if_nextpc_D,
    output wire [31:0] s_if_pcin_D,
    output wire s_me_clear_D,
    output wire s_wb_clear_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire [31:0] STATEMENT_BIT_CONCATENATE_63_STATEMENT_AST_8_wire;
    // signal/wire
    wire [3:0] cache_hprot_B0;
    // signal/wire
    wire codasip_tmp_var_0;
    // signal/wire
    wire codasip_tmp_var_1;
    // signal/wire
    wire [31:0] s_if_pcin_D_ACT_wire;

    // data-path code:
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:46:10
    // cache_hprot.write((int32)(0x0));
    assign cache_hprot_B0 = 4'h0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:50:24
    // codasip_tmp_var_0.write((bool)(s_me_pcsrc.read() == (uint1)(1)));
    assign codasip_tmp_var_0 = (s_me_pcsrc_Q == 1'b1);
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:54:18
    // codasip_tmp_var_1.write((uint1)(s_ex_take_branch.read()));
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? s_ex_take_branch_Q : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:55:13
    assign s_if_pcin_D_ACT_wire =
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:51:14
        // s_if_pcin.write(r_me_bradd.read());
        codasip_tmp_var_0 ? r_me_bradd_Q :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:55:13
        // s_if_pcin.write(s_ex_bradd.read());
        codasip_tmp_var_1 ? s_ex_bradd_Q :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:59:13
        // s_if_pcin.write(r_pc.read());
        r_pc_Q;
    assign STATEMENT_BIT_CONCATENATE_63_STATEMENT_AST_8_wire = {s_if_pcin_Q[31:2], 2'h0};
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:65:9
    // if_code.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pcin.read()[31 .. 2] :: (uin ...
    assign if_code_HADDR = STATEMENT_BIT_CONCATENATE_63_STATEMENT_AST_8_wire;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:65:9
    // if_code.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pcin.read()[31 .. 2] :: (uin ...
    assign if_code_HBURST = 3'h0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:65:9
    // if_code.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pcin.read()[31 .. 2] :: (uin ...
    assign if_code_HMASTLOCK = 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:65:9
    // if_code.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pcin.read()[31 .. 2] :: (uin ...
    assign if_code_HPROT = cache_hprot_B0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:65:9
    // if_code.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pcin.read()[31 .. 2] :: (uin ...
    assign if_code_HSIZE = 3'h2;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:65:9
    // if_code.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pcin.read()[31 .. 2] :: (uin ...
    assign if_code_HTRANS = (ACT == 1'b1) ? 2'h2 : 2'h0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:65:9
    // if_code.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pcin.read()[31 .. 2] :: (uin ...
    assign if_code_HWRITE = 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:80:18
    // if_output();
    assign if_output_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:74:9
    // s_ex_clear.write((s_me_pcsrc.read() || s_ex_take_branch.read() || s_id_stall.read()));
    assign s_ex_clear_D = (ACT == 1'b1) ? ((s_me_pcsrc_Q || s_ex_take_branch_Q) || s_id_stall_Q) : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:72:9
    // s_id_clear.write((int32)(0x0));
    assign s_id_clear_D = 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:70:9
    // s_if_nextpc.write(s_if_pcin.read() + (uint32)(0x4));
    assign s_if_nextpc_D = (ACT == 1'b1) ? (s_if_pcin_Q + 32'h00000004) : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:59:13
    assign s_if_pcin_D = (ACT == 1'b1) ? s_if_pcin_D_ACT_wire : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:77:9
    // s_me_clear.write(s_me_pcsrc.read());
    assign s_me_clear_D = (ACT == 1'b1) ? s_me_pcsrc_Q : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:75:9
    // s_wb_clear.write((int32)(0x0));
    assign s_wb_clear_D = 1'b0;
endmodule // ecen5593_startercode_ca_core_fe_t
