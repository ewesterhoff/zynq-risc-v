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
 *  \brief   Contains module definition of the 'ecen5593_startercode_ca_core_ex_memory_t' functional unit.
 */

module ecen5593_startercode_ca_core_ex_memory_t(
    input  wire ACT,
    input  wire [3:0] r_ex_memop_Q,
    input  wire [31:0] s_ex_alu_Q,
    input  wire [31:0] s_ex_fwd2_Q,
    input  wire [1:0] s_ex_memsize_Q,
    output wire [31:0] ldst_HADDR,
    output wire [2:0] ldst_HBURST,
    output wire ldst_HMASTLOCK,
    output wire [3:0] ldst_HPROT,
    output wire [2:0] ldst_HSIZE,
    output wire [1:0] ldst_HTRANS,
    output wire ldst_HWRITE,
    output wire [31:0] s_ex_encoded_data_D,
    output wire [1:0] s_ex_memsize_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire [31:0] codasip_tmp_var_0;
    // signal/wire
    wire [3:0] codasip_tmp_var_1;
    // signal/wire
    wire [1:0] codasip_tmp_var_2;
    // signal/wire
    wire op_rw_B0;
    // signal/wire
    wire [1:0] op_type_B0;
    // signal/wire
    wire [1:0] s_ex_memsize_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [1:0] tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1;
    // temporary variable for multiplexer, should not be synthesized as register
    reg tmp_codasip_conv_mux_op_rw_B0_D_2;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [1:0] tmp_codasip_conv_mux_op_type_B0_D_3;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_codasip_tmp_var_0_D_4;

    // data-path code:
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:276:17
    // codasip_tmp_var_1.write(r_ex_memop.read());
    assign codasip_tmp_var_1 = r_ex_memop_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:318:18
    always @(*) begin
        case ( codasip_tmp_var_1 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:280:17
            // s_ex_memsize.write((int32)(0x0));
            4'h0: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h0;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:318:18
            // s_ex_memsize.write((uint3)(0x0));
            4'h1: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h0;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:312:17
            // s_ex_memsize.write((uint3)(0x1));
            4'h2: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h1;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:306:18
            // s_ex_memsize.write((uint3)(0x2));
            4'h3: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h2;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:300:18
            // s_ex_memsize.write((uint3)(0x0));
            4'h4: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h0;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:300:18
            // s_ex_memsize.write((uint3)(0x0));
            4'h5: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h0;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:293:18
            // s_ex_memsize.write((uint3)(0x1));
            4'h6: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h1;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:293:18
            // s_ex_memsize.write((uint3)(0x1));
            4'h7: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h1;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:286:17
            // s_ex_memsize.write((uint3)(0x2));
            4'h8: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h2;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:324:17
            // s_ex_memsize.write((int32)(0x0));
            default: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h0;
        endcase
    end
    assign s_ex_memsize_D_ACT_wire = tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:323:17
    always @(*) begin
        case ( codasip_tmp_var_1 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:279:17
            // op_rw.write((int32)(0x0));
            4'h0: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:317:17
            // op_rw.write((uint1)(0x1));
            4'h1: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b1;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:311:17
            // op_rw.write((uint1)(0x1));
            4'h2: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b1;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:305:17
            // op_rw.write((uint1)(0x1));
            4'h3: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b1;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:299:17
            // op_rw.write((uint1)(0x0));
            4'h4: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:299:17
            // op_rw.write((uint1)(0x0));
            4'h5: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:292:17
            // op_rw.write((uint1)(0x0));
            4'h6: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:292:17
            // op_rw.write((uint1)(0x0));
            4'h7: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:285:17
            // op_rw.write((uint1)(0x0));
            4'h8: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:323:17
            // op_rw.write((int32)(0x0));
            default: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
        endcase
    end
    assign op_rw_B0 = tmp_codasip_conv_mux_op_rw_B0_D_2;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:325:17
    always @(*) begin
        case ( codasip_tmp_var_1 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:281:17
            // op_type.write((uint2)(0x0));
            4'h0: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h0;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:319:17
            // op_type.write((uint2)(0x2));
            4'h1: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:313:17
            // op_type.write((uint2)(0x2));
            4'h2: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:307:17
            // op_type.write((uint2)(0x2));
            4'h3: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:301:17
            // op_type.write((uint2)(0x2));
            4'h4: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:301:17
            // op_type.write((uint2)(0x2));
            4'h5: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:294:17
            // op_type.write((uint2)(0x2));
            4'h6: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:294:17
            // op_type.write((uint2)(0x2));
            4'h7: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:287:17
            // op_type.write((uint2)(0x2));
            4'h8: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:325:17
            // op_type.write((uint2)(0x0));
            default: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h0;
        endcase
    end
    assign op_type_B0 = tmp_codasip_conv_mux_op_type_B0_D_3;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:335:57
    // codasip_tmp_var_2.write(((uint2)(s_ex_alu.read())));
    assign codasip_tmp_var_2 = s_ex_alu_Q[1:0];
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:335:46
    always @(*) begin
        case ( codasip_tmp_var_2 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:335:46
            // codasip_tmp_var_0.write((s_ex_fwd2.read()));
            2'h0: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = s_ex_fwd2_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:335:46
            // codasip_tmp_var_0.write((s_ex_fwd2.read())[23 .. 0] :: (uint8)(0));
            2'h1: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = {s_ex_fwd2_Q[23:0], 8'h00};
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:335:46
            // codasip_tmp_var_0.write((s_ex_fwd2.read())[15 .. 0] :: (uint16)(0));
            2'h2: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = {s_ex_fwd2_Q[15:0], 16'h0000};
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:335:46
            // codasip_tmp_var_0.write((s_ex_fwd2.read())[7 .. 0] :: (uint24)(0));
            2'h3: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = {s_ex_fwd2_Q[7:0], 24'h000000};
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign codasip_tmp_var_0 = tmp_codasip_conv_mux_codasip_tmp_var_0_D_4;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:334:9
    // ldst.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex_alu.read(), s_ex_memsize.read ...
    assign ldst_HADDR = s_ex_alu_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:334:9
    // ldst.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex_alu.read(), s_ex_memsize.read ...
    assign ldst_HBURST = 3'h0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:334:9
    // ldst.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex_alu.read(), s_ex_memsize.read ...
    assign ldst_HMASTLOCK = 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:334:9
    // ldst.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex_alu.read(), s_ex_memsize.read ...
    assign ldst_HPROT = 4'h3;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:334:9
    // ldst.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex_alu.read(), s_ex_memsize.read ...
    assign ldst_HSIZE = {{1{1'b0}}, s_ex_memsize_Q};
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:334:9
    // ldst.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex_alu.read(), s_ex_memsize.read ...
    assign ldst_HTRANS = (ACT == 1'b1) ? op_type_B0 : 2'h0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:334:9
    // ldst.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex_alu.read(), s_ex_memsize.read ...
    assign ldst_HWRITE = op_rw_B0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:335:9
    // s_ex_encoded_data.write(codasip_tmp_var_0.read());
    assign s_ex_encoded_data_D = (ACT == 1'b1) ? codasip_tmp_var_0 : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe3_ex.codal:324:17
    assign s_ex_memsize_D = (ACT == 1'b1) ? s_ex_memsize_D_ACT_wire : 2'h0;
endmodule // ecen5593_startercode_ca_core_ex_memory_t
