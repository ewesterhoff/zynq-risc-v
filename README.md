# zynq-risc-v

To change programs, you must change the:
1. Starting address of main
```
Line 900 of ecen5593_startercode_ca_core_t.v: 
d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h0000103c),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pc (
        .CLK(CLK),
        .RST(RST),
        .WE(r_pc_WE_wire),
        .D(r_pc_D_wire),
        .Q(r_pc_Q_wire)
    );
```
```
Line 28 of ecen5593_startercode_ca_core_reset_t.v:
module ecen5593_startercode_ca_core_reset_t(
    input  wire ACT,
    output wire [31:0] r_pc_D,
    output wire r_pc_WE
);
    // data-path code:
    // /home/project/ecen5593-startercode/model/ca/events/ca_main_reset.codal:34:9
    // r_pc.write((int32)(0x103c));
    assign r_pc_D = (ACT == 1'b1) ? 32'h0000103c : 32'h00000000;
    // /home/project/ecen5593-startercode/model/ca/events/ca_main_reset.codal:34:9
    // r_pc.write((int32)(0x103c));
    assign r_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // ecen5593_startercode_ca_core_reset_t
```

2. Address of interrupt handler:
```
line 82 of ecen5593_startercode_ca_core_fe_t.v:
codasip_tmp_var_2 ? 32'h00001058 :
```

3. Number of instructions:
```
module Zybo_Z7_top 
#(
    parameter LED_ADDR = 32'h00001000,
    parameter SWC_ADDR = 32'h00001004,
    parameter BTN_ADDR = 32'h00001008,
    parameter NUM_INSTR = 53
)
```