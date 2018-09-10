# TCL File Generated by Component Editor 16.1
# Thu Jul 05 12:52:58 EDT 2018
# DO NOT MODIFY


# 
# ethpack_control "Ethernet Packet System Control" v1.0
#  2018.07.05.12:52:58
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module ethpack_control
# 
set_module_property DESCRIPTION ""
set_module_property NAME ethpack_control
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME "Ethernet Packet System Control"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL regioncontrol
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file regioncontrol.sv SYSTEM_VERILOG PATH regioncontrol.sv TOP_LEVEL_FILE

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL regioncontrol
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file regioncontrol.sv SYSTEM_VERILOG PATH regioncontrol.sv


# 
# parameters
# 
add_parameter REGIONDEFAULT STD_LOGIC_VECTOR 3
set_parameter_property REGIONDEFAULT DEFAULT_VALUE 3
set_parameter_property REGIONDEFAULT DISPLAY_NAME REGIONDEFAULT
set_parameter_property REGIONDEFAULT TYPE STD_LOGIC_VECTOR
set_parameter_property REGIONDEFAULT UNITS None
set_parameter_property REGIONDEFAULT ALLOWED_RANGES 0:511
set_parameter_property REGIONDEFAULT HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset reset Input 1


# 
# connection point enable
# 
add_interface enable avalon end
set_interface_property enable addressUnits WORDS
set_interface_property enable associatedClock clock
set_interface_property enable associatedReset reset
set_interface_property enable bitsPerSymbol 8
set_interface_property enable burstOnBurstBoundariesOnly false
set_interface_property enable burstcountUnits WORDS
set_interface_property enable explicitAddressSpan 0
set_interface_property enable holdTime 0
set_interface_property enable linewrapBursts false
set_interface_property enable maximumPendingReadTransactions 0
set_interface_property enable maximumPendingWriteTransactions 0
set_interface_property enable readLatency 0
set_interface_property enable readWaitTime 1
set_interface_property enable setupTime 0
set_interface_property enable timingUnits Cycles
set_interface_property enable writeWaitTime 0
set_interface_property enable ENABLED true
set_interface_property enable EXPORT_OF ""
set_interface_property enable PORT_NAME_MAP ""
set_interface_property enable CMSIS_SVD_VARIABLES ""
set_interface_property enable SVD_ADDRESS_GROUP ""

add_interface_port enable avs_enable_address address Input 3
add_interface_port enable avs_enable_write write Input 1
add_interface_port enable avs_enable_read read Input 1
add_interface_port enable avs_enable_writedata writedata Input 32
add_interface_port enable avs_enable_readdata readdata Output 32
set_interface_assignment enable embeddedsw.configuration.isFlash 0
set_interface_assignment enable embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment enable embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment enable embeddedsw.configuration.isPrintableDevice 0


# 
# connection point prcontrol
# 
add_interface prcontrol avalon end
set_interface_property prcontrol addressUnits WORDS
set_interface_property prcontrol associatedClock clock
set_interface_property prcontrol associatedReset reset
set_interface_property prcontrol bitsPerSymbol 8
set_interface_property prcontrol burstOnBurstBoundariesOnly false
set_interface_property prcontrol burstcountUnits WORDS
set_interface_property prcontrol explicitAddressSpan 0
set_interface_property prcontrol holdTime 0
set_interface_property prcontrol linewrapBursts false
set_interface_property prcontrol maximumPendingReadTransactions 0
set_interface_property prcontrol maximumPendingWriteTransactions 0
set_interface_property prcontrol readLatency 0
set_interface_property prcontrol readWaitTime 1
set_interface_property prcontrol setupTime 0
set_interface_property prcontrol timingUnits Cycles
set_interface_property prcontrol writeWaitTime 0
set_interface_property prcontrol ENABLED true
set_interface_property prcontrol EXPORT_OF ""
set_interface_property prcontrol PORT_NAME_MAP ""
set_interface_property prcontrol CMSIS_SVD_VARIABLES ""
set_interface_property prcontrol SVD_ADDRESS_GROUP ""

add_interface_port prcontrol avs_prcontrol_address address Input 1
add_interface_port prcontrol avs_prcontrol_write write Input 1
add_interface_port prcontrol avs_prcontrol_read read Input 1
add_interface_port prcontrol avs_prcontrol_writedata writedata Input 32
add_interface_port prcontrol avs_prcontrol_readdata readdata Output 32
set_interface_assignment prcontrol embeddedsw.configuration.isFlash 0
set_interface_assignment prcontrol embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment prcontrol embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment prcontrol embeddedsw.configuration.isPrintableDevice 0


# 
# connection point region_enable
# 
add_interface region_enable conduit end
set_interface_property region_enable associatedClock clock
set_interface_property region_enable associatedReset ""
set_interface_property region_enable ENABLED true
set_interface_property region_enable EXPORT_OF ""
set_interface_property region_enable PORT_NAME_MAP ""
set_interface_property region_enable CMSIS_SVD_VARIABLES ""
set_interface_property region_enable SVD_ADDRESS_GROUP ""

add_interface_port region_enable coe_region_enable export Output 8


# 
# connection point region_freeze
# 
add_interface region_freeze conduit end
set_interface_property region_freeze associatedClock clock
set_interface_property region_freeze associatedReset ""
set_interface_property region_freeze ENABLED true
set_interface_property region_freeze EXPORT_OF ""
set_interface_property region_freeze PORT_NAME_MAP ""
set_interface_property region_freeze CMSIS_SVD_VARIABLES ""
set_interface_property region_freeze SVD_ADDRESS_GROUP ""

add_interface_port region_freeze coe_region_freeze export Output 8

