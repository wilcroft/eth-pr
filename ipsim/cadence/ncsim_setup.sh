
# (C) 2001-2017 Altera Corporation. All rights reserved.
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

# ACDS 16.1 203 win32 2017.12.10.23:00:41

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     eth4to1
#     mac10g
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level shell script that compiles Altera simulation libraries
# and the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "ncsim.sh", and modify text as directed.
# 
# You can also modify the simulation flow to suit your needs. Set the
# following variables to 1 to disable their corresponding processes:
# - SKIP_FILE_COPY: skip copying ROM/RAM initialization files
# - SKIP_DEV_COM: skip compiling the Quartus EDA simulation library
# - SKIP_COM: skip compiling Quartus-generated IP simulation files
# - SKIP_ELAB and SKIP_SIM: skip elaboration and simulation
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
# # the simulator. In this case, you must also copy the generated files
# # "cds.lib" and "hdl.var" - plus the directory "cds_libs" if generated - 
# # into the location from which you launch the simulator, or incorporate
# # into any existing library setup.
# #
# # Run Quartus-generated IP simulation script once to compile Quartus EDA
# # simulation libraries and Quartus-generated IP simulation files, and copy
# # any ROM/RAM initialization files to the simulation directory.
# # - If necessary, specify USER_DEFINED_COMPILE_OPTIONS.
# #
# source <script generation output directory>/cadence/ncsim_setup.sh \
# SKIP_ELAB=1 \
# SKIP_SIM=1 \
# USER_DEFINED_COMPILE_OPTIONS=<compilation options for your design> \
# QSYS_SIMDIR=<script generation output directory>
# #
# # Compile all design files and testbench files, including the top level.
# # (These are all the files required for simulation other than the files
# # compiled by the IP script)
# #
# ncvlog <compilation options> <design and testbench files>
# #
# # TOP_LEVEL_NAME is used in this script to set the top-level simulation or
# # testbench module/entity name.
# #
# # Run the IP script again to elaborate and simulate the top level:
# # - Specify TOP_LEVEL_NAME and USER_DEFINED_ELAB_OPTIONS.
# # - Override the default USER_DEFINED_SIM_OPTIONS. For example, to run
# #   until $finish(), set to an empty string: USER_DEFINED_SIM_OPTIONS="".
# #
# source <script generation output directory>/cadence/ncsim_setup.sh \
# SKIP_FILE_COPY=1 \
# SKIP_DEV_COM=1 \
# SKIP_COM=1 \
# TOP_LEVEL_NAME=<simulation top> \
# USER_DEFINED_ELAB_OPTIONS=<elaboration options for your design> \
# USER_DEFINED_SIM_OPTIONS=<simulation options for your design>
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# ACDS 16.1 203 win32 2017.12.10.23:00:41
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="mac10g"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="D:/intelfpga/16.1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

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
if [[ `ncsim -version` != *"ncsim(64)"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/error_adapter_0/
mkdir -p ./libraries/rsp_mux/
mkdir -p ./libraries/rsp_demux/
mkdir -p ./libraries/cmd_mux/
mkdir -p ./libraries/cmd_demux/
mkdir -p ./libraries/router_001/
mkdir -p ./libraries/router/
mkdir -p ./libraries/avalon_st_adapter/
mkdir -p ./libraries/crosser/
mkdir -p ./libraries/merlin_master_translator_avalon_universal_master_0_limiter/
mkdir -p ./libraries/tx_bridge_s0_agent_rsp_fifo/
mkdir -p ./libraries/tx_bridge_s0_agent/
mkdir -p ./libraries/merlin_master_translator_avalon_universal_master_0_agent/
mkdir -p ./libraries/tx_bridge_s0_translator/
mkdir -p ./libraries/mm_interconnect_2/
mkdir -p ./libraries/mm_interconnect_1/
mkdir -p ./libraries/mm_interconnect_0/
mkdir -p ./libraries/rxtx_timing_adapter_pauselen_tx/
mkdir -p ./libraries/rxtx_timing_adapter_pauselen_rx/
mkdir -p ./libraries/txrx_timing_adapter_link_fault_status_export/
mkdir -p ./libraries/txrx_timing_adapter_link_fault_status_rx/
mkdir -p ./libraries/rx_st_error_adapter_stat/
mkdir -p ./libraries/rx_eth_crc_pad_rem/
mkdir -p ./libraries/rx_timing_adapter_frame_status_out_frame_decoder/
mkdir -p ./libraries/rx_st_timing_adapter_frame_status_in/
mkdir -p ./libraries/rx_register_map/
mkdir -p ./libraries/tx_st_timing_adapter_splitter_out_0/
mkdir -p ./libraries/tx_st_timing_adapter_splitter_in/
mkdir -p ./libraries/tx_st_status_output_delay_to_statistic/
mkdir -p ./libraries/tx_st_timing_adapter_splitter_status_output/
mkdir -p ./libraries/tx_st_timing_adapter_splitter_status_in/
mkdir -p ./libraries/tx_st_error_adapter_stat/
mkdir -p ./libraries/tx_eth_frame_decoder/
mkdir -p ./libraries/tx_st_timing_adapter_frame_decoder/
mkdir -p ./libraries/tx_st_splitter_1/
mkdir -p ./libraries/tx_st_pipeline_stage_rs/
mkdir -p ./libraries/tx_st_mux_flow_control_user_frame/
mkdir -p ./libraries/tx_st_pause_ctrl_error_adapter/
mkdir -p ./libraries/tx_register_map/
mkdir -p ./libraries/tx_bridge/
mkdir -p ./libraries/merlin_master_translator/
mkdir -p ./libraries/data_format_adapter_0/
mkdir -p ./libraries/channel_adapter_0/
mkdir -p ./libraries/rx_st_fifo/
mkdir -p ./libraries/mac10g/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/avalon_st_adapter_001/
mkdir -p ./libraries/pll_0/
mkdir -p ./libraries/multiplexer_0/
mkdir -p ./libraries/mac_3/
mkdir -p ./libraries/mac_2/
mkdir -p ./libraries/mac_1/
mkdir -p ./libraries/mac_0/
mkdir -p ./libraries/eth/
mkdir -p ./libraries/demultiplexer_0/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/stratixv_ver/
mkdir -p ./libraries/stratixv_hssi_ver/
mkdir -p ./libraries/stratixv_pcie_hip_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                      -work altera_ver           
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                               -work lpm_ver              
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                  -work sgate_ver            
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                              -work altera_mf_ver        
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                          -work altera_lnsim_ver     
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/stratixv_atoms_ncrypt.v"          -work stratixv_ver         
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_atoms.v"                         -work stratixv_ver         
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/stratixv_hssi_atoms_ncrypt.v"     -work stratixv_hssi_ver    
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_hssi_atoms.v"                    -work stratixv_hssi_ver    
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/stratixv_pcie_hip_atoms_ncrypt.v" -work stratixv_pcie_hip_ver
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixv_pcie_hip_atoms.v"                -work stratixv_pcie_hip_ver
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -work error_adapter_0                                            -cdslib ./cds_libs/error_adapter_0.cds.lib                                           
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_rsp_mux.sv"                           -work rsp_mux                                                    -cdslib ./cds_libs/rsp_mux.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_merlin_arbitrator.sv"                                                 -work rsp_mux                                                    -cdslib ./cds_libs/rsp_mux.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_rsp_demux.sv"                         -work rsp_demux                                                  -cdslib ./cds_libs/rsp_demux.cds.lib                                                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_cmd_mux.sv"                           -work cmd_mux                                                    -cdslib ./cds_libs/cmd_mux.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_merlin_arbitrator.sv"                                                 -work cmd_mux                                                    -cdslib ./cds_libs/cmd_mux.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_cmd_demux.sv"                         -work cmd_demux                                                  -cdslib ./cds_libs/cmd_demux.cds.lib                                                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_router_001.sv"                        -work router_001                                                 -cdslib ./cds_libs/router_001.cds.lib                                                
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2_router.sv"                            -work router                                                     -cdslib ./cds_libs/router.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_rsp_mux.sv"                           -work rsp_mux                                                    -cdslib ./cds_libs/rsp_mux.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_merlin_arbitrator.sv"                                                 -work rsp_mux                                                    -cdslib ./cds_libs/rsp_mux.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_rsp_demux.sv"                         -work rsp_demux                                                  -cdslib ./cds_libs/rsp_demux.cds.lib                                                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_cmd_mux.sv"                           -work cmd_mux                                                    -cdslib ./cds_libs/cmd_mux.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_merlin_arbitrator.sv"                                                 -work cmd_mux                                                    -cdslib ./cds_libs/cmd_mux.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_cmd_demux.sv"                         -work cmd_demux                                                  -cdslib ./cds_libs/cmd_demux.cds.lib                                                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_router_001.sv"                        -work router_001                                                 -cdslib ./cds_libs/router_001.cds.lib                                                
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1_router.sv"                            -work router                                                     -cdslib ./cds_libs/router.cds.lib                                                    
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_avalon_st_adapter.v"                  -work avalon_st_adapter                                          -cdslib ./cds_libs/avalon_st_adapter.cds.lib                                         
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_avalon_st_handshake_clock_crosser.v"                                  -work crosser                                                    -cdslib ./cds_libs/crosser.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_avalon_st_clock_crosser.v"                                            -work crosser                                                    -cdslib ./cds_libs/crosser.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_avalon_st_pipeline_base.v"                                            -work crosser                                                    -cdslib ./cds_libs/crosser.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_std_synchronizer_nocut.v"                                             -work crosser                                                    -cdslib ./cds_libs/crosser.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_rsp_mux.sv"                           -work rsp_mux                                                    -cdslib ./cds_libs/rsp_mux.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_merlin_arbitrator.sv"                                                 -work rsp_mux                                                    -cdslib ./cds_libs/rsp_mux.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_rsp_demux.sv"                         -work rsp_demux                                                  -cdslib ./cds_libs/rsp_demux.cds.lib                                                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_cmd_mux.sv"                           -work cmd_mux                                                    -cdslib ./cds_libs/cmd_mux.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_merlin_arbitrator.sv"                                                 -work cmd_mux                                                    -cdslib ./cds_libs/cmd_mux.cds.lib                                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_cmd_demux.sv"                         -work cmd_demux                                                  -cdslib ./cds_libs/cmd_demux.cds.lib                                                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_merlin_traffic_limiter.sv"                                            -work merlin_master_translator_avalon_universal_master_0_limiter -cdslib ./cds_libs/merlin_master_translator_avalon_universal_master_0_limiter.cds.lib
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_merlin_reorder_memory.sv"                                             -work merlin_master_translator_avalon_universal_master_0_limiter -cdslib ./cds_libs/merlin_master_translator_avalon_universal_master_0_limiter.cds.lib
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_avalon_sc_fifo.v"                                                     -work merlin_master_translator_avalon_universal_master_0_limiter -cdslib ./cds_libs/merlin_master_translator_avalon_universal_master_0_limiter.cds.lib
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_avalon_st_pipeline_base.v"                                            -work merlin_master_translator_avalon_universal_master_0_limiter -cdslib ./cds_libs/merlin_master_translator_avalon_universal_master_0_limiter.cds.lib
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_router_001.sv"                        -work router_001                                                 -cdslib ./cds_libs/router_001.cds.lib                                                
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0_router.sv"                            -work router                                                     -cdslib ./cds_libs/router.cds.lib                                                    
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_avalon_sc_fifo.v"                                                     -work tx_bridge_s0_agent_rsp_fifo                                -cdslib ./cds_libs/tx_bridge_s0_agent_rsp_fifo.cds.lib                               
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_merlin_slave_agent.sv"                                                -work tx_bridge_s0_agent                                         -cdslib ./cds_libs/tx_bridge_s0_agent.cds.lib                                        
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_merlin_burst_uncompressor.sv"                                         -work tx_bridge_s0_agent                                         -cdslib ./cds_libs/tx_bridge_s0_agent.cds.lib                                        
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_merlin_master_agent.sv"                                               -work merlin_master_translator_avalon_universal_master_0_agent   -cdslib ./cds_libs/merlin_master_translator_avalon_universal_master_0_agent.cds.lib  
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_merlin_slave_translator.sv"                                           -work tx_bridge_s0_translator                                    -cdslib ./cds_libs/tx_bridge_s0_translator.cds.lib                                   
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_2.v"                                    -work mm_interconnect_2                                          -cdslib ./cds_libs/mm_interconnect_2.cds.lib                                         
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_1.v"                                    -work mm_interconnect_1                                          -cdslib ./cds_libs/mm_interconnect_1.cds.lib                                         
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_mm_interconnect_0.v"                                    -work mm_interconnect_0                                          -cdslib ./cds_libs/mm_interconnect_0.cds.lib                                         
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_rxtx_timing_adapter_pauselen_tx.sv"                     -work rxtx_timing_adapter_pauselen_tx                            -cdslib ./cds_libs/rxtx_timing_adapter_pauselen_tx.cds.lib                           
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_rxtx_timing_adapter_pauselen_rx.sv"                     -work rxtx_timing_adapter_pauselen_rx                            -cdslib ./cds_libs/rxtx_timing_adapter_pauselen_rx.cds.lib                           
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_txrx_timing_adapter_link_fault_status_export.sv"        -work txrx_timing_adapter_link_fault_status_export               -cdslib ./cds_libs/txrx_timing_adapter_link_fault_status_export.cds.lib              
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_txrx_timing_adapter_link_fault_status_rx.sv"            -work txrx_timing_adapter_link_fault_status_rx                   -cdslib ./cds_libs/txrx_timing_adapter_link_fault_status_rx.cds.lib                  
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_rx_st_error_adapter_stat.sv"                            -work rx_st_error_adapter_stat                                   -cdslib ./cds_libs/rx_st_error_adapter_stat.cds.lib                                  
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_eth_crc_pad_rem_pipeline_stage.sv"                                    -work rx_eth_crc_pad_rem                                         -cdslib ./cds_libs/rx_eth_crc_pad_rem.cds.lib                                        
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_eth_crc_pad_rem_pipeline_base.v"                                      -work rx_eth_crc_pad_rem                                         -cdslib ./cds_libs/rx_eth_crc_pad_rem.cds.lib                                        
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_rx_timing_adapter_frame_status_out_frame_decoder.sv"    -work rx_timing_adapter_frame_status_out_frame_decoder           -cdslib ./cds_libs/rx_timing_adapter_frame_status_out_frame_decoder.cds.lib          
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_rx_st_timing_adapter_frame_status_in.sv"                -work rx_st_timing_adapter_frame_status_in                       -cdslib ./cds_libs/rx_st_timing_adapter_frame_status_in.cds.lib                      
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_avalon_st_clock_crosser.v"                                            -work rx_register_map                                            -cdslib ./cds_libs/rx_register_map.cds.lib                                           
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_splitter_out_0.sv"                 -work tx_st_timing_adapter_splitter_out_0                        -cdslib ./cds_libs/tx_st_timing_adapter_splitter_out_0.cds.lib                       
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_splitter_in.sv"                    -work tx_st_timing_adapter_splitter_in                           -cdslib ./cds_libs/tx_st_timing_adapter_splitter_in.cds.lib                          
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_avalon_st_delay.sv"                                                   -work tx_st_status_output_delay_to_statistic                     -cdslib ./cds_libs/tx_st_status_output_delay_to_statistic.cds.lib                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_splitter_status_output.sv"         -work tx_st_timing_adapter_splitter_status_output                -cdslib ./cds_libs/tx_st_timing_adapter_splitter_status_output.cds.lib               
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_splitter_status_in.sv"             -work tx_st_timing_adapter_splitter_status_in                    -cdslib ./cds_libs/tx_st_timing_adapter_splitter_status_in.cds.lib                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_tx_st_error_adapter_stat.sv"                            -work tx_st_error_adapter_stat                                   -cdslib ./cds_libs/tx_st_error_adapter_stat.cds.lib                                  
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_eth_frame_decoder_pipeline_stage.sv"                                  -work tx_eth_frame_decoder                                       -cdslib ./cds_libs/tx_eth_frame_decoder.cds.lib                                      
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_eth_frame_decoder_pipeline_base.v"                                    -work tx_eth_frame_decoder                                       -cdslib ./cds_libs/tx_eth_frame_decoder.cds.lib                                      
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_tx_st_timing_adapter_frame_decoder.sv"                  -work tx_st_timing_adapter_frame_decoder                         -cdslib ./cds_libs/tx_st_timing_adapter_frame_decoder.cds.lib                        
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_avalon_st_splitter.sv"                                                -work tx_st_splitter_1                                           -cdslib ./cds_libs/tx_st_splitter_1.cds.lib                                          
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                          -work tx_st_pipeline_stage_rs                                    -cdslib ./cds_libs/tx_st_pipeline_stage_rs.cds.lib                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_avalon_st_pipeline_base.v"                                            -work tx_st_pipeline_stage_rs                                    -cdslib ./cds_libs/tx_st_pipeline_stage_rs.cds.lib                                   
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_tx_st_mux_flow_control_user_frame.sv"                   -work tx_st_mux_flow_control_user_frame                          -cdslib ./cds_libs/tx_st_mux_flow_control_user_frame.cds.lib                         
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g_tx_st_pause_ctrl_error_adapter.sv"                      -work tx_st_pause_ctrl_error_adapter                             -cdslib ./cds_libs/tx_st_pause_ctrl_error_adapter.cds.lib                            
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_avalon_st_clock_crosser.v"                                            -work tx_register_map                                            -cdslib ./cds_libs/tx_register_map.cds.lib                                           
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_avalon_mm_bridge.v"                                                   -work tx_bridge                                                  -cdslib ./cds_libs/tx_bridge.cds.lib                                                 
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_merlin_master_translator.sv"                                          -work merlin_master_translator                                   -cdslib ./cds_libs/merlin_master_translator.cds.lib                                  
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_avalon_st_adapter_001_error_adapter_0.sv"                            -work error_adapter_0                                            -cdslib ./cds_libs/error_adapter_0.cds.lib                                           
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_avalon_st_adapter_001_data_format_adapter_0.sv"                      -work data_format_adapter_0                                      -cdslib ./cds_libs/data_format_adapter_0.cds.lib                                     
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_avalon_st_adapter_error_adapter_0.sv"                                -work error_adapter_0                                            -cdslib ./cds_libs/error_adapter_0.cds.lib                                           
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_avalon_st_adapter_channel_adapter_0.sv"                              -work channel_adapter_0                                          -cdslib ./cds_libs/channel_adapter_0.cds.lib                                         
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_avalon_st_adapter_data_format_adapter_0.sv"                          -work data_format_adapter_0                                      -cdslib ./cds_libs/data_format_adapter_0.cds.lib                                     
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_avalon_dc_fifo.v"                                                     -work rx_st_fifo                                                 -cdslib ./cds_libs/rx_st_fifo.cds.lib                                                
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_dcfifo_synchronizer_bundle.v"                                         -work rx_st_fifo                                                 -cdslib ./cds_libs/rx_st_fifo.cds.lib                                                
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_std_synchronizer_nocut.v"                                             -work rx_st_fifo                                                 -cdslib ./cds_libs/rx_st_fifo.cds.lib                                                
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0_mac10g.v"                                                      -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_reset_controller.v"                                                   -work rst_controller                                             -cdslib ./cds_libs/rst_controller.cds.lib                                            
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/altera_reset_synchronizer.v"                                                 -work rst_controller                                             -cdslib ./cds_libs/rst_controller.cds.lib                                            
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_avalon_st_adapter_001.v"                                             -work avalon_st_adapter_001                                      -cdslib ./cds_libs/avalon_st_adapter_001.cds.lib                                     
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_avalon_st_adapter.v"                                                 -work avalon_st_adapter                                          -cdslib ./cds_libs/avalon_st_adapter.cds.lib                                         
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_pll_0.vo"                                                            -work pll_0                                                      -cdslib ./cds_libs/pll_0.cds.lib                                                     
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_multiplexer_0.sv"                                                    -work multiplexer_0                                              -cdslib ./cds_libs/multiplexer_0.cds.lib                                             
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_3.v"                                                             -work mac_3                                                      -cdslib ./cds_libs/mac_3.cds.lib                                                     
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_2.v"                                                             -work mac_2                                                      -cdslib ./cds_libs/mac_2.cds.lib                                                     
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_1.v"                                                             -work mac_1                                                      -cdslib ./cds_libs/mac_1.cds.lib                                                     
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_mac_0.v"                                                             -work mac_0                                                      -cdslib ./cds_libs/mac_0.cds.lib                                                     
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/packetstorage.sv"                                                            -work eth                                                        -cdslib ./cds_libs/eth.cds.lib                                                       
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../eth4to1/simulation/submodules/eth4to1_demultiplexer_0.sv"                                                  -work demultiplexer_0                                            -cdslib ./cds_libs/demultiplexer_0.cds.lib                                           
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../eth4to1/simulation/eth4to1.v"                                                                                                                                                                                                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/altera_xcvr_functions.sv"                                                  -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/alt_reset_ctrl_lego.sv"                                                    -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/alt_reset_ctrl_tgx_cdrauto.sv"                                             -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/alt_xcvr_resync.sv"                                                        -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/alt_xcvr_csr_common_h.sv"                                                  -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/alt_xcvr_csr_common.sv"                                                    -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/alt_xcvr_csr_pcs8g_h.sv"                                                   -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/alt_xcvr_csr_pcs8g.sv"                                                     -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/alt_xcvr_csr_selector.sv"                                                  -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/alt_xcvr_mgmt2dec.sv"                                                      -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/altera_wait_generate.v"                                                    -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/altera_10gbaser_phy_clock_crosser.v"                                       -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/altera_10gbaser_phy_pipeline_stage.sv"                                     -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/altera_10gbaser_phy_pipeline_base.v"                                       -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/altera_std_synchronizer_nocut.v"                                           -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/csr_pcs10gbaser_h.sv"                                                      -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/csr_pcs10gbaser.sv"                                                        -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_pcs.sv"                                                                 -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_pcs_ch.sv"                                                              -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_pma.sv"                                                                 -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_reconfig_bundle_to_xcvr.sv"                                             -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_reconfig_bundle_to_ip.sv"                                               -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_reconfig_bundle_merger.sv"                                              -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_rx_pma.sv"                                                              -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_tx_pma.sv"                                                              -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_tx_pma_ch.sv"                                                           -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_xcvr_h.sv"                                                              -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_xcvr_avmm_csr.sv"                                                       -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_xcvr_avmm_dcd.sv"                                                       -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_xcvr_avmm.sv"                                                           -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_xcvr_data_adapter.sv"                                                   -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_xcvr_native.sv"                                                         -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_xcvr_plls.sv"                                                           -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_hssi_10g_rx_pcs_rbc.sv"                                                 -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_hssi_10g_tx_pcs_rbc.sv"                                                 -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_hssi_8g_rx_pcs_rbc.sv"                                                  -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_hssi_8g_tx_pcs_rbc.sv"                                                  -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_hssi_8g_pcs_aggregate_rbc.sv"                                           -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_hssi_common_pcs_pma_interface_rbc.sv"                                   -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_hssi_common_pld_pcs_interface_rbc.sv"                                   -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_hssi_pipe_gen1_2_rbc.sv"                                                -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_hssi_pipe_gen3_rbc.sv"                                                  -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_hssi_rx_pcs_pma_interface_rbc.sv"                                       -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_hssi_rx_pld_pcs_interface_rbc.sv"                                       -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_hssi_tx_pcs_pma_interface_rbc.sv"                                       -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_hssi_tx_pld_pcs_interface_rbc.sv"                                       -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_xcvr_10gbaser_nr.sv"                                                    -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/sv_xcvr_10gbaser_native.sv"                                                -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/altera_xcvr_10gbaser.sv"                                                   -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/altera_xcvr_reset_control.sv"                                              -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/alt_xcvr_reset_counter.sv"                                                 -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/alt_xcvr_arbiter.sv"                                                       -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog -sv $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../mac10g_sim/altera_xcvr_10gbaser/alt_xcvr_m2s.sv"                                                           -work mac10g                                                     -cdslib ./cds_libs/mac10g.cds.lib                                                    
  ncvlog $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/../mac10g_sim/mac10g.v"                                                                                                                                                                                                                                             
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  export GENERIC_PARAM_COMPAT_CHECK=1
  ncelab -access +w+r+c -namemap_mixgen $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi
