
# (C) 2001-2018 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 16.1 203 win32 2018.12.07.15:07:22

# ----------------------------------------
# vcs - auto-generated simulation script

# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     eth4to1
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level shell script that compiles Altera simulation libraries
# and the Quartus-generated IP in your project, along with your design and
# testbench files, follow the guidelines below.
# 
# 1) Copy the shell script text from the TOP-LEVEL TEMPLATE section
# below into a new file, e.g. named "vcs_sim.sh".
# 
# 2) Copy the text from the DESIGN FILE LIST & OPTIONS TEMPLATE section into
# a separate file, e.g. named "filelist.f".
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # TOP_LEVEL_NAME is used in the Quartus-generated IP simulation script to
# # set the top-level simulation or testbench module/entity name.
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
# # Source the Quartus-generated IP simulation script and do the following:
# # - Compile the Quartus EDA simulation library and IP simulation files.
# # - Specify TOP_LEVEL_NAME and QSYS_SIMDIR.
# # - Compile the design and top-level simulation module/entity using
# #   information specified in "filelist.f".
# # - Override the default USER_DEFINED_SIM_OPTIONS. For example, to run
# #   until $finish(), set to an empty string: USER_DEFINED_SIM_OPTIONS="".
# # - Run the simulation.
# #
# source <script generation output directory>/synopsys/vcs/vcs_setup.sh \
# TOP_LEVEL_NAME=<simulation top> \
# QSYS_SIMDIR=<script generation output directory> \
# USER_DEFINED_ELAB_OPTIONS="\"-f filelist.f\"" \
# USER_DEFINED_SIM_OPTIONS=<simulation options for your design>
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# ----------------------------------------
# # DESIGN FILE LIST & OPTIONS TEMPLATE - BEGIN
# #
# # Compile all design files and testbench files, including the top level.
# # (These are all the files required for simulation other than the files
# # compiled by the Quartus-generated IP simulation script)
# #
# +systemverilogext+.sv
# <design and testbench files, compile-time options, elaboration options>
# #
# # DESIGN FILE LIST & OPTIONS TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If eth4to1 is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------
# ACDS 16.1 203 win32 2018.12.07.15:07:22
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="eth4to1"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="D:/intelfpga/16.1/quartus/"
SKIP_FILE_COPY=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="+vcs+finish+100"
# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `vcs -platform` != *"amd64"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# copy RAM/ROM files to simulation directory

vcs -lca -timescale=1ps/1ps -sverilog +verilog2001ext+.v -ntb_opts dtm $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v \
  $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/stratixv_atoms_ncrypt.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_atoms.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/stratixv_hssi_atoms_ncrypt.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_hssi_atoms.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/stratixv_pcie_hip_atoms_ncrypt.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_pcie_hip_atoms.v \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_rsp_mux.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_rsp_demux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_cmd_mux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_cmd_demux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_router_001.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_router.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_rsp_mux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_rsp_demux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_cmd_mux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_cmd_demux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_router_001.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_router.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_rsp_mux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_rsp_demux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_cmd_mux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_cmd_demux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_router_001.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_router.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2.v \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1.v \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0.v \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_rxtx_timing_adapter_pauselen_tx.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_rxtx_timing_adapter_pauselen_rx.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_txrx_timing_adapter_link_fault_status_export.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_txrx_timing_adapter_link_fault_status_rx.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_rx_st_error_adapter_stat.sv \
  $QSYS_SIMDIR/submodules/altera_eth_crc_pad_rem_pipeline_stage.sv \
  $QSYS_SIMDIR/submodules/altera_eth_crc_pad_rem_pipeline_base.v \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_rx_timing_adapter_frame_status_out_frame_decoder.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_rx_st_timing_adapter_frame_status_in.sv \
  $QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_splitter_out_0.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_splitter_in.sv \
  $QSYS_SIMDIR/submodules/altera_avalon_st_delay.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_splitter_status_output.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_splitter_status_in.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_error_adapter_stat.sv \
  $QSYS_SIMDIR/submodules/altera_eth_frame_decoder_pipeline_stage.sv \
  $QSYS_SIMDIR/submodules/altera_eth_frame_decoder_pipeline_base.v \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_frame_decoder.sv \
  $QSYS_SIMDIR/submodules/altera_avalon_st_splitter.sv \
  $QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv \
  $QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_mux_flow_control_user_frame.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_pause_ctrl_error_adapter.sv \
  $QSYS_SIMDIR/submodules/altera_avalon_mm_bridge.v \
  $QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter_008_error_adapter_0.sv \
  $QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter_008_data_format_adapter_0.sv \
  $QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter_004_error_adapter_0.sv \
  $QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter_004_data_format_adapter_0.sv \
  $QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter_data_format_adapter_0.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mm_interconnect_0_avalon_st_adapter.v \
  $QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v \
  $QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v \
  $QSYS_SIMDIR/submodules/altera_merlin_width_adapter.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mm_interconnect_0_rsp_mux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mm_interconnect_0_rsp_demux_001.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mm_interconnect_0_rsp_demux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mm_interconnect_0_cmd_mux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mm_interconnect_0_cmd_demux.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_uncmpr.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_13_1.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_new.sv \
  $QSYS_SIMDIR/submodules/altera_incr_burst_converter.sv \
  $QSYS_SIMDIR/submodules/altera_wrap_burst_converter.sv \
  $QSYS_SIMDIR/submodules/altera_default_burst_converter.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv \
  $QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v \
  $QSYS_SIMDIR/submodules/eth4to1_mm_interconnect_0_router_001.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mm_interconnect_0_router.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv \
  $QSYS_SIMDIR/submodules/altera_avalon_dc_fifo.v \
  $QSYS_SIMDIR/submodules/altera_dcfifo_synchronizer_bundle.v \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g.v \
  $QSYS_SIMDIR/submodules/altera_reset_controller.v \
  $QSYS_SIMDIR/submodules/altera_reset_synchronizer.v \
  $QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter_008.v \
  $QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter_004.v \
  $QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter.v \
  $QSYS_SIMDIR/submodules/eth4to1_irq_mapper.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mm_interconnect_0.v \
  $QSYS_SIMDIR/submodules/altera_xcvr_functions.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_h.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_resync.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_h.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_dfe_cal_sweep_h.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cal_seq.sv \
  $QSYS_SIMDIR/submodules/alt_xreconf_cif.sv \
  $QSYS_SIMDIR/submodules/alt_xreconf_uif.sv \
  $QSYS_SIMDIR/submodules/alt_xreconf_basic_acq.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_analog.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_analog_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xreconf_analog_datactrl.sv \
  $QSYS_SIMDIR/submodules/alt_xreconf_analog_rmw.sv \
  $QSYS_SIMDIR/submodules/alt_xreconf_analog_ctrlsm.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_offset_cancellation.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_offset_cancellation_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_eyemon.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_eyemon_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_eyemon_ctrl_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_eyemon_ber_sv.sv \
  $QSYS_SIMDIR/submodules/ber_reader_dcfifo.v \
  $QSYS_SIMDIR/submodules/step_to_mon_sv.sv \
  $QSYS_SIMDIR/submodules/mon_to_step_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_reg_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_cal_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_cal_sweep_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_cal_sweep_datapath_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_oc_cal_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_pi_phase_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_step_to_mon_en_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_adapt_tap_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_ctrl_mux_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_local_reset_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_cal_sim_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe_adapt_tap_sim_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_adce.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_adce_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_adce_datactrl_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_sv.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_cal.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_control.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_datapath.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_pll_reset.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_eye_width.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_align_clk.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_get_sum.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_cal_sim_model.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_mif.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_reconfig_mif.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_reconfig_mif_ctrl.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_reconfig_mif_avmm.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_pll.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_reconfig_pll.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_reconfig_pll_ctrl.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_soc.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_ram.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_direct.sv \
  $QSYS_SIMDIR/submodules/sv_xrbasic_l2p_addr.sv \
  $QSYS_SIMDIR/submodules/sv_xrbasic_l2p_ch.sv \
  $QSYS_SIMDIR/submodules/sv_xrbasic_l2p_rom.sv \
  $QSYS_SIMDIR/submodules/sv_xrbasic_lif_csr.sv \
  $QSYS_SIMDIR/submodules/sv_xrbasic_lif.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_reconfig_basic.sv \
  $QSYS_SIMDIR/submodules/alt_arbiter_acq.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_basic.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_arbiter.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_m2s.sv \
  $QSYS_SIMDIR/submodules/altera_wait_generate.v \
  $QSYS_SIMDIR/submodules/alt_xcvr_csr_selector.sv \
  $QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_basic.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu.v \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_reconfig_cpu.v \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_reconfig_cpu_test_bench.v \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0.v \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_irq_mapper.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_001.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_002.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_003.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux_001.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux_001.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux_001.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_avalon_st_adapter.v \
  $QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv \
  $QSYS_SIMDIR/submodules/alt_pr.v \
  $QSYS_SIMDIR/submodules/eth4to1_pll_1.vo \
  $QSYS_SIMDIR/submodules/eth4to1_pll_0.vo \
  $QSYS_SIMDIR/submodules/altpcie_reconfig_driver.sv \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_a2p_addrtrans.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_a2p_fixtrans.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_a2p_vartrans.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_control_register.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_cr_avalon.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_cr_interrupt.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_cr_rp.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_cfg_status.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_cr_mailbox.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_p2a_addrtrans.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_reg_fifo.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_rx.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_rx_cntrl.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_rx_resp.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_tx.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_tx_cntrl.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_txavl_cntrl.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_txresp_cntrl.v \
  $QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_clksync.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_a2p_addrtrans.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_a2p_fixtrans.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_a2p_vartrans.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_clksync.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_control_register.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_cr_avalon.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_cr_interrupt.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_cr_rp.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_cfg_status.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_cr_mailbox.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_p2a_addrtrans.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_rx.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_rx_cntrl.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_fifo.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_rxm_adapter.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_rx_resp.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_tx.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_tx_cntrl.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_txavl_cntrl.v \
  $QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_txresp_cntrl.v \
  $QSYS_SIMDIR/submodules/avalon_lite/altpciexpav_lite_app.v \
  $QSYS_SIMDIR/submodules/altpciexpav_stif_app.v \
  $QSYS_SIMDIR/submodules/altpciexpav128_app.v \
  $QSYS_SIMDIR/submodules/altpcie_sv_hip_avmm_hwtcl.v \
  $QSYS_SIMDIR/submodules/altpcierd_hip_rs.v \
  $QSYS_SIMDIR/submodules/altpcie_sv_hip_ast_hwtcl.v \
  $QSYS_SIMDIR/submodules/altpcie_hip_256_pipen1b.v \
  $QSYS_SIMDIR/submodules/altpcie_rs_serdes.v \
  $QSYS_SIMDIR/submodules/altpcie_rs_hip.v \
  $QSYS_SIMDIR/submodules/altpcie_scfifo.v \
  $QSYS_SIMDIR/submodules/altpcie_sv_scfifo_ext.v \
  $QSYS_SIMDIR/submodules/altpcie_scfifo_sv.v \
  $QSYS_SIMDIR/submodules/altpcie_sv_gbfifo.v \
  $QSYS_SIMDIR/submodules/altpcie_tlp_inspector.v \
  $QSYS_SIMDIR/submodules/altpcie_tlp_inspector_trigger.v \
  $QSYS_SIMDIR/submodules/altpcie_hip_eq_dprio.v \
  $QSYS_SIMDIR/submodules/altpcie_hip_eq_bypass_ph3.v \
  $QSYS_SIMDIR/submodules/altpcietb_bfm_pipe_8to32.v \
  $QSYS_SIMDIR/submodules/altpcie_inspector.sv \
  $QSYS_SIMDIR/submodules/altpcie_monitor_sv_dlhip_sim.sv \
  $QSYS_SIMDIR/submodules/altpcie_tlp_inspector_monitor.sv \
  $QSYS_SIMDIR/submodules/altpcie_tlp_inspector_cseb.sv \
  $QSYS_SIMDIR/submodules/sv_pcs.sv \
  $QSYS_SIMDIR/submodules/sv_pcs_ch.sv \
  $QSYS_SIMDIR/submodules/sv_pma.sv \
  $QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_xcvr.sv \
  $QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_ip.sv \
  $QSYS_SIMDIR/submodules/sv_reconfig_bundle_merger.sv \
  $QSYS_SIMDIR/submodules/sv_rx_pma.sv \
  $QSYS_SIMDIR/submodules/sv_tx_pma.sv \
  $QSYS_SIMDIR/submodules/sv_tx_pma_ch.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_avmm_csr.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_avmm_dcd.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_avmm.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_data_adapter.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_native.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_plls.sv \
  $QSYS_SIMDIR/submodules/sv_hssi_10g_rx_pcs_rbc.sv \
  $QSYS_SIMDIR/submodules/sv_hssi_10g_tx_pcs_rbc.sv \
  $QSYS_SIMDIR/submodules/sv_hssi_8g_rx_pcs_rbc.sv \
  $QSYS_SIMDIR/submodules/sv_hssi_8g_tx_pcs_rbc.sv \
  $QSYS_SIMDIR/submodules/sv_hssi_8g_pcs_aggregate_rbc.sv \
  $QSYS_SIMDIR/submodules/sv_hssi_common_pcs_pma_interface_rbc.sv \
  $QSYS_SIMDIR/submodules/sv_hssi_common_pld_pcs_interface_rbc.sv \
  $QSYS_SIMDIR/submodules/sv_hssi_pipe_gen1_2_rbc.sv \
  $QSYS_SIMDIR/submodules/sv_hssi_pipe_gen3_rbc.sv \
  $QSYS_SIMDIR/submodules/sv_hssi_rx_pcs_pma_interface_rbc.sv \
  $QSYS_SIMDIR/submodules/sv_hssi_rx_pld_pcs_interface_rbc.sv \
  $QSYS_SIMDIR/submodules/sv_hssi_tx_pcs_pma_interface_rbc.sv \
  $QSYS_SIMDIR/submodules/sv_hssi_tx_pld_pcs_interface_rbc.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_emsip_adapter.sv \
  $QSYS_SIMDIR/submodules/sv_xcvr_pipe_native.sv \
  $QSYS_SIMDIR/submodules/eth4to1_mac_3.v \
  $QSYS_SIMDIR/submodules/eth4to1_mac_2.v \
  $QSYS_SIMDIR/submodules/eth4to1_mac_1.v \
  $QSYS_SIMDIR/submodules/eth4to1_mac_0.v \
  $QSYS_SIMDIR/submodules/regioncontrol.sv \
  $QSYS_SIMDIR/submodules/pmem_group.sv \
  $QSYS_SIMDIR/submodules/pmem_group_wrap.sv \
  $QSYS_SIMDIR/submodules/eth4to1_eth_in_mux.sv \
  $QSYS_SIMDIR/submodules/eth4to1_doublewidth0.sv \
  $QSYS_SIMDIR/submodules/eth4to1_doublewidth0_state_ram.sv \
  $QSYS_SIMDIR/submodules/eth4to1_doublewidth0_data_ram.sv \
  $QSYS_SIMDIR/submodules/eth4to1_doublewidth0_sop_ram.sv \
  $QSYS_SIMDIR/eth4to1.v \
  -top $TOP_LEVEL_NAME
# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS
fi
