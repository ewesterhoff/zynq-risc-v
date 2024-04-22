// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Zybo_Z7_top(sysclk, r_btn, btn, sw, led, ja, jc, jd, je);
  input sysclk;
  input r_btn;
  input [2:0]btn;
  input [3:0]sw;
  output [3:0]led;
  inout [7:0]ja;
  inout [7:0]jc;
  inout [7:0]jd;
  inout [7:0]je;
endmodule
