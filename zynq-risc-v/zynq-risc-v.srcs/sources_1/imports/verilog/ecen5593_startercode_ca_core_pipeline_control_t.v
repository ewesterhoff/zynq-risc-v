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
 *  \brief   Contains module definition of the 'ecen5593_startercode_ca_core_pipeline_control_t' functional unit.
 */

module ecen5593_startercode_ca_core_pipeline_control_t(
    input  wire ACT,
    input  wire s_ex_clear_Q,
    input  wire s_ex_stall_Q,
    input  wire s_id_clear_Q,
    input  wire s_id_stall_Q,
    input  wire s_me_clear_Q,
    input  wire s_me_stall_Q,
    input  wire s_wb_clear_Q,
    input  wire s_wb_stall_Q,
    output wire pipe_EX_CLEAR_D,
    output wire pipe_EX_STALL_D,
    output wire pipe_ID_CLEAR_D,
    output wire pipe_ID_STALL_D,
    output wire pipe_ME_CLEAR_D,
    output wire pipe_ME_STALL_D,
    output wire pipe_WB_CLEAR_D,
    output wire pipe_WB_STALL_D
);
    // type, wire and constant declarations:
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
    wire codasip_tmp_var_6;
    // signal/wire
    wire codasip_tmp_var_7;
    // signal/wire
    wire codasip_tmp_var_8;

    // data-path code:
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:47:13
    // codasip_tmp_var_1.write((uint1)(s_id_stall.read()));
    assign codasip_tmp_var_1 = s_id_stall_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:52:18
    // codasip_tmp_var_2.write((uint1)(s_id_clear.read()));
    assign codasip_tmp_var_2 = (!codasip_tmp_var_1) ? s_id_clear_Q : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:58:13
    // codasip_tmp_var_3.write((uint1)(s_ex_stall.read()));
    assign codasip_tmp_var_3 = s_ex_stall_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:63:18
    // codasip_tmp_var_4.write((uint1)(s_ex_clear.read()));
    assign codasip_tmp_var_4 = (!codasip_tmp_var_3) ? s_ex_clear_Q : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:70:13
    // codasip_tmp_var_5.write((uint1)(s_me_stall.read()));
    assign codasip_tmp_var_5 = s_me_stall_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:75:18
    // codasip_tmp_var_6.write((uint1)(s_me_clear.read()));
    assign codasip_tmp_var_6 = (!codasip_tmp_var_5) ? s_me_clear_Q : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:82:13
    // codasip_tmp_var_7.write((uint1)(s_wb_stall.read()));
    assign codasip_tmp_var_7 = s_wb_stall_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:87:18
    // codasip_tmp_var_8.write((uint1)(s_wb_clear.read()));
    assign codasip_tmp_var_8 = (!codasip_tmp_var_7) ? s_wb_clear_Q : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:65:13
    // pipe.EX.clear();
    assign pipe_EX_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_4) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:60:13
    // pipe.EX.stall();
    assign pipe_EX_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_3) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:54:13
    // pipe.ID.clear();
    assign pipe_ID_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_2) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:49:13
    // pipe.ID.stall();
    assign pipe_ID_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:77:13
    // pipe.ME.clear();
    assign pipe_ME_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_6) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:72:13
    // pipe.ME.stall();
    assign pipe_ME_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_5) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:89:13
    // pipe.WB.clear();
    assign pipe_WB_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_8) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe_control.codal:84:13
    // pipe.WB.stall();
    assign pipe_WB_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_7) ? 1'b1 : 1'b0;
endmodule // ecen5593_startercode_ca_core_pipeline_control_t
