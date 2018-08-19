// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
// Date        : Wed Aug 15 01:31:07 2018
// Host        : DESKTOP-HJHIESV running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Github/MotionDetection/FPGA/motion_detection.srcs/sources_1/ip/Reference_frame/Reference_frame_stub.v
// Design      : Reference_frame
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_6,Vivado 2017.1" *)
module Reference_frame(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[3:0],douta[7:0]" */;
  input clka;
  input [3:0]addra;
  output [7:0]douta;
endmodule
