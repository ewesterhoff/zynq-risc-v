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
 *  \brief   Contains module definition of the 'ecen5593_startercode_ca_core_id_output_t' functional unit.
 */

module ecen5593_startercode_ca_core_id_output_t(
    input  wire ACT,
    input  wire [31:0] r_id_pc_Q,
    input  wire [3:0] s_id_aluop_Q,
    input  wire [1:0] s_id_alusrc1_Q,
    input  wire s_id_alusrc2_Q,
    input  wire [2:0] s_id_brnchop_Q,
    input  wire s_id_brnchsel_Q,
    input  wire [31:0] s_id_immed_Q,
    input  wire [31:0] s_id_instr_Q,
    input  wire [3:0] s_id_memop_Q,
    input  wire [4:0] s_id_rd_Q,
    input  wire [31:0] s_id_reg1_Q,
    input  wire [31:0] s_id_reg2_Q,
    input  wire s_id_regwrite_Q,
    input  wire [1:0] s_id_rfwtsel_Q,
    input  wire [4:0] s_id_rs1_Q,
    input  wire [4:0] s_id_rs2_Q,
    output wire [3:0] r_ex_aluop_D,
    output wire r_ex_aluop_WE,
    output wire [1:0] r_ex_alusrc1_D,
    output wire r_ex_alusrc1_WE,
    output wire r_ex_alusrc2_D,
    output wire r_ex_alusrc2_WE,
    output wire [2:0] r_ex_brnchop_D,
    output wire r_ex_brnchop_WE,
    output wire r_ex_brnchsel_D,
    output wire r_ex_brnchsel_WE,
    output wire [31:0] r_ex_immed_D,
    output wire r_ex_immed_WE,
    output wire [3:0] r_ex_memop_D,
    output wire r_ex_memop_WE,
    output wire [31:0] r_ex_pc_D,
    output wire r_ex_pc_WE,
    output wire [4:0] r_ex_rd_D,
    output wire r_ex_rd_WE,
    output wire [31:0] r_ex_reg1_D,
    output wire r_ex_reg1_WE,
    output wire [31:0] r_ex_reg2_D,
    output wire r_ex_reg2_WE,
    output wire r_ex_regwrite_D,
    output wire r_ex_regwrite_WE,
    output wire [1:0] r_ex_rfwtsel_D,
    output wire r_ex_rfwtsel_WE,
    output wire [4:0] r_ex_rs1_D,
    output wire r_ex_rs1_WE,
    output wire [4:0] r_ex_rs2_D,
    output wire r_ex_rs2_WE,
    output wire [31:0] r_id_instr_preserved_D,
    output wire r_id_instr_preserved_WE,
    output wire [31:0] r_id_pc_preserved_D,
    output wire r_id_pc_preserved_WE
);
    // data-path code:
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:201:9
    // r_ex_aluop.write(s_id_aluop.read());
    assign r_ex_aluop_D = s_id_aluop_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:201:9
    // r_ex_aluop.write(s_id_aluop.read());
    assign r_ex_aluop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:203:9
    // r_ex_alusrc1.write(s_id_alusrc1.read());
    assign r_ex_alusrc1_D = s_id_alusrc1_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:203:9
    // r_ex_alusrc1.write(s_id_alusrc1.read());
    assign r_ex_alusrc1_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:204:9
    // r_ex_alusrc2.write(s_id_alusrc2.read());
    assign r_ex_alusrc2_D = s_id_alusrc2_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:204:9
    // r_ex_alusrc2.write(s_id_alusrc2.read());
    assign r_ex_alusrc2_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:212:9
    // r_ex_brnchop.write(s_id_brnchop.read());
    assign r_ex_brnchop_D = s_id_brnchop_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:212:9
    // r_ex_brnchop.write(s_id_brnchop.read());
    assign r_ex_brnchop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:213:9
    // r_ex_brnchsel.write(s_id_brnchsel.read());
    assign r_ex_brnchsel_D = s_id_brnchsel_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:213:9
    // r_ex_brnchsel.write(s_id_brnchsel.read());
    assign r_ex_brnchsel_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:207:9
    // r_ex_immed.write(s_id_immed.read());
    assign r_ex_immed_D = s_id_immed_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:207:9
    // r_ex_immed.write(s_id_immed.read());
    assign r_ex_immed_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:215:9
    // r_ex_memop.write(s_id_memop.read());
    assign r_ex_memop_D = s_id_memop_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:215:9
    // r_ex_memop.write(s_id_memop.read());
    assign r_ex_memop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:198:9
    // r_ex_pc.write(r_id_pc.read());
    assign r_ex_pc_D = r_id_pc_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:198:9
    // r_ex_pc.write(r_id_pc.read());
    assign r_ex_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:206:9
    // r_ex_rd.write(s_id_rd.read());
    assign r_ex_rd_D = s_id_rd_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:206:9
    // r_ex_rd.write(s_id_rd.read());
    assign r_ex_rd_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:208:9
    // r_ex_reg1.write(s_id_reg1.read());
    assign r_ex_reg1_D = s_id_reg1_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:208:9
    // r_ex_reg1.write(s_id_reg1.read());
    assign r_ex_reg1_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:209:9
    // r_ex_reg2.write(s_id_reg2.read());
    assign r_ex_reg2_D = s_id_reg2_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:209:9
    // r_ex_reg2.write(s_id_reg2.read());
    assign r_ex_reg2_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:202:9
    // r_ex_regwrite.write(s_id_regwrite.read());
    assign r_ex_regwrite_D = s_id_regwrite_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:202:9
    // r_ex_regwrite.write(s_id_regwrite.read());
    assign r_ex_regwrite_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:214:9
    // r_ex_rfwtsel.write(s_id_rfwtsel.read());
    assign r_ex_rfwtsel_D = s_id_rfwtsel_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:214:9
    // r_ex_rfwtsel.write(s_id_rfwtsel.read());
    assign r_ex_rfwtsel_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:210:9
    // r_ex_rs1.write(s_id_rs1.read());
    assign r_ex_rs1_D = s_id_rs1_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:210:9
    // r_ex_rs1.write(s_id_rs1.read());
    assign r_ex_rs1_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:211:9
    // r_ex_rs2.write(s_id_rs2.read());
    assign r_ex_rs2_D = s_id_rs2_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:211:9
    // r_ex_rs2.write(s_id_rs2.read());
    assign r_ex_rs2_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:217:9
    // r_id_instr_preserved.write(s_id_instr.read());
    assign r_id_instr_preserved_D = s_id_instr_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:217:9
    // r_id_instr_preserved.write(s_id_instr.read());
    assign r_id_instr_preserved_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:218:9
    // r_id_pc_preserved.write(r_id_pc.read());
    assign r_id_pc_preserved_D = r_id_pc_Q;
    // /home/project/ecen5593-startercode/model/ca/pipelines/ca_pipe2_id.codal:218:9
    // r_id_pc_preserved.write(r_id_pc.read());
    assign r_id_pc_preserved_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // ecen5593_startercode_ca_core_id_output_t
