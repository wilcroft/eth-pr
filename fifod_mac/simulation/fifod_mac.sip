set_global_assignment -entity "eth4to1" -library "lib_eth4to1" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "eth4to1" -library "lib_eth4to1" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "eth4to1" -library "lib_eth4to1" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_eth4to1" -name SPD_FILE [file join $::quartus(sip_path) "../fifod_mac.spd"]
set_global_assignment -library "lib_eth4to1" -name MISC_FILE [file join $::quartus(sip_path) "../../eth4to1.qsys"]

set_global_assignment -library "lib_eth4to1" -name MISC_FILE [file join $::quartus(sip_path) "eth4to1.v"]
set_global_assignment -library "lib_eth4to1" -name MISC_FILE [file join $::quartus(sip_path) "submodules/eth4to1_demultiplexer_0.sv"]
