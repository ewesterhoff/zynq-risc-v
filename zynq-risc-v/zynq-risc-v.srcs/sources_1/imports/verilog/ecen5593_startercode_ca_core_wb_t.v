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
 *  \brief   Contains module definition of the 'ecen5593_startercode_ca_core_wb_t' functional unit.
 */

module ecen5593_startercode_ca_core_wb_t(
    input  wire ACT,
    input  wire [31:0] r_wb_alu_Q,
    input  wire [31:0] r_wb_memdat_Q,
    input  wire [31:0] r_wb_pc_Q,
    input  wire [4:0] r_wb_rd_Q,
    input  wire r_wb_regwrite_Q,
    input  wire [1:0] r_wb_rfwtsel_Q,
    input  wire [31:0] s_wb_pc4_Q,
    input  wire [31:0] s_wb_result_Q,
    output wire [31:0] rf_xpr_wrt0_D,
    output wire [4:0] rf_xpr_wrt0_WA,
    output wire rf_xpr_wrt0_WE,
    output wire [31:0] s_wb_pc4_D,
    output wire [31:0] s_wb_result_D,
    output wire s_wb_stall_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire [1:0] codasip_tmp_var_0;
    // signal/wire
    wire codasip_tmp_var_1;
    // signal/wire
    wire [31:0] s_wb_result_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_wb_result_D_ACT_wire_1;

    // data-path code:
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe5_wb.codal:44:17
    // codasip_tmp_var_0.write(r_wb_rfwtsel.read());
    assign codasip_tmp_var_0 = r_wb_rfwtsel_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe5_wb.codal:59:17
    always @(*) begin
        case ( codasip_tmp_var_0 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe5_wb.codal:47:17
            // s_wb_result.write(r_wb_alu.read());
            2'h0: tmp_codasip_conv_mux_s_wb_result_D_ACT_wire_1 = r_wb_alu_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe5_wb.codal:51:17
            // s_wb_result.write(s_wb_pc4.read());
            2'h1: tmp_codasip_conv_mux_s_wb_result_D_ACT_wire_1 = s_wb_pc4_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe5_wb.codal:55:17
            // s_wb_result.write(r_wb_memdat.read());
            2'h2: tmp_codasip_conv_mux_s_wb_result_D_ACT_wire_1 = r_wb_memdat_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe5_wb.codal:59:17
            // s_wb_result.write((int32)(0x0));
            2'h3: tmp_codasip_conv_mux_s_wb_result_D_ACT_wire_1 = 32'h00000000;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_wb_result_D_ACT_wire_1 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_wb_result_D_ACT_wire = tmp_codasip_conv_mux_s_wb_result_D_ACT_wire_1;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe5_wb.codal:71:27
    // codasip_tmp_var_1.write((bool)(r_wb_regwrite.read() && (r_wb_rd.read() != (uint5)(0))));
    assign codasip_tmp_var_1 = (r_wb_regwrite_Q && (r_wb_rd_Q != 5'h00));
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe5_wb.codal:73:13
    // rf_xpr.write(s_wb_result.read(), r_wb_rd.read(), (uint32)(0));
    assign rf_xpr_wrt0_D = s_wb_result_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe5_wb.codal:73:13
    // rf_xpr.write(s_wb_result.read(), r_wb_rd.read(), (uint32)(0));
    assign rf_xpr_wrt0_WA = r_wb_rd_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe5_wb.codal:73:13
    // rf_xpr.write(s_wb_result.read(), r_wb_rd.read(), (uint32)(0));
    assign rf_xpr_wrt0_WE = ((ACT == 1'b1) && codasip_tmp_var_1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe5_wb.codal:38:9
    // s_wb_pc4.write(r_wb_pc.read() + (uint32)(0x4));
    assign s_wb_pc4_D = (ACT == 1'b1) ? (r_wb_pc_Q + 32'h00000004) : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe5_wb.codal:59:17
    assign s_wb_result_D = (ACT == 1'b1) ? s_wb_result_D_ACT_wire : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe5_wb.codal:65:9
    // s_wb_stall.write((int32)(0x0));
    assign s_wb_stall_D = 1'b0;
endmodule // ecen5593_startercode_ca_core_wb_t
