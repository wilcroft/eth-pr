// (C) 2001-2017 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


//
// Common control & status register map for transceiver PHY IP
// Applies to Stratix V-generation basic PHY components
//
// $Header$
//
// PACKAGE DECLARATION
package csr_pcs10gbaser_h;

	import alt_xcvr_csr_common_h::*;

	// 8G PCS, a.k.a. "Standard PCS", control and status bits
	localparam [alt_xcvr_csr_addr_width-1:0] ADDR_PCS10G_CNT_CONTROL = ADDR_PCS_BASE + 8'd1;
	localparam [alt_xcvr_csr_addr_width-1:0] ADDR_PCS10G_STATUS = ADDR_PCS_BASE + 8'd2;
	localparam [alt_xcvr_csr_addr_width-1:0] ADDR_PCS10G_CNT_STATUS = ADDR_PCS_BASE + 8'd3;


endpackage
