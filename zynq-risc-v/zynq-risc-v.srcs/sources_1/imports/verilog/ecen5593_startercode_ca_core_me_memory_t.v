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
 *  \brief   Contains module definition of the 'ecen5593_startercode_ca_core_me_memory_t' functional unit.
 */

module ecen5593_startercode_ca_core_me_memory_t(
    input  wire ACT,
    input  wire [31:0] ldst_HRDATA,
    input  wire ldst_HREADY,
    input  wire ldst_HRESP,
    input  wire [1:0] r_me_alu_Q,
    input  wire [3:0] r_me_memop_Q,
    input  wire [31:0] r_me_wtdat_Q,
    input  wire [31:0] s_me_decoded_data_Q,
    input  wire s_wb_stall_Q,
    output wire [31:0] ldst_HWDATA,
    output wire [31:0] s_me_decoded_data_D,
    output wire [31:0] s_me_mem_result_D,
    output wire s_me_stall_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire [31:0] codasip_tmp_var_0;
    // signal/wire
    wire codasip_tmp_var_1;
    // signal/wire
    wire [1:0] codasip_tmp_var_2;
    // signal/wire
    wire [3:0] codasip_tmp_var_3;
    // signal/wire
    wire codasip_tmp_var_4;
    // signal/wire
    wire data_ready_B0;
    // signal/wire
    wire data_response_B0;
    // signal/wire
    wire [31:0] load_data_temp_B0;
    // signal/wire
    wire [31:0] s_me_decoded_data_D_ACT_wire;
    // signal/wire
    wire [31:0] s_me_mem_result_D_ACT_wire;
    // signal/wire
    wire s_me_stall_D_ACT_wire;

    // additional declarations:
    wire signed [31:0] tmp_codasip_conv_STATIC_CAST_120_1;
    wire signed [31:0] tmp_codasip_conv_STATIC_CAST_147_2;

    // conversions for data-path:
    assign tmp_codasip_conv_STATIC_CAST_120_1 = $signed(s_me_decoded_data_Q[7:0]);
    assign tmp_codasip_conv_STATIC_CAST_147_2 = $signed(s_me_decoded_data_Q[15:0]);
    // data-path code:
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:84:24
    // codasip_tmp_var_1.write((bool)(r_me_memop.read() == (uint4)(0)));
    assign codasip_tmp_var_1 = (r_me_memop_Q == 4'h0);
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:92:13
    assign data_response_B0 =
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:86:13
        // data_response.write((int32)(0x0));
        codasip_tmp_var_1 ? 1'b0 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:92:13
        // ldst.transport((uint3)(0x1), data_ready, data_response, load_data_temp, r_me_wtdat.read() ...
        ldst_HRESP;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:92:13
    assign data_ready_B0 =
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:87:13
        // data_ready.write((int32)(0x1));
        codasip_tmp_var_1 ? 1'b1 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:92:13
        // ldst.transport((uint3)(0x1), data_ready, data_response, load_data_temp, r_me_wtdat.read() ...
        ldst_HREADY;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:92:13
    // ldst.transport((uint3)(0x1), data_ready, data_response, load_data_temp, r_me_wtdat.read());
    assign load_data_temp_B0 = (!codasip_tmp_var_1) ? ldst_HRDATA : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:93:66
    // codasip_tmp_var_2.write(((uint2)(r_me_alu.read())));
    assign codasip_tmp_var_2 = (!codasip_tmp_var_1) ? r_me_alu_Q : 2'h0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:93:50
    assign codasip_tmp_var_0 =
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:93:50
        // codasip_tmp_var_0.write((uint24)(0) :: (load_data_temp.read())[31 .. 24]);
        (codasip_tmp_var_2 == 2'h3) ? {24'h000000, load_data_temp_B0[31:24]} :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:93:50
        // codasip_tmp_var_0.write((load_data_temp.read()));
        ((codasip_tmp_var_2 == 2'h0) && (!codasip_tmp_var_1)) ? load_data_temp_B0 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:93:50
        // codasip_tmp_var_0.write((uint8)(0) :: (load_data_temp.read())[31 .. 8]);
        (codasip_tmp_var_2 == 2'h1) ? {8'h00, load_data_temp_B0[31:8]} :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:93:50
        // codasip_tmp_var_0.write((uint16)(0) :: (load_data_temp.read())[31 .. 16]);
        (codasip_tmp_var_2 == 2'h2) ? {16'h0000, load_data_temp_B0[31:16]} : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:97:17
    // codasip_tmp_var_3.write(r_me_memop.read());
    assign codasip_tmp_var_3 = r_me_memop_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:111:17
    assign s_me_mem_result_D_ACT_wire =
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:99:17
        // s_me_mem_result.write((int32)((int8)(s_me_decoded_data.read())));
        (codasip_tmp_var_3 == 4'h5) ? $unsigned(tmp_codasip_conv_STATIC_CAST_120_1) :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:102:17
        // s_me_mem_result.write((uint32)((uint8)(s_me_decoded_data.read())));
        (codasip_tmp_var_3 == 4'h4) ? {{24{1'b0}}, s_me_decoded_data_Q[7:0]} :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:105:17
        // s_me_mem_result.write((int32)((int16)(s_me_decoded_data.read())));
        (codasip_tmp_var_3 == 4'h7) ? $unsigned(tmp_codasip_conv_STATIC_CAST_147_2) :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:108:17
        // s_me_mem_result.write((int32)((uint16)(s_me_decoded_data.read())));
        (codasip_tmp_var_3 == 4'h6) ? $unsigned($signed({{16{1'b0}}, s_me_decoded_data_Q[15:0]})) :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:111:17
        // s_me_mem_result.write((int32)(s_me_decoded_data.read()));
        (codasip_tmp_var_3 == 4'h8) ? $unsigned($signed(s_me_decoded_data_Q)) : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:116:52
    // codasip_tmp_var_4.write((bool)((data_response.read() == (uint1)(0) && data_ready.read() == (u ...
    assign codasip_tmp_var_4 = (((data_response_B0 == 1'b0) && (data_ready_B0 == 1'b0)) || s_wb_stall_Q);
    assign s_me_decoded_data_D_ACT_wire =
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:88:13
        // s_me_decoded_data.write((int32)(0x0));
        codasip_tmp_var_1 ? 32'h00000000 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:93:13
        // s_me_decoded_data.write(codasip_tmp_var_0.read());
        codasip_tmp_var_0;
    assign s_me_stall_D_ACT_wire =
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:119:13
        // s_me_stall.write((int32)(0x1));
        codasip_tmp_var_4 ? 1'b1 :
        // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:122:13
        // s_me_stall.write((int32)(0x0));
        1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:92:13
    // ldst.transport((uint3)(0x1), data_ready, data_response, load_data_temp, r_me_wtdat.read());
    assign ldst_HWDATA = r_me_wtdat_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:93:13
    assign s_me_decoded_data_D = (ACT == 1'b1) ? s_me_decoded_data_D_ACT_wire : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:111:17
    assign s_me_mem_result_D = (ACT == 1'b1) ? s_me_mem_result_D_ACT_wire : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:122:13
    assign s_me_stall_D = (ACT == 1'b1) ? s_me_stall_D_ACT_wire : 1'b0;
endmodule // ecen5593_startercode_ca_core_me_memory_t
