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
 *  \brief   Contains module definition of the 'ecen5593_startercode_ca_core_ex_t' functional unit.
 */

module ecen5593_startercode_ca_core_ex_t(
    input  wire ACT,
    input  wire [3:0] r_ex_aluop_Q,
    input  wire [1:0] r_ex_alusrc1_Q,
    input  wire r_ex_alusrc2_Q,
    input  wire [2:0] r_ex_brnchop_Q,
    input  wire r_ex_brnchsel_Q,
    input  wire [31:0] r_ex_immed_Q,
    input  wire [31:0] r_ex_pc_Q,
    input  wire [31:0] r_ex_reg1_Q,
    input  wire [31:0] r_ex_reg2_Q,
    input  wire [4:0] r_ex_rs1_Q,
    input  wire [4:0] r_ex_rs2_Q,
    input  wire [31:0] r_me_alu_Q,
    input  wire [4:0] r_me_rd_Q,
    input  wire r_me_regwrite_Q,
    input  wire [4:0] r_wb_rd_Q,
    input  wire r_wb_regwrite_Q,
    input  wire [31:0] s_ex_alu_Q,
    input  wire [31:0] s_ex_brimm_Q,
    input  wire s_ex_fast_zero_Q,
    input  wire [31:0] s_ex_fwd1_Q,
    input  wire [31:0] s_ex_fwd2_Q,
    input  wire [1:0] s_ex_fwdA_Q,
    input  wire [1:0] s_ex_fwdB_Q,
    input  wire [31:0] s_ex_src1_Q,
    input  wire [31:0] s_ex_src2_Q,
    input  wire s_me_stall_Q,
    input  wire [31:0] s_wb_result_Q,
    output wire ex_memory_ACT,
    output wire ex_output_ACT,
    output wire [31:0] s_ex_alu_D,
    output wire [31:0] s_ex_bradd_D,
    output wire [31:0] s_ex_brimm_D,
    output wire s_ex_fast_zero_D,
    output wire [31:0] s_ex_fwd1_D,
    output wire [31:0] s_ex_fwd2_D,
    output wire [1:0] s_ex_fwdA_D,
    output wire [1:0] s_ex_fwdB_D,
    output wire [31:0] s_ex_src1_D,
    output wire [31:0] s_ex_src2_D,
    output wire s_ex_stall_D,
    output wire s_ex_take_branch_D,
    output wire s_ex_zero_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire codasip_tmp_var_0;
    // signal/wire
    wire codasip_tmp_var_1;
    // signal/wire
    wire codasip_tmp_var_10;
    // signal/wire
    wire codasip_tmp_var_11;
    // signal/wire
    wire codasip_tmp_var_13;
    // signal/wire
    wire codasip_tmp_var_2;
    // signal/wire
    wire codasip_tmp_var_3;
    // signal/wire
    wire [1:0] codasip_tmp_var_4;
    // signal/wire
    wire [1:0] codasip_tmp_var_5;
    // signal/wire
    wire [1:0] codasip_tmp_var_6;
    // signal/wire
    wire codasip_tmp_var_7;
    // signal/wire
    wire [2:0] codasip_tmp_var_8;
    // signal/wire
    wire [3:0] codasip_tmp_var_9;
    // signal/wire
    wire [31:0] s_ex_alu_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex_bradd_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex_fwd1_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex_fwd2_D_ACT_wire;
    // signal/wire
    wire [1:0] s_ex_fwdA_D_ACT_wire;
    // signal/wire
    wire [1:0] s_ex_fwdB_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex_src1_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex_src2_D_ACT_wire;
    // signal/wire
    wire s_ex_take_branch_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex_fwd1_D_ACT_wire_1;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex_fwd2_D_ACT_wire_2;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex_src1_D_ACT_wire_3;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex_src2_D_ACT_wire_4;
    // temporary variable for multiplexer, should not be synthesized as register
    reg tmp_codasip_conv_mux_s_ex_take_branch_D_ACT_wire_5;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex_bradd_D_ACT_wire_6;

    // data-path code:
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:44:53
    // codasip_tmp_var_0.write((bool)((r_me_rd.read() == r_ex_rs1.read()) && (r_me_rd.read() != (uin ...
    assign codasip_tmp_var_0 = (((r_me_rd_Q == r_ex_rs1_Q) && (r_me_rd_Q != 5'h00)) && (r_me_regwrite_Q == 1'b1));
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:45:89
    assign s_ex_fwdA_D_ACT_wire =
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:44:84
        // s_ex_fwdA.write((uint1)(0x1));
        codasip_tmp_var_0 ? 2'h1 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:45:89
        // s_ex_fwdA.write((uint2)(0x2));
        codasip_tmp_var_1 ? 2'h2 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:46:14
        // s_ex_fwdA.write((uint1)(0x0));
        2'h0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:45:58
    // codasip_tmp_var_1.write((bool)((r_wb_rd.read() == r_ex_rs1.read()) && (r_wb_rd.read() != (uin ...
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? (((r_wb_rd_Q == r_ex_rs1_Q) && (r_wb_rd_Q != 5'h00)) && (r_wb_regwrite_Q == 1'b1)) : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:48:53
    // codasip_tmp_var_2.write((bool)((r_me_rd.read() == r_ex_rs2.read()) && (r_me_rd.read() != (uin ...
    assign codasip_tmp_var_2 = (((r_me_rd_Q == r_ex_rs2_Q) && (r_me_rd_Q != 5'h00)) && (r_me_regwrite_Q == 1'b1));
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:49:89
    assign s_ex_fwdB_D_ACT_wire =
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:48:84
        // s_ex_fwdB.write((uint1)(0x1));
        codasip_tmp_var_2 ? 2'h1 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:49:89
        // s_ex_fwdB.write((uint2)(0x2));
        codasip_tmp_var_3 ? 2'h2 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:50:14
        // s_ex_fwdB.write((uint1)(0x0));
        2'h0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:49:58
    // codasip_tmp_var_3.write((bool)((r_wb_rd.read() == r_ex_rs2.read()) && (r_wb_rd.read() != (uin ...
    assign codasip_tmp_var_3 = (!codasip_tmp_var_2) ? (((r_wb_rd_Q == r_ex_rs2_Q) && (r_wb_rd_Q != 5'h00)) && (r_wb_regwrite_Q == 1'b1)) : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:56:17
    // codasip_tmp_var_4.write(s_ex_fwdA.read());
    assign codasip_tmp_var_4 = s_ex_fwdA_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:71:17
    always @(*) begin
        case ( codasip_tmp_var_4 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:59:17
            // s_ex_fwd1.write(r_ex_reg1.read());
            2'h0: tmp_codasip_conv_mux_s_ex_fwd1_D_ACT_wire_1 = r_ex_reg1_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:63:17
            // s_ex_fwd1.write(r_me_alu.read());
            2'h1: tmp_codasip_conv_mux_s_ex_fwd1_D_ACT_wire_1 = r_me_alu_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:67:17
            // s_ex_fwd1.write(s_wb_result.read());
            2'h2: tmp_codasip_conv_mux_s_ex_fwd1_D_ACT_wire_1 = s_wb_result_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:71:17
            // s_ex_fwd1.write((int32)(0x0));
            2'h3: tmp_codasip_conv_mux_s_ex_fwd1_D_ACT_wire_1 = 32'h00000000;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_ex_fwd1_D_ACT_wire_1 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_ex_fwd1_D_ACT_wire = tmp_codasip_conv_mux_s_ex_fwd1_D_ACT_wire_1;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:80:17
    // codasip_tmp_var_5.write(s_ex_fwdB.read());
    assign codasip_tmp_var_5 = s_ex_fwdB_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:95:17
    always @(*) begin
        case ( codasip_tmp_var_5 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:83:17
            // s_ex_fwd2.write(r_ex_reg2.read());
            2'h0: tmp_codasip_conv_mux_s_ex_fwd2_D_ACT_wire_2 = r_ex_reg2_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:87:17
            // s_ex_fwd2.write(r_me_alu.read());
            2'h1: tmp_codasip_conv_mux_s_ex_fwd2_D_ACT_wire_2 = r_me_alu_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:91:17
            // s_ex_fwd2.write(s_wb_result.read());
            2'h2: tmp_codasip_conv_mux_s_ex_fwd2_D_ACT_wire_2 = s_wb_result_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:95:17
            // s_ex_fwd2.write((int32)(0x0));
            2'h3: tmp_codasip_conv_mux_s_ex_fwd2_D_ACT_wire_2 = 32'h00000000;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_ex_fwd2_D_ACT_wire_2 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_ex_fwd2_D_ACT_wire = tmp_codasip_conv_mux_s_ex_fwd2_D_ACT_wire_2;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:104:17
    // codasip_tmp_var_6.write(r_ex_alusrc1.read());
    assign codasip_tmp_var_6 = r_ex_alusrc1_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:119:17
    always @(*) begin
        case ( codasip_tmp_var_6 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:107:17
            // s_ex_src1.write(s_ex_fwd1.read());
            2'h0: tmp_codasip_conv_mux_s_ex_src1_D_ACT_wire_3 = s_ex_fwd1_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:111:17
            // s_ex_src1.write((int32)(0x0));
            2'h1: tmp_codasip_conv_mux_s_ex_src1_D_ACT_wire_3 = 32'h00000000;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:115:17
            // s_ex_src1.write(r_ex_pc.read());
            2'h2: tmp_codasip_conv_mux_s_ex_src1_D_ACT_wire_3 = r_ex_pc_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:119:17
            // s_ex_src1.write((int32)(0x0));
            2'h3: tmp_codasip_conv_mux_s_ex_src1_D_ACT_wire_3 = 32'h00000000;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_ex_src1_D_ACT_wire_3 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_ex_src1_D_ACT_wire = tmp_codasip_conv_mux_s_ex_src1_D_ACT_wire_3;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:128:17
    // codasip_tmp_var_7.write(r_ex_alusrc2.read());
    assign codasip_tmp_var_7 = r_ex_alusrc2_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:135:17
    always @(*) begin
        case ( codasip_tmp_var_7 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:131:17
            // s_ex_src2.write(s_ex_fwd2.read());
            1'b0: tmp_codasip_conv_mux_s_ex_src2_D_ACT_wire_4 = s_ex_fwd2_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:135:17
            // s_ex_src2.write(r_ex_immed.read());
            1'b1: tmp_codasip_conv_mux_s_ex_src2_D_ACT_wire_4 = r_ex_immed_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_ex_src2_D_ACT_wire_4 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_ex_src2_D_ACT_wire = tmp_codasip_conv_mux_s_ex_src2_D_ACT_wire_4;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:150:13
    // codasip_tmp_var_8.write(r_ex_brnchop.read());
    assign codasip_tmp_var_8 = r_ex_brnchop_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:158:13
    always @(*) begin
        case ( codasip_tmp_var_8 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:158:13
            // s_ex_take_branch.write((int32)(0x1));
            3'h1: tmp_codasip_conv_mux_s_ex_take_branch_D_ACT_wire_5 = 1'b1;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:152:13
            // s_ex_take_branch.write(!s_ex_fast_zero.read());
            3'h4: tmp_codasip_conv_mux_s_ex_take_branch_D_ACT_wire_5 = (!s_ex_fast_zero_Q);
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:155:13
            // s_ex_take_branch.write(s_ex_fast_zero.read());
            3'h5: tmp_codasip_conv_mux_s_ex_take_branch_D_ACT_wire_5 = s_ex_fast_zero_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:161:13
            // s_ex_take_branch.write((int32)(0x0));
            default: tmp_codasip_conv_mux_s_ex_take_branch_D_ACT_wire_5 = 1'b0;
        endcase
    end
    assign s_ex_take_branch_D_ACT_wire = tmp_codasip_conv_mux_s_ex_take_branch_D_ACT_wire_5;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:165:17
    // codasip_tmp_var_9.write(r_ex_aluop.read());
    assign codasip_tmp_var_9 = r_ex_aluop_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:208:38
    // codasip_tmp_var_10.write((bool)((int32)(s_ex_src1.read()) < (int32)(s_ex_src2.read())));
    assign codasip_tmp_var_10 = (codasip_tmp_var_9 == 4'h6) ? ($signed(s_ex_src1_Q) < $signed(s_ex_src2_Q)) : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:213:44
    assign s_ex_alu_D_ACT_wire =
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:169:17
        // s_ex_alu.write((int32)(0x0));
        (codasip_tmp_var_9 == 4'h0) ? 32'h00000000 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:174:17
        // s_ex_alu.write(s_ex_src1.read() + s_ex_src2.read());
        (codasip_tmp_var_9 == 4'h1) ? (s_ex_src1_Q + s_ex_src2_Q) :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:178:17
        // s_ex_alu.write(s_ex_src1.read() - s_ex_src2.read());
        (codasip_tmp_var_9 == 4'h2) ? (s_ex_src1_Q - s_ex_src2_Q) :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:182:17
        // s_ex_alu.write(s_ex_src1.read() & s_ex_src2.read());
        (codasip_tmp_var_9 == 4'h3) ? (s_ex_src1_Q & s_ex_src2_Q) :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:186:17
        // s_ex_alu.write(s_ex_src1.read() | s_ex_src2.read());
        (codasip_tmp_var_9 == 4'h4) ? (s_ex_src1_Q | s_ex_src2_Q) :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:190:17
        // s_ex_alu.write(s_ex_src1.read() ^ s_ex_src2.read());
        (codasip_tmp_var_9 == 4'h5) ? (s_ex_src1_Q ^ s_ex_src2_Q) :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:195:17
        // s_ex_alu.write(s_ex_src1.read() << (int5)(s_ex_src2.read()));
        (codasip_tmp_var_9 == 4'ha) ? (s_ex_src1_Q << $signed(s_ex_src2_Q[4:0])) :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:199:17
        // s_ex_alu.write(s_ex_src1.read() >> (int5)(s_ex_src2.read()));
        (codasip_tmp_var_9 == 4'h8) ? (s_ex_src1_Q >> $signed(s_ex_src2_Q[4:0])) :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:203:17
        // s_ex_alu.write((int32)(s_ex_src1.read()) >> (int5)(s_ex_src2.read()));
        (codasip_tmp_var_9 == 4'h9) ? $unsigned(($signed(s_ex_src1_Q) >>> $signed(s_ex_src2_Q[4:0]))) :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:208:58
        // s_ex_alu.write((int32)(0x1));
        codasip_tmp_var_10 ? 32'h00000001 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:209:22
        // s_ex_alu.write((int32)(0x0));
        (codasip_tmp_var_9 == 4'h6) ? 32'h00000000 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:213:44
        // s_ex_alu.write((int32)(0x1));
        codasip_tmp_var_11 ? 32'h00000001 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:214:22
        // s_ex_alu.write((int32)(0x0));
        32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:213:31
    // codasip_tmp_var_11.write((bool)(s_ex_src1.read() < s_ex_src2.read()));
    assign codasip_tmp_var_11 = (codasip_tmp_var_9 == 4'h7) ? (s_ex_src1_Q < s_ex_src2_Q) : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:238:17
    // codasip_tmp_var_13.write(r_ex_brnchsel.read());
    assign codasip_tmp_var_13 = r_ex_brnchsel_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:245:17
    always @(*) begin
        case ( codasip_tmp_var_13 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:241:17
            // s_ex_bradd.write(s_ex_brimm.read());
            1'b0: tmp_codasip_conv_mux_s_ex_bradd_D_ACT_wire_6 = s_ex_brimm_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:245:17
            // s_ex_bradd.write(s_ex_alu.read());
            1'b1: tmp_codasip_conv_mux_s_ex_bradd_D_ACT_wire_6 = s_ex_alu_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_ex_bradd_D_ACT_wire_6 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_ex_bradd_D_ACT_wire = tmp_codasip_conv_mux_s_ex_bradd_D_ACT_wire_6;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:258:18
    // ex_memory();
    assign ex_memory_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:263:18
    // ex_output();
    assign ex_output_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:218:17
    assign s_ex_alu_D = (ACT == 1'b1) ? s_ex_alu_D_ACT_wire : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:245:17
    assign s_ex_bradd_D = (ACT == 1'b1) ? s_ex_bradd_D_ACT_wire : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:232:9
    // s_ex_brimm.write(r_ex_pc.read() + r_ex_immed.read());
    assign s_ex_brimm_D = (ACT == 1'b1) ? (r_ex_pc_Q + r_ex_immed_Q) : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:149:5
    // s_ex_fast_zero.write((s_ex_src1.read() == s_ex_src2.read()));
    assign s_ex_fast_zero_D = (ACT == 1'b1) ? (s_ex_src1_Q == s_ex_src2_Q) : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:71:17
    assign s_ex_fwd1_D = (ACT == 1'b1) ? s_ex_fwd1_D_ACT_wire : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:95:17
    assign s_ex_fwd2_D = (ACT == 1'b1) ? s_ex_fwd2_D_ACT_wire : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:46:14
    assign s_ex_fwdA_D = (ACT == 1'b1) ? s_ex_fwdA_D_ACT_wire : 2'h0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:50:14
    assign s_ex_fwdB_D = (ACT == 1'b1) ? s_ex_fwdB_D_ACT_wire : 2'h0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:119:17
    assign s_ex_src1_D = (ACT == 1'b1) ? s_ex_src1_D_ACT_wire : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:135:17
    assign s_ex_src2_D = (ACT == 1'b1) ? s_ex_src2_D_ACT_wire : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:260:9
    // s_ex_stall.write(s_me_stall.read());
    assign s_ex_stall_D = (ACT == 1'b1) ? s_me_stall_Q : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:161:13
    assign s_ex_take_branch_D = (ACT == 1'b1) ? s_ex_take_branch_D_ACT_wire : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:255:9
    // s_ex_zero.write((s_ex_alu.read() == (uint32)(0)));
    assign s_ex_zero_D = (ACT == 1'b1) ? (s_ex_alu_Q == 32'h00000000) : 1'b0;
endmodule // ecen5593_startercode_ca_core_ex_t
