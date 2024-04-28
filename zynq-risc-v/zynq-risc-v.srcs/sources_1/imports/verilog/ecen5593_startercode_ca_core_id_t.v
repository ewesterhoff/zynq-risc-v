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
 *  \brief   Contains module definition of the 'ecen5593_startercode_ca_core_id_t' functional unit.
 */

module ecen5593_startercode_ca_core_id_t(
    input  wire ACT,
    input  wire [31:0] if_code_HRDATA,
    input  wire if_code_HREADY,
    input  wire if_code_HRESP,
    input  wire [3:0] r_ex_memop_Q,
    input  wire [4:0] r_ex_rd_Q,
    input  wire r_id_clear_Q,
    input  wire [31:0] r_id_instr_preserved_Q,
    input  wire [31:0] r_id_pc_preserved_Q,
    input  wire r_id_stall_Q,
    input  wire [4:0] r_wb_rd_Q,
    input  wire r_wb_regwrite_Q,
    input  wire [31:0] rf_xpr_src1_Q,
    input  wire [31:0] rf_xpr_src2_Q,
    input  wire s_ex_stall_Q,
    input  wire s_id_fwdA_Q,
    input  wire s_id_fwdB_Q,
    input  wire [31:0] s_id_immedb_Q,
    input  wire [31:0] s_id_immedi_Q,
    input  wire [31:0] s_id_immedj_Q,
    input  wire [31:0] s_id_immeds_Q,
    input  wire [31:0] s_id_immedu_Q,
    input  wire [2:0] s_id_immsel_Q,
    input  wire [31:0] s_id_instr_Q,
    input  wire s_id_loadhaz_Q,
    input  wire [16:0] s_id_opc_Q,
    input  wire [31:0] s_id_rf1_Q,
    input  wire [31:0] s_id_rf2_Q,
    input  wire [4:0] s_id_rs1_Q,
    input  wire [4:0] s_id_rs2_Q,
    input  wire [31:0] s_wb_result_Q,
    output wire dec_ACT,
    output wire [16:0] dec_codasip_param_0,
    output wire id_output_ACT,
    output wire [31:0] r_id_pc_D,
    output wire r_id_pc_WE,
    output wire [4:0] rf_xpr_src1_RA,
    output wire rf_xpr_src1_RE,
    output wire [4:0] rf_xpr_src2_RA,
    output wire rf_xpr_src2_RE,
    output wire s_id_fwdA_D,
    output wire s_id_fwdB_D,
    output wire [31:0] s_id_immed_D,
    output wire [31:0] s_id_immedb_D,
    output wire [31:0] s_id_immedi_D,
    output wire [31:0] s_id_immedj_D,
    output wire [31:0] s_id_immeds_D,
    output wire [31:0] s_id_immedu_D,
    output wire [31:0] s_id_instr_D,
    output wire s_id_loadhaz_D,
    output wire [16:0] s_id_opc_D,
    output wire [4:0] s_id_rd_D,
    output wire [31:0] s_id_reg1_D,
    output wire [31:0] s_id_reg2_D,
    output wire [31:0] s_id_rf1_D,
    output wire [31:0] s_id_rf2_D,
    output wire [4:0] s_id_rs1_D,
    output wire [4:0] s_id_rs2_D,
    output wire s_id_stall_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire cache_ready_B0;
    // signal/wire
    wire cache_response_B0;
    // signal/wire
    wire codasip_tmp_var_0;
    // signal/wire
    wire codasip_tmp_var_1;
    // signal/wire
    wire codasip_tmp_var_2;
    // signal/wire
    wire codasip_tmp_var_3;
    // signal/wire
    wire codasip_tmp_var_4;
    // signal/wire
    wire codasip_tmp_var_5;
    // signal/wire
    wire [2:0] codasip_tmp_var_6;
    // signal/wire
    wire [31:0] id_instr_temp_B0;
    // signal/wire
    wire s_id_fwdA_D_ACT_wire;
    // signal/wire
    wire s_id_fwdB_D_ACT_wire;
    // signal/wire
    wire [31:0] s_id_immed_D_ACT_wire;
    // signal/wire
    wire [31:0] s_id_instr_D_ACT_wire;
    // signal/wire
    wire [31:0] s_id_reg1_D_ACT_wire;
    // signal/wire
    wire [31:0] s_id_reg2_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_id_reg1_D_ACT_wire_1;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_id_reg2_D_ACT_wire_2;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_id_immed_D_ACT_wire_3;
    wire signed [31:0] tmp_codasip_conv_STATIC_CAST_171_4;
    wire signed [31:0] tmp_codasip_conv_STATIC_CAST_157_5;
    wire signed [31:0] tmp_codasip_conv_STATIC_CAST_223_6;
    wire signed [31:0] tmp_codasip_conv_STATIC_CAST_206_7;
    wire signed [31:0] tmp_codasip_conv_STATIC_CAST_194_8;

    // conversions for data-path:
    assign tmp_codasip_conv_STATIC_CAST_171_4 = $signed({s_id_instr_Q[31], s_id_instr_Q[7], s_id_instr_Q[30:25], s_id_instr_Q[11:8]});
    assign tmp_codasip_conv_STATIC_CAST_157_5 = $signed(s_id_instr_Q[31:20]);
    assign tmp_codasip_conv_STATIC_CAST_223_6 = $signed({s_id_instr_Q[31], s_id_instr_Q[19:12], s_id_instr_Q[20], s_id_instr_Q[30:21]});
    assign tmp_codasip_conv_STATIC_CAST_206_7 = $signed({s_id_instr_Q[31:25], s_id_instr_Q[11:7]});
    assign tmp_codasip_conv_STATIC_CAST_194_8 = $signed(s_id_instr_Q[31:12]);
    // data-path code:
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:49:9
    // if_code.transport((uint3)(0x1), cache_ready, cache_response, id_instr_temp);
    assign cache_ready_B0 = if_code_HREADY;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:49:9
    // if_code.transport((uint3)(0x1), cache_ready, cache_response, id_instr_temp);
    assign cache_response_B0 = if_code_HRESP;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:49:9
    // if_code.transport((uint3)(0x1), cache_ready, cache_response, id_instr_temp);
    assign id_instr_temp_B0 = if_code_HRDATA;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:50:12
    // codasip_tmp_var_0.write((uint1)(r_id_clear.read()));
    assign codasip_tmp_var_0 = r_id_clear_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:53:18
    // codasip_tmp_var_1.write((uint1)(r_id_stall.read()));
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? r_id_stall_Q : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:54:13
    assign s_id_instr_D_ACT_wire =
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:51:13
        // s_id_instr.write((uint10)(0x13));
        codasip_tmp_var_0 ? 32'h00000013 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:54:13
        // s_id_instr.write(r_id_instr_preserved.read());
        codasip_tmp_var_1 ? r_id_instr_preserved_Q :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:58:13
        // s_id_instr.write(id_instr_temp.read());
        id_instr_temp_B0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:95:53
    // codasip_tmp_var_2.write((bool)((r_wb_rd.read() == s_id_rs1.read()) && (r_wb_rd.read() != (uin ...
    assign codasip_tmp_var_2 = (((r_wb_rd_Q == s_id_rs1_Q) && (r_wb_rd_Q != 5'h00)) && (r_wb_regwrite_Q == 1'b1));
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:98:53
    // codasip_tmp_var_3.write((bool)((r_wb_rd.read() == s_id_rs2.read()) && (r_wb_rd.read() != (uin ...
    assign codasip_tmp_var_3 = (((r_wb_rd_Q == s_id_rs2_Q) && (r_wb_rd_Q != 5'h00)) && (r_wb_regwrite_Q == 1'b1));
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:105:17
    // codasip_tmp_var_4.write(s_id_fwdA.read());
    assign codasip_tmp_var_4 = s_id_fwdA_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:112:17
    always @(*) begin
        case ( codasip_tmp_var_4 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:108:17
            // s_id_reg1.write(s_id_rf1.read());
            1'b0: tmp_codasip_conv_mux_s_id_reg1_D_ACT_wire_1 = s_id_rf1_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:112:17
            // s_id_reg1.write(s_wb_result.read());
            1'b1: tmp_codasip_conv_mux_s_id_reg1_D_ACT_wire_1 = s_wb_result_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_id_reg1_D_ACT_wire_1 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_id_reg1_D_ACT_wire = tmp_codasip_conv_mux_s_id_reg1_D_ACT_wire_1;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:125:17
    // codasip_tmp_var_5.write(s_id_fwdB.read());
    assign codasip_tmp_var_5 = s_id_fwdB_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:132:17
    always @(*) begin
        case ( codasip_tmp_var_5 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:128:17
            // s_id_reg2.write(s_id_rf2.read());
            1'b0: tmp_codasip_conv_mux_s_id_reg2_D_ACT_wire_2 = s_id_rf2_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:132:17
            // s_id_reg2.write(s_wb_result.read());
            1'b1: tmp_codasip_conv_mux_s_id_reg2_D_ACT_wire_2 = s_wb_result_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_id_reg2_D_ACT_wire_2 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_id_reg2_D_ACT_wire = tmp_codasip_conv_mux_s_id_reg2_D_ACT_wire_2;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:154:17
    // codasip_tmp_var_6.write(s_id_immsel.read());
    assign codasip_tmp_var_6 = s_id_immsel_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:176:17
    always @(*) begin
        case ( codasip_tmp_var_6 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:176:17
            // s_id_immed.write((int32)(0x0));
            3'h0: tmp_codasip_conv_mux_s_id_immed_D_ACT_wire_3 = 32'h00000000;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:156:17
            // s_id_immed.write(s_id_immedi.read());
            3'h1: tmp_codasip_conv_mux_s_id_immed_D_ACT_wire_3 = s_id_immedi_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:160:17
            // s_id_immed.write(s_id_immedb.read());
            3'h2: tmp_codasip_conv_mux_s_id_immed_D_ACT_wire_3 = s_id_immedb_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:164:17
            // s_id_immed.write(s_id_immedu.read());
            3'h3: tmp_codasip_conv_mux_s_id_immed_D_ACT_wire_3 = s_id_immedu_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:168:17
            // s_id_immed.write(s_id_immeds.read());
            3'h4: tmp_codasip_conv_mux_s_id_immed_D_ACT_wire_3 = s_id_immeds_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:172:17
            // s_id_immed.write(s_id_immedj.read());
            3'h5: tmp_codasip_conv_mux_s_id_immed_D_ACT_wire_3 = s_id_immedj_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:180:17
            // s_id_immed.write((int32)(0x0));
            default: tmp_codasip_conv_mux_s_id_immed_D_ACT_wire_3 = 32'h00000000;
        endcase
    end
    assign s_id_immed_D_ACT_wire = tmp_codasip_conv_mux_s_id_immed_D_ACT_wire_3;
    assign s_id_fwdA_D_ACT_wire =
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:95:84
        // s_id_fwdA.write((uint1)(0x1));
        codasip_tmp_var_2 ? 1'b1 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:96:14
        // s_id_fwdA.write((uint1)(0x0));
        1'b0;
    assign s_id_fwdB_D_ACT_wire =
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:98:84
        // s_id_fwdB.write((uint1)(0x1));
        codasip_tmp_var_3 ? 1'b1 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:99:14
        // s_id_fwdB.write((uint1)(0x0));
        1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:151:12
    // dec(s_id_opc.read());
    assign dec_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:151:12
    // dec(s_id_opc.read());
    assign dec_codasip_param_0 = (ACT == 1'b1) ? s_id_opc_Q : 17'h00000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:186:18
    // id_output();
    assign id_output_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:55:13
    // r_id_pc.write(r_id_pc_preserved.read());
    assign r_id_pc_D = ((ACT == 1'b1) && codasip_tmp_var_1) ? r_id_pc_preserved_Q : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:55:13
    // r_id_pc.write(r_id_pc_preserved.read());
    assign r_id_pc_WE = ((ACT == 1'b1) && codasip_tmp_var_1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:79:9
    // s_id_rf1.write(rf_xpr.read(s_id_rs1.read(), (uint32)(0)));
    assign rf_xpr_src1_RA = s_id_rs1_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:79:9
    // s_id_rf1.write(rf_xpr.read(s_id_rs1.read(), (uint32)(0)));
    assign rf_xpr_src1_RE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:80:9
    // s_id_rf2.write(rf_xpr.read(s_id_rs2.read(), (uint32)(1)));
    assign rf_xpr_src2_RA = s_id_rs2_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:80:9
    // s_id_rf2.write(rf_xpr.read(s_id_rs2.read(), (uint32)(1)));
    assign rf_xpr_src2_RE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:96:14
    assign s_id_fwdA_D = (ACT == 1'b1) ? s_id_fwdA_D_ACT_wire : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:99:14
    assign s_id_fwdB_D = (ACT == 1'b1) ? s_id_fwdB_D_ACT_wire : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:180:17
    assign s_id_immed_D = (ACT == 1'b1) ? s_id_immed_D_ACT_wire : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:85:9
    // s_id_immedb.write(((int32)((int12)((s_id_instr.read()[31 .. 31] :: s_id_instr.read()[7 .. 7]  ...
    assign s_id_immedb_D = (ACT == 1'b1) ? $unsigned((tmp_codasip_conv_STATIC_CAST_171_4 << 32'sh00000001)) : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:83:9
    // s_id_immedi.write((int32)((int12)(s_id_instr.read()[31 .. 20])));
    assign s_id_immedi_D = (ACT == 1'b1) ? $unsigned(tmp_codasip_conv_STATIC_CAST_157_5) : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:89:9
    // s_id_immedj.write(((int32)((int20)((s_id_instr.read()[31 .. 31] :: s_id_instr.read()[19 .. 12 ...
    assign s_id_immedj_D = (ACT == 1'b1) ? $unsigned((tmp_codasip_conv_STATIC_CAST_223_6 << 32'sh00000001)) : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:87:9
    // s_id_immeds.write(((int32)((int12)((s_id_instr.read()[31 .. 25] :: s_id_instr.read()[11 .. 7] ...
    assign s_id_immeds_D = (ACT == 1'b1) ? $unsigned(tmp_codasip_conv_STATIC_CAST_206_7) : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:86:9
    // s_id_immedu.write(((int32)((int20)(s_id_instr.read()[31 .. 12]))) << (int32)(0xc));
    assign s_id_immedu_D = (ACT == 1'b1) ? $unsigned((tmp_codasip_conv_STATIC_CAST_194_8 << 32'sh0000000c)) : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:58:13
    assign s_id_instr_D = (ACT == 1'b1) ? s_id_instr_D_ACT_wire : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:143:9
    // s_id_loadhaz.write(((s_id_rs1.read() == r_ex_rd.read()) || (s_id_rs2.read() == r_ex_rd.read() ...
    assign s_id_loadhaz_D = (ACT == 1'b1) ? ((((s_id_rs1_Q == r_ex_rd_Q) || (s_id_rs2_Q == r_ex_rd_Q)) && (r_ex_rd_Q != 5'h00)) && (((((r_ex_memop_Q == 4'h8) || (r_ex_memop_Q == 4'h7)) || (r_ex_memop_Q == 4'h6)) || (r_ex_memop_Q == 4'h5)) || (r_ex_memop_Q == 4'h4))) : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:67:9
    // s_id_opc.write(s_id_instr.read()[31 .. 25] :: s_id_instr.read()[14 .. 12] :: s_id_instr.read( ...
    assign s_id_opc_D = (ACT == 1'b1) ? {s_id_instr_Q[31:25], s_id_instr_Q[14:12], s_id_instr_Q[6:0]} : 17'h00000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:76:9
    // s_id_rd.write(s_id_instr.read()[11 .. 7]);
    assign s_id_rd_D = (ACT == 1'b1) ? s_id_instr_Q[11:7] : 5'h00;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:112:17
    assign s_id_reg1_D = (ACT == 1'b1) ? s_id_reg1_D_ACT_wire : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:132:17
    assign s_id_reg2_D = (ACT == 1'b1) ? s_id_reg2_D_ACT_wire : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:79:9
    // s_id_rf1.write(rf_xpr.read(s_id_rs1.read(), (uint32)(0)));
    assign s_id_rf1_D = (ACT == 1'b1) ? rf_xpr_src1_Q : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:80:9
    // s_id_rf2.write(rf_xpr.read(s_id_rs2.read(), (uint32)(1)));
    assign s_id_rf2_D = (ACT == 1'b1) ? rf_xpr_src2_Q : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:70:9
    // s_id_rs1.write(s_id_instr.read()[19 .. 15]);
    assign s_id_rs1_D = (ACT == 1'b1) ? s_id_instr_Q[19:15] : 5'h00;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:73:9
    // s_id_rs2.write(s_id_instr.read()[24 .. 20]);
    assign s_id_rs2_D = (ACT == 1'b1) ? s_id_instr_Q[24:20] : 5'h00;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:149:9
    // s_id_stall.write(s_ex_stall.read() || s_id_loadhaz.read());
    assign s_id_stall_D = (ACT == 1'b1) ? (s_ex_stall_Q || s_id_loadhaz_Q) : 1'b0;
endmodule // ecen5593_startercode_ca_core_id_t
