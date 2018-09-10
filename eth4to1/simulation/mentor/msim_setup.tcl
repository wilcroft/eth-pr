
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

# ----------------------------------------
# Auto-generated simulation script msim_setup.tcl
# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     eth4to1
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level script that compiles Altera simulation libraries and
# the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "mentor.do", and modify the text as directed.
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
# set QSYS_SIMDIR <script generation output directory>
# #
# # Source the generated IP simulation script.
# source $QSYS_SIMDIR/mentor/msim_setup.tcl
# #
# # Set any compilation options you require (this is unusual).
# set USER_DEFINED_COMPILE_OPTIONS <compilation options>
# #
# # Call command to compile the Quartus EDA simulation library.
# dev_com
# #
# # Call command to compile the Quartus-generated IP simulation files.
# com
# #
# # Add commands to compile all design files and testbench files, including
# # the top level. (These are all the files required for simulation other
# # than the files compiled by the Quartus-generated IP simulation script)
# #
# vlog <compilation options> <design and testbench files>
# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
# set TOP_LEVEL_NAME <simulation top>
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
# elab
# #
# # Run the simulation.
# run -a
# #
# # Report success to the shell.
# exit -code 0
# #
# # TOP-LEVEL TEMPLATE - END
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
# ACDS 16.1 203 win32 2018.05.25.12:57:51

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "eth4to1"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "D:/intelfpga/16.1/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib          ./libraries/     
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
  ensure_lib                       ./libraries/altera_ver/           
  vmap       altera_ver            ./libraries/altera_ver/           
  ensure_lib                       ./libraries/lpm_ver/              
  vmap       lpm_ver               ./libraries/lpm_ver/              
  ensure_lib                       ./libraries/sgate_ver/            
  vmap       sgate_ver             ./libraries/sgate_ver/            
  ensure_lib                       ./libraries/altera_mf_ver/        
  vmap       altera_mf_ver         ./libraries/altera_mf_ver/        
  ensure_lib                       ./libraries/altera_lnsim_ver/     
  vmap       altera_lnsim_ver      ./libraries/altera_lnsim_ver/     
  ensure_lib                       ./libraries/stratixv_ver/         
  vmap       stratixv_ver          ./libraries/stratixv_ver/         
  ensure_lib                       ./libraries/stratixv_hssi_ver/    
  vmap       stratixv_hssi_ver     ./libraries/stratixv_hssi_ver/    
  ensure_lib                       ./libraries/stratixv_pcie_hip_ver/
  vmap       stratixv_pcie_hip_ver ./libraries/stratixv_pcie_hip_ver/
}
ensure_lib                                                            ./libraries/error_adapter_0/                                           
vmap       error_adapter_0                                            ./libraries/error_adapter_0/                                           
ensure_lib                                                            ./libraries/rsp_mux/                                                   
vmap       rsp_mux                                                    ./libraries/rsp_mux/                                                   
ensure_lib                                                            ./libraries/rsp_demux/                                                 
vmap       rsp_demux                                                  ./libraries/rsp_demux/                                                 
ensure_lib                                                            ./libraries/cmd_mux/                                                   
vmap       cmd_mux                                                    ./libraries/cmd_mux/                                                   
ensure_lib                                                            ./libraries/cmd_demux/                                                 
vmap       cmd_demux                                                  ./libraries/cmd_demux/                                                 
ensure_lib                                                            ./libraries/router_001/                                                
vmap       router_001                                                 ./libraries/router_001/                                                
ensure_lib                                                            ./libraries/router/                                                    
vmap       router                                                     ./libraries/router/                                                    
ensure_lib                                                            ./libraries/avalon_st_adapter/                                         
vmap       avalon_st_adapter                                          ./libraries/avalon_st_adapter/                                         
ensure_lib                                                            ./libraries/crosser/                                                   
vmap       crosser                                                    ./libraries/crosser/                                                   
ensure_lib                                                            ./libraries/merlin_master_translator_avalon_universal_master_0_limiter/
vmap       merlin_master_translator_avalon_universal_master_0_limiter ./libraries/merlin_master_translator_avalon_universal_master_0_limiter/
ensure_lib                                                            ./libraries/tx_bridge_s0_agent_rsp_fifo/                               
vmap       tx_bridge_s0_agent_rsp_fifo                                ./libraries/tx_bridge_s0_agent_rsp_fifo/                               
ensure_lib                                                            ./libraries/tx_bridge_s0_agent/                                        
vmap       tx_bridge_s0_agent                                         ./libraries/tx_bridge_s0_agent/                                        
ensure_lib                                                            ./libraries/merlin_master_translator_avalon_universal_master_0_agent/  
vmap       merlin_master_translator_avalon_universal_master_0_agent   ./libraries/merlin_master_translator_avalon_universal_master_0_agent/  
ensure_lib                                                            ./libraries/tx_bridge_s0_translator/                                   
vmap       tx_bridge_s0_translator                                    ./libraries/tx_bridge_s0_translator/                                   
ensure_lib                                                            ./libraries/mm_interconnect_2/                                         
vmap       mm_interconnect_2                                          ./libraries/mm_interconnect_2/                                         
ensure_lib                                                            ./libraries/mm_interconnect_1/                                         
vmap       mm_interconnect_1                                          ./libraries/mm_interconnect_1/                                         
ensure_lib                                                            ./libraries/mm_interconnect_0/                                         
vmap       mm_interconnect_0                                          ./libraries/mm_interconnect_0/                                         
ensure_lib                                                            ./libraries/rxtx_timing_adapter_pauselen_tx/                           
vmap       rxtx_timing_adapter_pauselen_tx                            ./libraries/rxtx_timing_adapter_pauselen_tx/                           
ensure_lib                                                            ./libraries/rxtx_timing_adapter_pauselen_rx/                           
vmap       rxtx_timing_adapter_pauselen_rx                            ./libraries/rxtx_timing_adapter_pauselen_rx/                           
ensure_lib                                                            ./libraries/txrx_timing_adapter_link_fault_status_export/              
vmap       txrx_timing_adapter_link_fault_status_export               ./libraries/txrx_timing_adapter_link_fault_status_export/              
ensure_lib                                                            ./libraries/txrx_timing_adapter_link_fault_status_rx/                  
vmap       txrx_timing_adapter_link_fault_status_rx                   ./libraries/txrx_timing_adapter_link_fault_status_rx/                  
ensure_lib                                                            ./libraries/rx_st_error_adapter_stat/                                  
vmap       rx_st_error_adapter_stat                                   ./libraries/rx_st_error_adapter_stat/                                  
ensure_lib                                                            ./libraries/rx_eth_packet_overflow_control/                            
vmap       rx_eth_packet_overflow_control                             ./libraries/rx_eth_packet_overflow_control/                            
ensure_lib                                                            ./libraries/rx_eth_crc_pad_rem/                                        
vmap       rx_eth_crc_pad_rem                                         ./libraries/rx_eth_crc_pad_rem/                                        
ensure_lib                                                            ./libraries/rx_eth_frame_status_merger/                                
vmap       rx_eth_frame_status_merger                                 ./libraries/rx_eth_frame_status_merger/                                
ensure_lib                                                            ./libraries/rx_timing_adapter_frame_status_out_frame_decoder/          
vmap       rx_timing_adapter_frame_status_out_frame_decoder           ./libraries/rx_timing_adapter_frame_status_out_frame_decoder/          
ensure_lib                                                            ./libraries/rx_st_timing_adapter_frame_status_in/                      
vmap       rx_st_timing_adapter_frame_status_in                       ./libraries/rx_st_timing_adapter_frame_status_in/                      
ensure_lib                                                            ./libraries/rx_eth_lane_decoder/                                       
vmap       rx_eth_lane_decoder                                        ./libraries/rx_eth_lane_decoder/                                       
ensure_lib                                                            ./libraries/rx_eth_link_fault_detection/                               
vmap       rx_eth_link_fault_detection                                ./libraries/rx_eth_link_fault_detection/                               
ensure_lib                                                            ./libraries/rx_register_map/                                           
vmap       rx_register_map                                            ./libraries/rx_register_map/                                           
ensure_lib                                                            ./libraries/tx_eth_link_fault_generation/                              
vmap       tx_eth_link_fault_generation                               ./libraries/tx_eth_link_fault_generation/                              
ensure_lib                                                            ./libraries/tx_st_timing_adapter_splitter_out_0/                       
vmap       tx_st_timing_adapter_splitter_out_0                        ./libraries/tx_st_timing_adapter_splitter_out_0/                       
ensure_lib                                                            ./libraries/tx_st_timing_adapter_splitter_in/                          
vmap       tx_st_timing_adapter_splitter_in                           ./libraries/tx_st_timing_adapter_splitter_in/                          
ensure_lib                                                            ./libraries/tx_eth_xgmii_termination/                                  
vmap       tx_eth_xgmii_termination                                   ./libraries/tx_eth_xgmii_termination/                                  
ensure_lib                                                            ./libraries/tx_eth_packet_formatter/                                   
vmap       tx_eth_packet_formatter                                    ./libraries/tx_eth_packet_formatter/                                   
ensure_lib                                                            ./libraries/tx_st_status_output_delay_to_statistic/                    
vmap       tx_st_status_output_delay_to_statistic                     ./libraries/tx_st_status_output_delay_to_statistic/                    
ensure_lib                                                            ./libraries/tx_eth_statistics_collector/                               
vmap       tx_eth_statistics_collector                                ./libraries/tx_eth_statistics_collector/                               
ensure_lib                                                            ./libraries/tx_st_timing_adapter_splitter_status_output/               
vmap       tx_st_timing_adapter_splitter_status_output                ./libraries/tx_st_timing_adapter_splitter_status_output/               
ensure_lib                                                            ./libraries/tx_st_timing_adapter_splitter_status_in/                   
vmap       tx_st_timing_adapter_splitter_status_in                    ./libraries/tx_st_timing_adapter_splitter_status_in/                   
ensure_lib                                                            ./libraries/tx_st_error_adapter_stat/                                  
vmap       tx_st_error_adapter_stat                                   ./libraries/tx_st_error_adapter_stat/                                  
ensure_lib                                                            ./libraries/tx_eth_frame_decoder/                                      
vmap       tx_eth_frame_decoder                                       ./libraries/tx_eth_frame_decoder/                                      
ensure_lib                                                            ./libraries/tx_st_timing_adapter_frame_decoder/                        
vmap       tx_st_timing_adapter_frame_decoder                         ./libraries/tx_st_timing_adapter_frame_decoder/                        
ensure_lib                                                            ./libraries/tx_st_splitter_1/                                          
vmap       tx_st_splitter_1                                           ./libraries/tx_st_splitter_1/                                          
ensure_lib                                                            ./libraries/tx_st_pipeline_stage_rs/                                   
vmap       tx_st_pipeline_stage_rs                                    ./libraries/tx_st_pipeline_stage_rs/                                   
ensure_lib                                                            ./libraries/tx_eth_crc_inserter/                                       
vmap       tx_eth_crc_inserter                                        ./libraries/tx_eth_crc_inserter/                                       
ensure_lib                                                            ./libraries/tx_eth_address_inserter/                                   
vmap       tx_eth_address_inserter                                    ./libraries/tx_eth_address_inserter/                                   
ensure_lib                                                            ./libraries/tx_st_mux_flow_control_user_frame/                         
vmap       tx_st_mux_flow_control_user_frame                          ./libraries/tx_st_mux_flow_control_user_frame/                         
ensure_lib                                                            ./libraries/tx_st_pause_ctrl_error_adapter/                            
vmap       tx_st_pause_ctrl_error_adapter                             ./libraries/tx_st_pause_ctrl_error_adapter/                            
ensure_lib                                                            ./libraries/tx_eth_pause_ctrl_gen/                                     
vmap       tx_eth_pause_ctrl_gen                                      ./libraries/tx_eth_pause_ctrl_gen/                                     
ensure_lib                                                            ./libraries/tx_eth_pause_beat_conversion/                              
vmap       tx_eth_pause_beat_conversion                               ./libraries/tx_eth_pause_beat_conversion/                              
ensure_lib                                                            ./libraries/tx_eth_pkt_backpressure_control/                           
vmap       tx_eth_pkt_backpressure_control                            ./libraries/tx_eth_pkt_backpressure_control/                           
ensure_lib                                                            ./libraries/tx_eth_pad_inserter/                                       
vmap       tx_eth_pad_inserter                                        ./libraries/tx_eth_pad_inserter/                                       
ensure_lib                                                            ./libraries/tx_eth_packet_underflow_control/                           
vmap       tx_eth_packet_underflow_control                            ./libraries/tx_eth_packet_underflow_control/                           
ensure_lib                                                            ./libraries/tx_register_map/                                           
vmap       tx_register_map                                            ./libraries/tx_register_map/                                           
ensure_lib                                                            ./libraries/tx_eth_default_slave/                                      
vmap       tx_eth_default_slave                                       ./libraries/tx_eth_default_slave/                                      
ensure_lib                                                            ./libraries/tx_bridge/                                                 
vmap       tx_bridge                                                  ./libraries/tx_bridge/                                                 
ensure_lib                                                            ./libraries/merlin_master_translator/                                  
vmap       merlin_master_translator                                   ./libraries/merlin_master_translator/                                  
ensure_lib                                                            ./libraries/data_format_adapter_0/                                     
vmap       data_format_adapter_0                                      ./libraries/data_format_adapter_0/                                     
ensure_lib                                                            ./libraries/rx_st_fifo/                                                
vmap       rx_st_fifo                                                 ./libraries/rx_st_fifo/                                                
ensure_lib                                                            ./libraries/mac10g/                                                    
vmap       mac10g                                                     ./libraries/mac10g/                                                    
ensure_lib                                                            ./libraries/rst_controller/                                            
vmap       rst_controller                                             ./libraries/rst_controller/                                            
ensure_lib                                                            ./libraries/avalon_st_adapter_008/                                     
vmap       avalon_st_adapter_008                                      ./libraries/avalon_st_adapter_008/                                     
ensure_lib                                                            ./libraries/avalon_st_adapter_004/                                     
vmap       avalon_st_adapter_004                                      ./libraries/avalon_st_adapter_004/                                     
ensure_lib                                                            ./libraries/pll_0/                                                     
vmap       pll_0                                                      ./libraries/pll_0/                                                     
ensure_lib                                                            ./libraries/mac_3/                                                     
vmap       mac_3                                                      ./libraries/mac_3/                                                     
ensure_lib                                                            ./libraries/mac_2/                                                     
vmap       mac_2                                                      ./libraries/mac_2/                                                     
ensure_lib                                                            ./libraries/mac_1/                                                     
vmap       mac_1                                                      ./libraries/mac_1/                                                     
ensure_lib                                                            ./libraries/mac_0/                                                     
vmap       mac_0                                                      ./libraries/mac_0/                                                     
ensure_lib                                                            ./libraries/ethpack/                                                   
vmap       ethpack                                                    ./libraries/ethpack/                                                   
ensure_lib                                                            ./libraries/eth_in_mux/                                                
vmap       eth_in_mux                                                 ./libraries/eth_in_mux/                                                

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                     -work altera_ver           
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                              -work lpm_ver              
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                 -work sgate_ver            
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                             -work altera_mf_ver        
    eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                         -work altera_lnsim_ver     
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/stratixv_atoms_ncrypt.v"          -work stratixv_ver         
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_atoms.v"                        -work stratixv_ver         
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/stratixv_hssi_atoms_ncrypt.v"     -work stratixv_hssi_ver    
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_hssi_atoms.v"                   -work stratixv_hssi_ver    
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/stratixv_pcie_hip_atoms_ncrypt.v" -work stratixv_pcie_hip_ver
    eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_pcie_hip_atoms.v"               -work stratixv_pcie_hip_ver
  }
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -work error_adapter_0                                           
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_rsp_mux.sv"                           -work rsp_mux                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                 -work rsp_mux                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_rsp_demux.sv"                         -work rsp_demux                                                 
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_cmd_mux.sv"                           -work cmd_mux                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                 -work cmd_mux                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_cmd_demux.sv"                         -work cmd_demux                                                 
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_router_001.sv"                        -work router_001                                                
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_router.sv"                            -work router                                                    
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_rsp_mux.sv"                           -work rsp_mux                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                 -work rsp_mux                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_rsp_demux.sv"                         -work rsp_demux                                                 
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_cmd_mux.sv"                           -work cmd_mux                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                 -work cmd_mux                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_cmd_demux.sv"                         -work cmd_demux                                                 
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_router_001.sv"                        -work router_001                                                
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_router.sv"                            -work router                                                    
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_avalon_st_adapter.v"                  -work avalon_st_adapter                                         
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"                                  -work crosser                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                            -work crosser                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                            -work crosser                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                                             -work crosser                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_rsp_mux.sv"                           -work rsp_mux                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                 -work rsp_mux                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_rsp_demux.sv"                         -work rsp_demux                                                 
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_cmd_mux.sv"                           -work cmd_mux                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                 -work cmd_mux                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_cmd_demux.sv"                         -work cmd_demux                                                 
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"                                            -work merlin_master_translator_avalon_universal_master_0_limiter
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv"                                             -work merlin_master_translator_avalon_universal_master_0_limiter
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                     -work merlin_master_translator_avalon_universal_master_0_limiter
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                            -work merlin_master_translator_avalon_universal_master_0_limiter
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_router_001.sv"                        -work router_001                                                
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_router.sv"                            -work router                                                    
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                     -work tx_bridge_s0_agent_rsp_fifo                               
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                                -work tx_bridge_s0_agent                                        
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                         -work tx_bridge_s0_agent                                        
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                               -work merlin_master_translator_avalon_universal_master_0_agent  
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                           -work tx_bridge_s0_translator                                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2.v"                                    -work mm_interconnect_2                                         
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1.v"                                    -work mm_interconnect_1                                         
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0.v"                                    -work mm_interconnect_0                                         
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_rxtx_timing_adapter_pauselen_tx.sv"                     -work rxtx_timing_adapter_pauselen_tx                           
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_rxtx_timing_adapter_pauselen_rx.sv"                     -work rxtx_timing_adapter_pauselen_rx                           
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_txrx_timing_adapter_link_fault_status_export.sv"        -work txrx_timing_adapter_link_fault_status_export              
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_txrx_timing_adapter_link_fault_status_rx.sv"            -work txrx_timing_adapter_link_fault_status_rx                  
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_rx_st_error_adapter_stat.sv"                            -work rx_st_error_adapter_stat                                  
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_packet_overflow_control.v"                                 -work rx_eth_packet_overflow_control                            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_crc_pad_rem.v"                                             -work rx_eth_crc_pad_rem                                        
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_crc_rem.v"                                                 -work rx_eth_crc_pad_rem                                        
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_packet_stripper.v"                                             -work rx_eth_crc_pad_rem                                        
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_eth_crc_pad_rem_pipeline_stage.sv"                                    -work rx_eth_crc_pad_rem                                        
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_eth_crc_pad_rem_pipeline_base.v"                                      -work rx_eth_crc_pad_rem                                        
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_frame_status_merger.v"                                     -work rx_eth_frame_status_merger                                
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_rx_timing_adapter_frame_status_out_frame_decoder.sv"    -work rx_timing_adapter_frame_status_out_frame_decoder          
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_rx_st_timing_adapter_frame_status_in.sv"                -work rx_st_timing_adapter_frame_status_in                      
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_lane_decoder.v"                                            -work rx_eth_lane_decoder                                       
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_link_fault_detection.v"                                    -work rx_eth_link_fault_detection                               
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_10g_rx_register_map.v"                                     -work rx_register_map                                           
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                            -work rx_register_map                                           
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_link_fault_generation.v"                                   -work tx_eth_link_fault_generation                              
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_splitter_out_0.sv"                 -work tx_st_timing_adapter_splitter_out_0                       
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_splitter_in.sv"                    -work tx_st_timing_adapter_splitter_in                          
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_xgmii_termination.v"                                       -work tx_eth_xgmii_termination                                  
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_packet_formatter.v"                                        -work tx_eth_packet_formatter                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_delay.sv"                                                   -work tx_st_status_output_delay_to_statistic                    
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_10gmem_statistics_collector.v"                             -work tx_eth_statistics_collector                               
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_splitter_status_output.sv"         -work tx_st_timing_adapter_splitter_status_output               
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_splitter_status_in.sv"             -work tx_st_timing_adapter_splitter_status_in                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_error_adapter_stat.sv"                            -work tx_st_error_adapter_stat                                  
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_frame_decoder.v"                                           -work tx_eth_frame_decoder                                      
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_eth_frame_decoder_pipeline_stage.sv"                                  -work tx_eth_frame_decoder                                      
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_eth_frame_decoder_pipeline_base.v"                                    -work tx_eth_frame_decoder                                      
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_frame_decoder.sv"                  -work tx_st_timing_adapter_frame_decoder                        
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_splitter.sv"                                                -work tx_st_splitter_1                                          
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                          -work tx_st_pipeline_stage_rs                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                            -work tx_st_pipeline_stage_rs                                   
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_crc.v"                                                     -work tx_eth_crc_inserter                                       
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/crc32.v"                                                              -work tx_eth_crc_inserter                                       
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/gf_mult32_kc.v"                                                       -work tx_eth_crc_inserter                                       
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_address_inserter.v"                                        -work tx_eth_address_inserter                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_mux_flow_control_user_frame.sv"                   -work tx_st_mux_flow_control_user_frame                         
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g_tx_st_pause_ctrl_error_adapter.sv"                      -work tx_st_pause_ctrl_error_adapter                            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_pause_ctrl_gen.v"                                          -work tx_eth_pause_ctrl_gen                                     
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_pause_controller.v"                                        -work tx_eth_pause_ctrl_gen                                     
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_pause_gen.v"                                               -work tx_eth_pause_ctrl_gen                                     
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_pause_beat_conversion.v"                                   -work tx_eth_pause_beat_conversion                              
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_pkt_backpressure_control.v"                                -work tx_eth_pkt_backpressure_control                           
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_pad_inserter.v"                                            -work tx_eth_pad_inserter                                       
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_packet_underflow_control.v"                                -work tx_eth_packet_underflow_control                           
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_10g_tx_register_map.v"                                     -work tx_register_map                                           
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                            -work tx_register_map                                           
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/mentor/altera_eth_default_slave.v"                                           -work tx_eth_default_slave                                      
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_mm_bridge.v"                                                   -work tx_bridge                                                 
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                          -work merlin_master_translator                                  
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter_008_error_adapter_0.sv"                            -work error_adapter_0                                           
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter_008_data_format_adapter_0.sv"                      -work data_format_adapter_0                                     
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter_004_error_adapter_0.sv"                            -work error_adapter_0                                           
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter_004_data_format_adapter_0.sv"                      -work data_format_adapter_0                                     
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter_data_format_adapter_0.sv"                          -work data_format_adapter_0                                     
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_dc_fifo.v"                                                     -work rx_st_fifo                                                
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_dcfifo_synchronizer_bundle.v"                                         -work rx_st_fifo                                                
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                                             -work rx_st_fifo                                                
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/eth4to1_mac_0_mac10g.v"                                                      -work mac10g                                                    
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                                   -work rst_controller                                            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                                 -work rst_controller                                            
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter_008.v"                                             -work avalon_st_adapter_008                                     
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter_004.v"                                             -work avalon_st_adapter_004                                     
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/eth4to1_avalon_st_adapter.v"                                                 -work avalon_st_adapter                                         
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/eth4to1_pll_0.vo"                                                            -work pll_0                                                     
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/eth4to1_mac_3.v"                                                             -work mac_3                                                     
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/eth4to1_mac_2.v"                                                             -work mac_2                                                     
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/eth4to1_mac_1.v"                                                             -work mac_1                                                     
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/eth4to1_mac_0.v"                                                             -work mac_0                                                     
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/pmem_group.sv"                                                               -work ethpack                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/pmem_group_wrap.sv"                                                          -work ethpack                                                   
  eval  vlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/eth4to1_eth_in_mux.sv"                                                       -work eth_in_mux                                                
  eval  vlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/eth4to1.v"                                                                                                                                              
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L error_adapter_0 -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_001 -L router -L avalon_st_adapter -L crosser -L merlin_master_translator_avalon_universal_master_0_limiter -L tx_bridge_s0_agent_rsp_fifo -L tx_bridge_s0_agent -L merlin_master_translator_avalon_universal_master_0_agent -L tx_bridge_s0_translator -L mm_interconnect_2 -L mm_interconnect_1 -L mm_interconnect_0 -L rxtx_timing_adapter_pauselen_tx -L rxtx_timing_adapter_pauselen_rx -L txrx_timing_adapter_link_fault_status_export -L txrx_timing_adapter_link_fault_status_rx -L rx_st_error_adapter_stat -L rx_eth_packet_overflow_control -L rx_eth_crc_pad_rem -L rx_eth_frame_status_merger -L rx_timing_adapter_frame_status_out_frame_decoder -L rx_st_timing_adapter_frame_status_in -L rx_eth_lane_decoder -L rx_eth_link_fault_detection -L rx_register_map -L tx_eth_link_fault_generation -L tx_st_timing_adapter_splitter_out_0 -L tx_st_timing_adapter_splitter_in -L tx_eth_xgmii_termination -L tx_eth_packet_formatter -L tx_st_status_output_delay_to_statistic -L tx_eth_statistics_collector -L tx_st_timing_adapter_splitter_status_output -L tx_st_timing_adapter_splitter_status_in -L tx_st_error_adapter_stat -L tx_eth_frame_decoder -L tx_st_timing_adapter_frame_decoder -L tx_st_splitter_1 -L tx_st_pipeline_stage_rs -L tx_eth_crc_inserter -L tx_eth_address_inserter -L tx_st_mux_flow_control_user_frame -L tx_st_pause_ctrl_error_adapter -L tx_eth_pause_ctrl_gen -L tx_eth_pause_beat_conversion -L tx_eth_pkt_backpressure_control -L tx_eth_pad_inserter -L tx_eth_packet_underflow_control -L tx_register_map -L tx_eth_default_slave -L tx_bridge -L merlin_master_translator -L data_format_adapter_0 -L rx_st_fifo -L mac10g -L rst_controller -L avalon_st_adapter_008 -L avalon_st_adapter_004 -L pll_0 -L mac_3 -L mac_2 -L mac_1 -L mac_0 -L ethpack -L eth_in_mux -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixv_ver -L stratixv_hssi_ver -L stratixv_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with novopt option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -novopt -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L error_adapter_0 -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_001 -L router -L avalon_st_adapter -L crosser -L merlin_master_translator_avalon_universal_master_0_limiter -L tx_bridge_s0_agent_rsp_fifo -L tx_bridge_s0_agent -L merlin_master_translator_avalon_universal_master_0_agent -L tx_bridge_s0_translator -L mm_interconnect_2 -L mm_interconnect_1 -L mm_interconnect_0 -L rxtx_timing_adapter_pauselen_tx -L rxtx_timing_adapter_pauselen_rx -L txrx_timing_adapter_link_fault_status_export -L txrx_timing_adapter_link_fault_status_rx -L rx_st_error_adapter_stat -L rx_eth_packet_overflow_control -L rx_eth_crc_pad_rem -L rx_eth_frame_status_merger -L rx_timing_adapter_frame_status_out_frame_decoder -L rx_st_timing_adapter_frame_status_in -L rx_eth_lane_decoder -L rx_eth_link_fault_detection -L rx_register_map -L tx_eth_link_fault_generation -L tx_st_timing_adapter_splitter_out_0 -L tx_st_timing_adapter_splitter_in -L tx_eth_xgmii_termination -L tx_eth_packet_formatter -L tx_st_status_output_delay_to_statistic -L tx_eth_statistics_collector -L tx_st_timing_adapter_splitter_status_output -L tx_st_timing_adapter_splitter_status_in -L tx_st_error_adapter_stat -L tx_eth_frame_decoder -L tx_st_timing_adapter_frame_decoder -L tx_st_splitter_1 -L tx_st_pipeline_stage_rs -L tx_eth_crc_inserter -L tx_eth_address_inserter -L tx_st_mux_flow_control_user_frame -L tx_st_pause_ctrl_error_adapter -L tx_eth_pause_ctrl_gen -L tx_eth_pause_beat_conversion -L tx_eth_pkt_backpressure_control -L tx_eth_pad_inserter -L tx_eth_packet_underflow_control -L tx_register_map -L tx_eth_default_slave -L tx_bridge -L merlin_master_translator -L data_format_adapter_0 -L rx_st_fifo -L mac10g -L rst_controller -L avalon_st_adapter_008 -L avalon_st_adapter_004 -L pll_0 -L mac_3 -L mac_2 -L mac_1 -L mac_0 -L ethpack -L eth_in_mux -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixv_ver -L stratixv_hssi_ver -L stratixv_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -novopt
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with novopt option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -novopt"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo "                                 For most designs, this should be overridden"
  echo "                                 to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS  -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS     -- User-defined elaboration options, added to elab/elab_debug aliases."
}
file_copy
h
