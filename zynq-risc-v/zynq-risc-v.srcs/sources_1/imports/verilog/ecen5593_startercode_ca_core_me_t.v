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
 *  \brief   Contains module definition of the 'ecen5593_startercode_ca_core_me_t' functional unit.
 */

module ecen5593_startercode_ca_core_me_t(
    input  wire ACT,
    input  wire [2:0] r_me_brnchop_Q,
    input  wire r_me_zero_Q,
    output wire me_memory_ACT,
    output wire me_output_ACT,
    output wire s_me_pcsrc_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire [2:0] codasip_tmp_var_0;
    // signal/wire
    wire s_me_pcsrc_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg tmp_codasip_conv_mux_s_me_pcsrc_D_ACT_wire_1;

    // data-path code:
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:41:17
    // codasip_tmp_var_0.write(r_me_brnchop.read());
    assign codasip_tmp_var_0 = r_me_brnchop_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:56:17
    always @(*) begin
        case ( codasip_tmp_var_0 )
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:44:17
            // s_me_pcsrc.write((int32)(0x0));
            3'h0: tmp_codasip_conv_mux_s_me_pcsrc_D_ACT_wire_1 = 1'b0;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:52:17
            // s_me_pcsrc.write(~r_me_zero.read());
            3'h2: tmp_codasip_conv_mux_s_me_pcsrc_D_ACT_wire_1 = (~r_me_zero_Q);
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:56:17
            // s_me_pcsrc.write(r_me_zero.read());
            3'h3: tmp_codasip_conv_mux_s_me_pcsrc_D_ACT_wire_1 = r_me_zero_Q;
            // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:60:17
            // s_me_pcsrc.write((int32)(0x0));
            default: tmp_codasip_conv_mux_s_me_pcsrc_D_ACT_wire_1 = 1'b0;
        endcase
    end
    assign s_me_pcsrc_D_ACT_wire = tmp_codasip_conv_mux_s_me_pcsrc_D_ACT_wire_1;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:65:18
    // me_memory();
    assign me_memory_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:68:18
    // me_output();
    assign me_output_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe4_me.codal:60:17
    assign s_me_pcsrc_D = (ACT == 1'b1) ? s_me_pcsrc_D_ACT_wire : 1'b0;
endmodule // ecen5593_startercode_ca_core_me_t
