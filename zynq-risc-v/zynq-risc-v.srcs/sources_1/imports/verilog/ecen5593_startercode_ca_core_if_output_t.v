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
 *  \brief   Contains module definition of the 'ecen5593_startercode_ca_core_if_output_t' functional unit.
 */

module ecen5593_startercode_ca_core_if_output_t(
    input  wire ACT,
    input  wire s_id_stall_Q,
    input  wire [31:0] s_if_nextpc_Q,
    input  wire [31:0] s_if_pcin_Q,
    output wire r_id_clear_D,
    output wire r_id_clear_WE,
    output wire [31:0] r_id_pc_D,
    output wire r_id_pc_WE,
    output wire r_id_stall_D,
    output wire r_id_stall_WE,
    output wire [31:0] r_pc_D,
    output wire r_pc_WE
);
    // data-path code:
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:91:9
    // r_id_clear.write((int32)(0x0));
    assign r_id_clear_D = 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:91:9
    // r_id_clear.write((int32)(0x0));
    assign r_id_clear_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:90:9
    // r_id_pc.write(s_if_pcin.read());
    assign r_id_pc_D = (ACT == 1'b1) ? s_if_pcin_Q : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:90:9
    // r_id_pc.write(s_if_pcin.read());
    assign r_id_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:92:9
    // r_id_stall.write(s_id_stall.read());
    assign r_id_stall_D = s_id_stall_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:92:9
    // r_id_stall.write(s_id_stall.read());
    assign r_id_stall_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:89:9
    // r_pc.write(((s_id_stall.read()) ? (s_if_pcin.read()) : (s_if_nextpc.read())));
    assign r_pc_D = (ACT == 1'b1) ? ((s_id_stall_Q) ? s_if_pcin_Q : s_if_nextpc_Q) : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe1_if.codal:89:9
    // r_pc.write(((s_id_stall.read()) ? (s_if_pcin.read()) : (s_if_nextpc.read())));
    assign r_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // ecen5593_startercode_ca_core_if_output_t
